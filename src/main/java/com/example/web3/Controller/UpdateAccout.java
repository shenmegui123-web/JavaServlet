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


@WebServlet(name = "LoadForUpdate", value = "/LoadForUpdate")
public class UpdateAccout extends HttpServlet {
    @Override
    //show
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int stuId = Integer.parseInt(id);
        Accout stu = new StuDbUtil().getAccountById(stuId);
        request.setAttribute("accout",stu);
        RequestDispatcher dispatcher = request.getRequestDispatcher("update.jsp");
        dispatcher.forward(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("username");
        int accout = Integer.parseInt(request.getParameter("accout"));
        String mail = request.getParameter("mail");
        new StuDbUtil().updateAccout(name, accout, mail);
        List<Accout> accouts = new StuDbUtil().getAllAccouts();//将getAllStudent获得的信息放入students中
        request.setAttribute("stu_list", accouts);//将 students 列表作为请求属性存储在 HttpServletRequest 对象中。可以传入jsp文件中。这里的 "stu_list" 是属性的名称，能够在后续的请求中通过这个名称访问到这个属性。
        RequestDispatcher dispatcher = request.getRequestDispatcher("show.jsp");//最行两行是实现将数据传到并打开jsp文件
        dispatcher.forward(request, response);
    }
}
