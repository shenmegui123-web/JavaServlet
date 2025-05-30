<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>我的网站首页</title>
  <link rel="stylesheet" href="大作业/style.css">
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
      <form action="SearchServlet" method="post">
        <input placeholder="请输入..." name="keyword" type="text">
        <button type="submit"></button>
      </form>
    </div>

    <ul class="navbar-r">
      <li><a href="login.jsp">登录</a></li>
      <li><a href="HistoryServlet">历史</a></li>
      <li><a href="musicCollection">收藏</a></li>
    </ul>
  </nav>

</header>
<main class="content">

  <section id="home">
    <h2>歌单推荐</h2>
    <div class="image-container">  <!-- 这样才能实现每一个图片都有三角形效果 -->
      <a href="musicPlayer"><img src="大作业/images/1.png" width="15%" height="15%"></a>
      <p style="font-size: 16px; font-weight: bold; color: #333;">抖音热歌：一夜爆火首首好听</p>
      <p style="font-size: 14px; color: #999;">播放量120w</p>
      <div class="triangle"></div> <!-- 三角形 -->
    </div>
    <div class="image-container">
      <a href="首页.html"><img src="大作业/images/2.png" width="15%" height="15%"></a>
      <p>抖音热歌：一夜爆火首首好听</p>
      <div class="triangle"></div> <!-- 三角形 -->
    </div>
    <div class="image-container">
      <a href="首页.html"><img src="大作业/images/3.png" width="15%" height="15%"></a>
      <div class="triangle"></div> <!-- 三角形 -->
      <p>抖音热歌：一夜爆火首首好听</p>
    </div>
    <div class="image-container">
      <a href="首页.html"><img src="大作业/images/4.png" width="15%" height="15%"></a>
      <div class="triangle"></div> <!-- 三角形 -->
      <p>抖音热歌：一夜爆火首首好听</p>
    </div>
    <div class="image-container">
      <a href="首页.html"><img src="大作业/images/5.png" width="15%" height="15%"></a>
      <div class="triangle"></div> <!-- 三角形 -->
      <p>抖音热歌：一夜爆火首首好听</p>
    </div>

  </section>
  <section>
    <h2>歌单推荐</h2>
  </section>
</main>

<main class="content1">

  <nav class="nav2">
    <a href="#section1" onclick="showSection('section1')">最新</a>
    <a href="#section2" onclick="showSection('section2')">内地 </a>
    <a href="#section3" onclick="showSection('section3')">港台 </a>
    <a href="#section4" onclick="showSection('section4')">欧美 </a>
    <a href="#section5" onclick="showSection('section5')">韩国 </a>
    <a href="#section6" onclick="showSection('section6')">日本 </a>
  </nav>

  <section id="section1" class="active">
    <div class="section-container">
      <div class="song">
        <img src="大作业/篮球.jpg" alt="封面图1">
        <div class="song-info">
          <p class="song-title">来都来</p>
          <p class="song-artist">徐惟喆</p>
        </div>
        <span class="song-duration">03:35</span>
      </div>

      <div class="song">
        <img src="大作业/1.gif" alt="封面图2">
        <div class="song-info">
          <p class="song-title">心茫 《斗罗大陆之燃魂战》电...</p>
          <p class="song-artist">张韶涵</p>
        </div>
        <span class="song-duration">03:12</span>
      </div>
    </div>
  </section>
  <section id="section2">
    <div class="section-container">
      <div class="song">
        <img src="大作业/篮球.jpg" alt="封面图1">
        <div class="song-info">
          <p class="song-title">来都来</p>
          <p class="song-artist">徐惟喆</p>
        </div>
        <span class="song-duration">03:35</span>
      </div>

      <div class="song">
        <img src="大作业/1.gif" alt="封面图2">
        <div class="song-info">
          <p class="song-title">心茫 《斗罗大陆之燃魂战》电...</p>
          <p class="song-artist">张韶涵</p>
        </div>
        <span class="song-duration">03:12</span>
      </div>
  </section>
  <section id="section3">
    <div class="section-container">
      <div class="song">
        <img src="大作业/篮球.jpg" alt="封面图1">
        <div class="song-info">
          <p class="song-title">来都来</p>
          <p class="song-artist">徐惟喆</p>
        </div>
        <span class="song-duration">03:35</span>
      </div>

      <div class="song">
        <img src="大作业/1.gif" alt="封面图2">
        <div class="song-info">
          <p class="song-title">心茫 《斗罗大陆之燃魂战》电...</p>
          <p class="song-artist">张韶涵</p>
        </div>
        <span class="song-duration">03:12</span>
      </div>
  </section>
  <section id="section4">
    <div class="section-container">
      <div class="song">
        <img src="大作业/篮球.jpg" alt="封面图1">
        <div class="song-info">
          <p class="song-title">来都来</p>
          <p class="song-artist">徐惟喆</p>
        </div>
        <span class="song-duration">03:35</span>
      </div>

      <div class="song">
        <img src="大作业/1.gif" alt="封面图2">
        <div class="song-info">
          <p class="song-title">心茫 《斗罗大陆之燃魂战》电...</p>
          <p class="song-artist">张韶涵</p>
        </div>
        <span class="song-duration">03:12</span>
      </div>
  </section>
  <section id="section5">
    <div class="section-container">
      <div class="song">
        <img src="大作业/篮球.jpg" alt="封面图1">
        <div class="song-info">
          <p class="song-title">来都来</p>
          <p class="song-artist">徐惟喆</p>
        </div>
        <span class="song-duration">03:35</span>
      </div>

      <div class="song">
        <img src="大作业/1.gif" alt="封面图2">
        <div class="song-info">
          <p class="song-title">心茫 《斗罗大陆之燃魂战》电...</p>
          <p class="song-artist">张韶涵</p>
        </div>
        <span class="song-duration">03:12</span>
      </div>
  </section>
  <section id="section6">
    <h2>部分 6</h2>
    <p>这是部分 6 的内容。</p>
  </section>

</main>



<script>
  function showSection(sectionId) {
    // 隐藏所有部分
    const sections = document.querySelectorAll('section');
    sections.forEach(section => {
      section.classList.remove('active');
    });

    // 显示被选中的部分
    const activeSection = document.getElementById(sectionId);
    if (activeSection) {
      activeSection.classList.add('active');
    }
  }

</script>








<footer class="footer">
  <p>shenmegui123</p>
</footer>
</body>
</html>