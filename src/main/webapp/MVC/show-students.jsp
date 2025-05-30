<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.web3.Model.Accout" %>  <!-- 确保导入正确的包 -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>学生表单</title>
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
        table {border-collapse: collapse; width: 100%;}
        th, td {border: 1px solid black; padding: 8px; text-align: left;}
    </style>
</head>
<body>
<%
    List<Accout> students = (List<Accout>) request.getAttribute("stu_list");
%>
<h1>Student List</h1>
<a href="add-student.jsp">添加学生</a>
<table>
    <thead>
    <tr>
        <th>学号</th>
        <th>姓名</th>
        <th>年龄</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <%
        if (students != null && !students.isEmpty()) {
            for (Accout student : students) {
    %>
    <tr>
        <td><%= student.getStuNo() %></td>
        <td><%= student.getStuName() %></td>
        <td><%= student.getMajor() %></td>
        <td><a href='LoadStudentForUpdate?id=<%=student.getStuNo()%>'>修改</a> &nbsp;<a href='DeleteStudents?id=<%=student.getStuNo()%>'>删除</a></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="3">No students found.</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<a href="welcome.jsp">Back to Homepage</a>
</body>
</html>