<%@ page import="javax.xml.crypto.dsig.spec.XSLTTransformParameterSpec" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: 李发起
  Date: 2024/11/1
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String Accout=request.getParameter("accout");
    int accout=Integer.parseInt(Accout);
    String password=request.getParameter("password");
    Connection conn=null;
    Statement stat=null;
    PreparedStatement checkStmt = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","lifaqi666");
        String checkSql = "SELECT COUNT(*) FROM login WHERE accout = ?";
        checkStmt = conn.prepareStatement(checkSql);
        checkStmt.setInt(1, accout);
        ResultSet rs = checkStmt.executeQuery();
        if (rs.next() && rs.getInt(1) > 0) {
            out.println("<p>该账户已存在，请使用其他账户</p>");
            out.println("<a href='register.jsp'>返回注册页面</a>");
            return;
        }
        String sql="INSERT INTO login(accout,password)VALUES("+accout+",'"+password+"')";
        stat=conn.createStatement();//将stat作为数据表哭连接的对象，使stat可以进行sql操作
        stat.executeUpdate(sql);
    }catch (Exception e) {
        throw e;
    }finally {//最后执行的代码块，不论 try 是否成功，都会执行这一部分
        if(stat!=null)
            stat.close();// 如果 stat 不为 null，关闭 Statement 对象以释放资源。
        if (conn!=null)
            conn.close();//如果 conn 不为 null，关闭数据库连接以释放资源。
        if (checkStmt != null)
            checkStmt.close();
    }
%>
<h1>注册成功</h1>
<a href="register.jsp">返回注册页面</a>
</body>
</html>
