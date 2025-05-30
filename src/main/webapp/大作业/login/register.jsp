<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body{
            background-image: url('images/background.png');
            background-repeat: no-repeat;
            background-size: cover;
            font-family: Arial, sans-serif;  /*字体*/
            display: flex;
            justify-content: center;
            align-items: center;
            height:100vh;
            margin:0;
        }

        .container {
            background-color: rgb(255, 255, 255);
            padding:20px;  /*行内边距*/
            border-radius:5px;  /*边角半径为5像素，变得更圆润*/
            width:400px;
            height:600px;
        }

        h2 {
            text-align: center;
            margin-bottom:20px;
        }

        .form-group {
            margin-bottom:15px;
        }

        label {
            display: block;
            margin-bottom:5px;
        }

        input {
            width:100%;
            padding:10px;
            border:1px solid #ccc;
            border-radius:5px;
            text-align:center;
            color: #b30000;
        }

        button {
            border-radius: 20px;/*提交边框设计*/
            width:100%;
            padding:10px;
            background-color: #007BFF;
            color: white;
            border: none;
            font-size:16px;
        }

        button:hover {
            background-color: #0056b3;
        }
        .login{
            text-align: center;
        }
    </style>
    <title>注册界面</title>
</head>
<body>
    <div class="container">
    <img src="logo.png" alt="系统Logo" class="logo"> <!-- Logo 图片 -->
    <h2>注册</h2>
    <form action="registerbehind.jsp" method="post">
        <div class="form-group">
            <label for="username">用户名</label>
            <input type="text" id="user" name="username" required>
        </div>
        <div class="form-group">
            <label for="username">账号</label>
            <input type="text" id="username" name="accout" required>
        </div>
        <div class="form-group">
            <label for="password">密码</label>
            <input type="password" id="password" name="password" placeholder="至少八位数字" required>
        </div>
        <div class="form-group">
            <label for="confirm-password">确认密码</label>
            <input type="password" id="confirm-password" name="confirm-password" required>
        </div>
        <div class="form-group">
            <label for="email">电子邮箱</label>
            <input type="email" id="email" name="email" required>
        </div>
        <button type="submit">注册</button>
    </form>
        <div class="login">
            <p>已有账号？<a href="login.jsp">立即登录</a></p>
        </div>
        </form>
</body>
</html>
