<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2024/10/11
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body{
            background-color: #f5f7fa;
            text-align: center;
        }
        table {
          margin: auto;/*居中表格*/
            text-align: center;
            background-color: #ffffff;
        }
        tr:hover {
            background-color: #e1e1e1;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover{
            color: #7a1212;
            text-decoration: underline; /* 悬停时下划线 */
        }
    </style>
</head>
<body>
<h1>学生信息管理</h1>
<table border="1" cellspacing="0" width="400px">
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>专业</th>
            <th>操作</th>
        </tr>
    <a href="ShowStudents">添加</a>
<br>
<%
    //1.链接数据库
    //1.1加载数据库驱动
    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    }
    //1.2 connect to the db server
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","lifaqi666");

    //SQL语句
    String sql="select * from stu";


    Statement stat = conn.createStatement();//使stat可以进行sql语句

    ResultSet resultSet = stat.executeQuery(sql);// 执行 SQL 查询语句 sql，将返回的结果集（ResultSet）赋值给 resultSet变量。
    //ResultSet 是一种表格型的结构，包含了查询返回的记录行。
    while (resultSet.next()){//while 循环遍历 resultSet 中的记录。每调用一次 next() 方法，光标移动到下一行，直到没有更多的行可读取为止。
        int stuNo = resultSet.getInt("id");

        String stuName = resultSet.getNString("name");

        String stumajor = resultSet.getNString("major");


        out.println("<tr><td>"+stuNo+"</td><td>"+stuName+"</td><td>"+stumajor+"</td><td><a href='update2.jsp?id="+stuNo+"'>修改</a> &nbsp;"+"<a href='delete.jsp?id="+stuNo+"'>删除</a></td></th>");
    }

%>
</body>
</html>