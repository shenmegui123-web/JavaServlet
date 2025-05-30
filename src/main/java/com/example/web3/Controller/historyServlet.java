package com.example.web3.Controller;

import com.example.web3.Model.Song;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HistoryServlet", value = "/HistoryServlet")
public class historyServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Song> songs = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "lifaqi666")) {
                String sql = "SELECT name, author, path FROM history";
                try (PreparedStatement pstmt = conn.prepareStatement(sql);
                     ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        String name = rs.getString("name");
                        String author = rs.getString("author");
                        String path = rs.getString("path");
                        songs.add(new Song(name, author, path));
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            //用于在Web应用程序中处理异常情况，以便可以在后续的视图页面（如JSP）中显示给用户。
            request.setAttribute("error", "An error occurred: " + e.getMessage());
        }
        //这段代码的作用是将一个名为 "songs" 的属性添加到 HttpServletRequest 对象中
        request.setAttribute("songs", songs);
        request.getRequestDispatcher("/history.jsp").forward(request, response);
    }
}