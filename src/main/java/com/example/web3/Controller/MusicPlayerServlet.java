package com.example.web3.Controller;

import com.example.web3.Model.Song;
import com.example.web3.StuDbUtil;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
//首页歌单推荐
@WebServlet(name = "MusicPlayer", value = "/musicPlayer")
public class MusicPlayerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取歌曲列表并设置为请求属性
        List<Song> songs = StuDbUtil.getAllSongs();
        request.setAttribute("songs", songs);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/musicPlayer.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("addFavorite".equals(action)) {
            String title = request.getParameter("title");
            String artist = request.getParameter("artist");
            String songSrc = request.getParameter("songSrc");
            boolean result = StuDbUtil.addFavorite(title, artist, songSrc);
            response.getWriter().write(result ? "Song added to favorites!" : "Song already exists in favorites.");
        } else if ("addHistory".equals(action)) {
            String title = request.getParameter("title");
            String artist = request.getParameter("artist");
            String songSrc = request.getParameter("songSrc");
            boolean result = StuDbUtil.addHistory(title, artist, songSrc);
            response.getWriter().write(result ? "Playback history added!" : "Failed to add playback history.");
        }
    }
}