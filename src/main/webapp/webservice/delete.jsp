<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %><%--
 Created by IntelliJ IDEA.
 User: pc Date:2024/10/11 Time:14:44 To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Student</title>
</head>

<body>
<%
    request.setCharacterEncoding("UTF-8");
    String stuNo = request.getParameter("id");
    int stuno = Integer.parseInt(stuNo);

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "lifaqi666");

        String sql = "DELETE FROM stu WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, stuno);

        int rowsAffected = pstmt.executeUpdate();
        if (rowsAffected >0) {
            out.println("<p>学号" + stuno + " 删除成功.</p>");
        } else {
            out.println("<p>没有找到该学号 " + stuno + ".</p>");
        }
    } catch (Exception e) {
        out.println("<p>错误: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

<a href="首页.jsp">返回首页</a>
</body>
</html>