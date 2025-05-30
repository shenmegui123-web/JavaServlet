<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>标题</title>
    <style>
        body {
            font-family: Arial, sans-serif; /* 字体 */
            text-align: center;
        }

        .form-container {
            background-color: #fff; /* 表单背景颜色 */
            border-radius: 8px; /* 圆角 */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* 阴影效果 */
            padding: 20px; /* 内边距 */
            width: 300px; /* 固定宽度 */
        }

        h2 {
            text-align: center; /* 标题居中 */
            margin-bottom: 20px; /* 下边距 */
            color: #333; /* 标题颜色 */
        }

        label {
            display: block; /* 块级显示 */
            margin-bottom: 8px; /* 标签下边距 */
            color: #555; /* 标签颜色 */
        }

        input[type="text"],
        select {
            width: 20%; /* 全宽 */
            padding: 10px; /* 内边距 */
            margin-bottom: 15px; /* 下边距 */
            border: 1px solid #ddd; /* 边框 */
            border-radius: 4px; /* 圆角 */
            box-sizing: border-box; /* 包括内边距和边框在内 */
        }

        input[type="submit"] {
            background-color: #007bff; /* 按钮背景颜色 */
            color: white; /* 按钮文本颜色 */
            border: none; /* 无边框 */
            padding: 10px; /* 内边距 */
            border-radius: 4px; /* 圆角 */
            cursor: pointer; /* 鼠标悬停变为手指 */
            font-size: 16px; /* 字体大小 */
            width: 20%; /* 按钮全宽 */
            transition: background-color 0.3s; /* 背景色变化 */
        }

        input[type="submit"]:hover {
            background-color: #0056b3; /* 悬停时按钮颜色 */
        }
    </style>
</head>
<body>
    <h1>修改界面</h1>
    <br>
        <%
 request.setCharacterEncoding("UTF-8");
 String stuNo = request.getParameter("id");
 int stuno = Integer.parseInt(stuNo);
 // 数据库连接变量
 Connection conn = null;
 PreparedStatement pstmt = null;
 ResultSet resultSet = null;

 String stuName = "";
 String stumajor = "";

 try {
 // 加载数据库驱动
 Class.forName("com.mysql.jdbc.Driver");

 //连接数据库
 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "lifaqi666");

 // 准备SQL语句
 String sql = "select * from stu where id=?";
 pstmt = conn.prepareStatement(sql);
 pstmt.setInt(1, stuno);
 // 执行查询
 resultSet = pstmt.executeQuery();
 // 修正的方法 //处理结果集
 if (resultSet.next()) {//用来判断 resultSet（结果集）是否有下一条记录。如果有记录，进入 if语句块。
 stuno = resultSet.getInt("id");
 stuName = resultSet.getNString("name");
 stumajor = resultSet.getNString("major");
 }

 } catch (ClassNotFoundException e) {
 out.println("找不到数据库驱动: " + e.getMessage()); // 改进的错误处理
 } catch (SQLException e) {
 out.println("SQL错误: " + e.getMessage());
 } finally {
 //关闭资源
 if (resultSet != null)
     try {
         resultSet.close();
     } catch (SQLException e) {
         e.printStackTrace();
     }
 if (pstmt != null)
     try {
     pstmt.close();
    } catch (SQLException e) {
     e.printStackTrace();
    }
 if (conn != null)
     try {
         conn.close();
     } catch (SQLException e) {
         e.printStackTrace();
     }
 }
 %>
    <form action="update.jsp" method="post">
        学号：<input type="text" name="stuno" value="<%= stuno%>" readonly="readonly"><br>
        姓名：<input type="text" name="stuname" value="<%= stuName %>"><br>

        专业：
        <select name="major" id="major">
            <option value="软件工程" <%= "软件工程".equals(stumajor) ? "selected" : "" %>>软件工程</option>
            <option value="计算机科学与技术" <%= "计算机科学与技术".equals(stumajor) ? "selected" : "" %>>计算机科学与技术</option>
            <option value="人工智能" <%= "人工智能".equals(stumajor) ? "selected" : "" %>>人工智能</option>
            <option value="自动化" <%= "自动化".equals(stumajor) ? "selected" : "" %>>自动化</option>
        </select><br>

        <input type="submit" value="更新">
    </form>
</body>
</html>