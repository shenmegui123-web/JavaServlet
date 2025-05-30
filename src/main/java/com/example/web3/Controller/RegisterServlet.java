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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String account = request.getParameter("accout");
        int accout = Integer.parseInt(account);
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String username = request.getParameter("username");

        StuDbUtil dbUtil = new StuDbUtil();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            if (dbUtil.checkAccountExists(accout)) {
                out.println("<script type='text/javascript'>");
                out.println("alert('该账户已存在，请使用其他账户');");
                out.println("history.back();");
                out.println("</script>");
                return;
            }
            dbUtil.insertAccount(new Login(username, accout, Integer.parseInt(password), email));
            request.getRequestDispatcher("首页.jsp").forward(request, response);
        } catch (Exception e) {
            out.println("<script type='text/javascript'>");
            out.println("alert('注册失败，请稍后再试');");
            out.println("history.back();");
            out.println("</script>");
        }
    }
}