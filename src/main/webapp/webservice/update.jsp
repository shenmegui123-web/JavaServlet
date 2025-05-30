<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Student</title>
</head>
<body>
<%
    // 设置字符编码
    request.setCharacterEncoding("UTF-8");
    String id= request.getParameter("stuno");//得到数据，但是只能得到string类型
    int stuNo=Integer.parseInt(id);//将string类型转化为int类型

    String stuName=request.getParameter("stuname");
    String major=request.getParameter("major");
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        //连接到数据库
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "lifaqi666");

        // 更新学生记录的 SQL语句
        String sql = "UPDATE stu SET name=?, major=? WHERE id=?";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, stuName); // 设置姓名
        pstmt.setString(2, major); // 设置专业
        pstmt.setInt(3, stuNo); // 设置依据的学生 ID
        // 执行更新操作
        int rowsAffected = pstmt.executeUpdate();//受影响的行数

        // 检查更新操作是否成功
        if (rowsAffected >0) {
%>
<p>学生记录更新成功!</p>
<%
    } else {
%>
<p>更新失败，未找到该学生记录!</p>
<%
    }
    } catch (Exception e) {
    e.printStackTrace(); // 打印异常信息%>
<p>出现异常: <%= e.getMessage() %></p>
<%
    } finally {
    //关闭资源
        if (pstmt != null) {
    try { pstmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    }
    if (conn != null) {
    try { conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    }
    }
%>
<a href="首页.jsp">返回首页</a>
</body>
</html>