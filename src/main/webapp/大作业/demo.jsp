<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的网站首页</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<header id="header">
    <nav class="navbar">
        <ul class="navbar-l">
            <li><a href="home.html">首页</a></li>
            <li><a href="about.html">关于我们</a></li>
            <li><a href="services.html">服务</a></li>
            <li><a href="contact.html">联系我们</a></li>
        </ul>
        <div class="search">
            <form id="searchForm">
                <input placeholder="请输入..." name="keyword" type="text" required>
                <button type="submit">搜索</button>
            </form>
            <div id="searchResults"></div>
        </div>
        <ul class="navbar-r">
            <li><a href="login/login.jsp">登录</a></li>
            <li><a href="history.html">历史</a></li>
            <li><a href="favorites.html">收藏</a></li>
        </ul>
    </nav>
</header>

<main class="content">
    <!-- 其他内容 -->
</main>

<script>
    document.getElementById('searchForm').addEventListener('submit', function(event) {
        event.preventDefault(); // 阻止表单默认提交行为

        var keyword = this.querySelector('input[name="keyword"]').value;

        fetch('SearchServlet?keyword=' + encodeURIComponent(keyword))
            .then(response => response.json())
            .then(data => {
                var resultsDiv = document.getElementById('searchResults');
                resultsDiv.innerHTML = ''; // 清空旧的结果

                if (data.length > 0) {
                    data.forEach(function(song) {
                        var p = document.createElement('p');
                        p.textContent = song.name + ' - ' + song.author;
                        resultsDiv.appendChild(p);
                    });
                } else {
                    resultsDiv.innerHTML = '<p>没有找到相关歌曲。</p>';
                }
            })
            .catch(error => console.error('Error:', error));
    });
</script>

<footer class="footer">
    <p>© 202258503232 李发起.</p>
</footer>

</body>
</html>