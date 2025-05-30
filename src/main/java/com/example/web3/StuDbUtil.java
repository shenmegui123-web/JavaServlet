package com.example.web3;

import com.example.web3.Model.Accout;
import com.example.web3.Model.Login;
import com.example.web3.Model.Song;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StuDbUtil {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/student";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "lifaqi666";

    // 静态初始化块用于加载驱动程序
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("JDBC Driver not found", e);
        }
    }

    // 获取数据库连接
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
    }

    // 执行更新操作并自动关闭资源
    private void executeUpdate(String sql, PreparedStatementSetter pss) {
        //从 JDBC 获取一个数据库连接。
        try (Connection conn = getConnection();
             //使用获得的数据库连接来准备一个预编译的SQL语句。
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            //该方法接受一个 PreparedStatement 参数并设置其参数值。
            pss.setValues(stmt);
            // 执行 SQL 更新操作
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Database error occurred while executing update", e);
        }
    }
    // 获取用户数据
    public List<Accout> getAllAccouts() {
        String sql = "SELECT * FROM login ORDER BY accout";
        List<Accout> Accout = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                //从数据库中读出数据并赋值
                int accout = rs.getInt("accout");
                String mail = rs.getString("mail");
                String username = rs.getString("username");
                Accout.add(new Accout(username, accout, mail));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Database error occurred while fetching all students", e);
        }
        return Accout;
    }

    // 删除学生信息
    public void deleteAccout(int id) {
        String sql = "DELETE FROM login WHERE accout = ?";
        //executeUpdate这个方法内部已经负责获取数据库连接、执行 SQL 语句以及关闭资源
        executeUpdate(sql, ps -> ps.setInt(1, id));
    }

    // 更新学生信息
    public void updateAccout(String name, Integer accout, String mail) {
        String sql = "UPDATE login SET username=?, mail=? WHERE accout=?";
        //这是Lambda表达式的语法，它代表了一个匿名函数。
        executeUpdate(sql, ps -> {
            ps.setString(1, name);
            ps.setString(2, mail);
            ps.setInt(3, accout);
        });
    }

    // 根据ID获取学生信息（更新读取学生数据）
    public Accout getAccountById(int accout) {
        String sql = "SELECT * FROM login WHERE accout = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, accout);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Accout(rs.getString("username"), rs.getInt("accout"), rs.getString("mail"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Database error occurred while fetching student by ID", e);
        }
        return null;
    }



    // 函数式接口用于设置PreparedStatement参数
    //由于 PreparedStatementSetter 是一个函数式接口（通过 @FunctionalInterface 注解标记），可以使用 Lambda 表达式来创建它的实例
    @FunctionalInterface
    //PreparedStatementSetter 接口的作用是为 PreparedStatement 设置参数值提供一个标准的方法。
    interface PreparedStatementSetter {
        void setValues(PreparedStatement ps) throws SQLException;
    }

    public static List<Song> searchSongs(String keyword) {
        List<Song> songs = new ArrayList<>();
        String sql = "SELECT * FROM music WHERE name LIKE ? OR author LIKE ?";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            //"%" + keyword + "%"：这里的 % 是SQL中LIKE操作符使用的通配符，表示任意数量的字符（包括零个字符）。将这个通配符与用户提供的 keyword 组合起来，可以在数据库中查找包含该关键词的所有记录。
            stmt.setString(1, "%" + keyword + "%");
            stmt.setString(2, "%" + keyword + "%");
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Song song = new Song(
                            rs.getString("name"),
                            rs.getString("author"),
                            rs.getString("path")
                    );
                    songs.add(song);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Database error occurred while searching songs", e);
        }
        return songs;
    }
    // 根据ID获取信息
    public Login getAccoutById(int accout) {
        String sql = "SELECT * FROM login WHERE accout = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, accout);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String username = rs.getString("username");
                    int password = rs.getInt("password"); // 保持为int类型
                    String mail = rs.getString("mail");
                    return new Login(username, accout, password, mail);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Database error occurred while fetching student by ID", e);
        }
        return null;
    }

    // 检查账号是否存在
    public boolean checkAccountExists(int accout) throws SQLException {
        String sql = "SELECT COUNT(*) FROM login WHERE accout = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, accout);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    // 插入新账户
    public void insertAccount(Login login) throws SQLException {
        String sql = "INSERT INTO login(accout, password, username, mail) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, login.getAccout());
            stmt.setInt(2, login.getPassword()); // 注意：密码应加密存储
            stmt.setString(3, login.getUsername());
            stmt.setString(4, login.getMail());
            stmt.executeUpdate();
        }
    }
    public static List<Song> getAllSongs() {
        List<Song> songs = new ArrayList<>();
        String sql = "SELECT name, author, path FROM music";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                songs.add(new Song(rs.getString("name"), rs.getString("author"), rs.getString("path")));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Database error occurred while fetching all songs", e);
        }
        return songs;
    }
    public static boolean addFavorite(String title, String artist, String songSrc) {
        String checkSql = "SELECT COUNT(*) FROM love WHERE name = ? AND author = ?";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(checkSql)) {
            pstmt.setString(1, title);
            pstmt.setString(2, artist);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    return false; //歌曲已经存在
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

        String insertSql = "INSERT INTO love (name, author, path) VALUES (?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(insertSql)) {
            pstmt.setString(1, title);
            pstmt.setString(2, artist);
            pstmt.setString(3, songSrc);
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean addHistory(String title, String artist, String songSrc) {
        String insertSql = "INSERT INTO history (name, author, path) VALUES (?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(insertSql)) {
            pstmt.setString(1, title);
            pstmt.setString(2, artist);
            pstmt.setString(3, songSrc);
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public List<Song> getSongs() {
        List<Song> songs = new ArrayList<>();
        String sql = "SELECT name, author, path FROM love";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                songs.add(new Song(rs.getString("name"), rs.getString("author"), rs.getString("path")));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Database error occurred while fetching songs", e);
        }
        return songs;
    }

}