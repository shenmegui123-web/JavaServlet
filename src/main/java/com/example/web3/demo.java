/*package com.example.web3;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import static java.lang.System.out;

public class StuDbUtil {
    private String JDBCURL = "jdbc:mysql://localhost:3306/student";
    private String JDBCUSERNAME = "root";
    private String JDBCPASSWORD = "lifaqi666";

    public StuDbUtil() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    //获取数据库连接
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBCURL, JDBCUSERNAME, JDBCPASSWORD);

    }

    //获取学生数据
    public List<Student> getAllStudent() {
        String sql = "SELECT * FROM stu ORDER BY id";
        List<Student> students = new ArrayList<>();
        try (Connection conn = getConnection();
             Statement stat = conn.createStatement();
             ResultSet rs = stat.executeQuery(sql);
        ) {
            while (rs.next()) {
                String stuName = rs.getString("name");
                int stuNo = rs.getInt("id");
                String major = rs.getString("major");
                Student stu = new Student(stuName, stuNo, major);
                students.add(stu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return students;
    }

    public void DeleteStudent(int id) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            //Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "lifaqi666");
            String sql = "delete from stu where id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException(e);

        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }

    public void updateStudents(int id, String name, String major) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = getConnection();
            String sql = "update stu set name=?, major=? where id =?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, major);
            preparedStatement.setInt(3, id);

            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException();
        } finally {
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }

    }

    public Student getStudentById(int id) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            //Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "lifaqi666");
            String sql = "SELECT * FROM stu WHERE id = ?;";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return new Student(resultSet.getString("name"), resultSet.getInt("id"), resultSet.getString("major"));
            }
            else
                return null;
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (preparedStatement != null)
                try {
                    preparedStatement.close();
                } catch (Exception e) {}

            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }

    public void addStudent(int id, String name, String major) throws SQLException {
        Connection conn = null;
        Statement stat = null;
        PreparedStatement checkStmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "lifaqi666");

            String checkSql = "SELECT COUNT(*) FROM stu WHERE id = ?";
            checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setInt(1, id);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                out.println("<p>该账户已存在，请使用其他账户</p>");
                out.println("<a href='welcome.jsp'>返回注册页面</a>");
                return;
            }

            String sql = "INSERT INTO stu(id, name, major) VALUES (?, ?, ?)";
            PreparedStatement insertStmt = conn.prepareStatement(sql);
            insertStmt.setInt(1, id);
            insertStmt.setString(2, name);
            insertStmt.setString(3, major);
            insertStmt.executeUpdate(); // Execute the insert statement
        } catch (ClassNotFoundException e) {
            // Handle the exception for JDBC Driver not found
            throw new SQLException("JDBC Driver not found", e);
        } finally {
            if (checkStmt != null) checkStmt.close();
            if (stat != null) stat.close();
            if (conn != null) conn.close();
        }
    }
}
*/




