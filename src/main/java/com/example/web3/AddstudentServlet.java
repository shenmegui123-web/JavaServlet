/*package com.example.web3;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "AddstudentServlet", value = "/AddstudentServlet")
public class AddstudentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("stuno");
        String name = request.getParameter("stuname");
        String major = request.getParameter("major");
        if (id != null && name != null && major != null) {
            int stuId = Integer.parseInt(id);
            try {
                new StuDbUtil().addStudent(stuId, name, major);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        List<Student> students = new StuDbUtil().getAllStudent();
        request.setAttribute("stu_list", students);
        RequestDispatcher dispatcher = request.getRequestDispatcher("show.jsp");
        dispatcher.forward(request, response);

    }
}*/