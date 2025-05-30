<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: 李发起
  Date: 2024/10/18
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<%
  //获取学生信息
  request.setCharacterEncoding("UTF-8");
  String id= request.getParameter("stuno");//得到数据，但是只能得到string类型
  int stuNo=Integer.parseInt(id);//将string类型转化为int类型

  String stuName=request.getParameter("stuname");
  String major=request.getParameter("major");
  Connection conn=null;//声明一个数据库连接对象，但还没开始连接re
  Statement stat=null;//Statement 用于发送 SQL语句到数据库并接收结果。初始值为 null
  PreparedStatement checkStmt = null;
  try{
    //连接数据库
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","lifaqi666");
    String checkSql = "SELECT COUNT(*) FROM stu WHERE id = ?";
    checkStmt = conn.prepareStatement(checkSql);
    checkStmt.setInt(1,stuNo);
    ResultSet rs = checkStmt.executeQuery();
    if (rs.next() && rs.getInt(1) > 0) {
      out.println("<p>该账户已存在，请使用其他账户</p>");
      out.println("<a href='web3.jsp'>返回注册页面</a>");
      return;
    }
    String sql="INSERT INTO stu(id,name,major)VALUES("+stuNo+",'"+stuName+"','"+major+"')";
    stat=conn.createStatement();//将stat作为数据表哭连接的对象，使stat可以进行sql操作
    stat.executeUpdate(sql);
  } catch (Exception e) {
    throw e;
  }finally {//最后执行的代码块，不论 try 是否成功，都会执行这一部分
    if(stat!=null)
      stat.close();// 如果 stat 不为 null，关闭 Statement 对象以释放资源。
    if (conn!=null)
      conn.close();//如果 conn 不为 null，关闭数据库连接以释放资源。

  }
%>
<a href="首页.jsp">返回首页</a>
</body>
</html>
