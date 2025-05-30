package com.example.web3.Controller;

import com.example.web3.Model.Login;
import com.example.web3.StuDbUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String account = request.getParameter("accout");
        int accout = Integer.parseInt(account); // 保持为int类型
        String password = request.getParameter("password");

        StuDbUtil dbUtil = new StuDbUtil();
        Login login = dbUtil.getAccoutById(accout); // 假设getStudentById返回Login对象
        //text/html" 表示响应体包含HTML文本,charset=UTF-8" 指定了字符编码为UTF-8。
        response.setContentType("text/html;charset=UTF-8");
        //PrintWriter 对象，它提供了向HTTP响应的主体部分写入字符输出的功能。
        PrintWriter out = response.getWriter();

        if (login != null && login.getPassword() == Integer.parseInt(password)) { // 比较整型密码
            request.getRequestDispatcher("首页.jsp").forward(request, response);
        } else {
            // 输出错误信息到登录页面,
            out.println("<script type='text/javascript'>");
            out.println("alert('账号或密码错误');");
            out.println("history.back();");
            out.println("</script>");
        }
    }
}