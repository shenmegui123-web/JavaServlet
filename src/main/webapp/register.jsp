<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Register</title>
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
</head>
<body>
<div class="container">
  <h2>注册</h2>
  <form action="RegisterServlet" method="post">
    <div class="form-group">
      <label for="accout">账号</label>
      <input type="text" id="accout" name="accout" required>
    </div>
    <div class="form-group">
      <label for="password">密码</label>
      <input type="password" id="password" name="password" required>
    </div>
    <div class="form-group">
      <label for="username">用户名</label>
      <input type="text" id="username" name="username" required>
    </div>
    <div class="form-group">
      <label for="email">邮箱</label>
      <input type="email" id="email" name="email" required>
    </div>
    <button type="submit">注册</button>
  </form>
  <div class="login">
    <p>已有账号？<a href="login.jsp">立即登录</a></p>
  </div>
</div>
</body>
</html>