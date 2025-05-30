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
    Accout accout=(Accout) request.getAttribute("accout");
%>

    <h1>修改客户信息</h1>
    <form action="LoadForUpdate" method="post">
        <label for="username">昵称:</label>
        <input type="text" id="username" name="username" value="<%= accout.getStuName() %>" required/>
        <br><br>
        <label for="accout">账号:</label>
        <input type="text" id="accout" name="accout" value="<%= accout.getStuNo() %>" readonly required/>
        <br><br>
        <label for="mail">邮箱:</label>
        <input type="text" id="mail" name="mail" value="<%= accout.getMajor() %>" readonly required/>
        <input type="submit" value="修改"/>
    </form>
</body>
</html>
