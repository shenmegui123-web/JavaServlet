<%@ page import="com.example.web3.Model.Accout" %><%--
  Created by IntelliJ IDEA.
  User: 李发起
  Date: 2024/11/15
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Accout student=(Accout) request.getAttribute("student");
%>

    <h1>修改学生信息</h1>
    <form action="LoadStudentForUpdate" method="post">
        <label for="stu_name">姓名:</label>
        <input type="text" id="stu_name" name="stu_name" value="<%= student.getStuName() %>" required/>
        <br><br>
        <label for="stu_no">学号:</label>
        <input type="text" id="stu_no" name="stu_no" value="<%= student.getStuNo() %>" readonly required/>
        <br><br>
        <label for="major">专业:</label>
        <select name="major" id="major">
            <option value="软件工程" <%= "软件工程".equals(student.getMajor())?"selected":"" %> >软件工程</option>
            <option value="计算机科学" <%= "计算机科学".equals(student.getMajor())?"selected":"" %>>计算机科学</option>
            <option value="人工智能" <%= "人工智能".equals(student.getMajor())?"selected":"" %>>人工智能</option>
        </select>
        <input type="submit" value="修改"/>
    </form>
</body>
</html>
