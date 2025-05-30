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
</head>
<body>

<%--<a href="ShowStudents">nihao</a>--%>
<%--<h1>hello world!</h1>--%>
<%--<br>--%>
<%--<%--%>
<%--  //1.链接数据库--%>
<%--  //1.1加载数据库驱动--%>
<%--  try {--%>
<%--    Class.forName("com.mysql.jdbc.Driver");--%>
<%--  } catch (ClassNotFoundException e) {--%>
<%--    throw new RuntimeException(e);--%>
<%--  }--%>
<%--  //1.2 connect to the db server--%>
<%--  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","lifaqi666");--%>

<%--  //SQL语句--%>
<%--  String sql="select * from stu";--%>

<%--  //执行SQL语句--%>
<%--            /*Statement接口:--%>

<%--            Statement是一种用于发送SQL语句到数据库的对象。它能够执行SQL查询、更新数据库、并返回结果。--%>
<%--            它不需要预编译SQL语句，因此适用于简单的SQL执行。--%>
<%--            conn对象:--%>

<%--            conn是一个类型为Connection的对象，表示与你的数据库的连接。这是通过JDBC驱动程序与数据库建立的。--%>
<%--            在这行代码之前，通常会有连接的建立，比如通过DriverManager.getConnection(url, user, password)等方式。--%>
<%--            createStatement():--%>

<%--            这个方法会创建一个新的Statement对象。该对象可以用来执行不需要参数的简单SQL语句（例如：SELECT, INSERT, UPDATE, DELETE等）。--%>
<%--            这行代码如果成功执行，会返回一个新的Statement实例并赋值给变量stat。 例如，你可以用stat来执行查询或更新操作。--%>
<%--            executeQuery(String sql):--%>

<%--            这是Statement接口的方法，专门用于执行SQL查询语句。它接受一个SQL字符串作为参数，通常是SELECT语句。--%>
<%--            当你调用executeQuery(sql)时，JDBC会向数据库发送这个SQL查询，并等待数据库返回结果。--%>
<%--            sql:--%>

<%--            这个变量是一个String类型，包含你想要执行的SQL查询。例如，String sql = "SELECT * FROM users";。--%>
<%--            ResultSet对象:--%>

<%--            这个方法的返回值是一个ResultSet对象，它代表了数据库查询结果的集合。--%>
<%--            通过ResultSet，你可以逐行访问查询结果中的数据。*/--%>
<%--  Statement stat = conn.createStatement();//执行简单的查询和更新操作--%>

<%--  ResultSet resultSet = stat.executeQuery(sql);//将操作返回--%>

<%--  //ResultSet肯定是一个类似table的结构--%>
<%--  //处理返回结果--%>
<%--  while (resultSet.next()){--%>
<%--    int stuNo = resultSet.getInt("id");--%>

<%--    String stuName = resultSet.getNString("name");--%>

<%--    String stumajor = resultSet.getNString("major");--%>

<%--    out.println("<br>学号: " + stuNo + "; 姓名："+stuName+";专业："+stumajor);--%>
<%--  }--%>

<%--%>--%>
</body>
</html>