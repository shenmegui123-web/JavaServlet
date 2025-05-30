<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
<h1>学生录入</h1>
<form action="AddstudentServlet" method="post">
    学号：<input type="text" name="stuno" required><br>
    姓名：<input type="text" name="stuname" required><br>

    专业：
    <select name="major" id="major">
        <option value="软件工程">软件工程</option>
        <option value="计算机科学与技术">计算机科学与技术</option>
        <option value="人工智能">人工智能</option>
        <option value="自动化">自动化</option>
    </select><br>

    <input type="submit" value="添加">
</form>
</body>
</html>