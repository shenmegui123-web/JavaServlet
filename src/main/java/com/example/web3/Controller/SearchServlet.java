package com.example.web3.Controller;

import com.example.web3.Model.Song;
import com.example.web3.StuDbUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchServlet", value = "/SearchServlet")
public class SearchServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword").trim(); // 清理输入
        StuDbUtil dbUtil = new StuDbUtil();
        List<Song> songs = dbUtil.searchSongs(keyword);

        request.setAttribute("songs", songs);
        request.getRequestDispatcher("searchResults.jsp").forward(request, response);
    }
}