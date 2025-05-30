package com.example.web3.Controller;

import com.example.web3.Model.Accout;
import com.example.web3.StuDbUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Delete", value = "/Delete")
public class DeleteAccout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        int stuId = Integer.parseInt(id);
        new StuDbUtil().deleteAccout(stuId);
        List<Accout> accouts = new StuDbUtil().getAllAccouts();
        //accouts 列表作为名为 "stu_list" 的属性添加到 HttpServletRequest 对象中
        request.setAttribute("stu_list", accouts);
        //跳转到Show去
        RequestDispatcher dispatcher = request.getRequestDispatcher("Show");
        dispatcher.forward(request,response);

    }

}