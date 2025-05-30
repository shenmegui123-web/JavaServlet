<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        body{
            background-image: url('background.png');
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
            background-color: white;
            padding:20px;  /*行内边距*/
            border-radius:5px;  /*边角半径为5像素，变得更圆润*/
            width:400px;
            height:400px;
        }

        h2 {
            text-align: center;
            margin-bottom:20px;
        }

        .form-group {
            margin-bottom:15px;
        }

        label {''
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
    <title>Login</title>
</head>
<body>
<div class="container">
    <h2>登录</h2>
    <form action="LoginServlet" method="post">
        <div class="form-group">
            <label for="accout">账号</label>
            <input type="text" id="accout" name="accout" required>
        </div>
        <div class="form-group">
            <label for="password">密码</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit">登录</button>
    </form>
    <div class="login">
        <p>没有账号？<a href="register.jsp">立即注册</a></p>
    </div>
</div>
</body>
</html>