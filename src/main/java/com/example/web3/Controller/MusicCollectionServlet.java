package com.example.web3.Controller;

import com.example.web3.StuDbUtil;
import com.example.web3.Model.Song;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "MusicCollectionServlet", urlPatterns = "/musicCollection")
public class MusicCollectionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StuDbUtil model = new StuDbUtil();
        List<Song> songs = model.getSongs();
        request.setAttribute("songs", songs);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/musicCollection.jsp");
        //允许一个Servlet或JSP页面将请求处理权交给另一个资源
        dispatcher.forward(request, response);
    }
}