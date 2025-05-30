<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Music Player</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #121212;
      color: #fff;
      margin: 0;
      padding: 20px;
    }

    .playlist {
      margin-bottom: 20px;
    }

    .playlist button {
      margin-right: 10px;
    }

    .playlist ul {
      list-style-type: none;
      padding: 0;
    }

    .playlist li {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px;
      border-bottom: 1px solid #333;
    }

    .playlist li.playing {
      background-color: #333;
    }

    .player {
      display: flex;
      align-items: center;
      margin-top: 20px;
    }

    .player button {
      margin-right: 10px;
    }

    .player input[type="range"] {
      width: 200px;
    }

    .player span {
      margin-left: 10px;
    }

    .favorite {
      background-color: transparent;
      border: none;
      color: #fff;
      font-size: 20px;
      cursor: pointer;
    }

    .favorite.red {
      color: red;
    }

    .hidden {
      display: none;
    }
  </style>
</head>
<body>
<div class="playlist">
  <ul>
    <li data-song-title="Go Higher" data-song-artist="威神V (WayV)" data-song-src="Josh Vietti - A Thousand Miles.mp3" onclick="playSong(this)">
      <input type="checkbox">
      <span>Go Higher</span>
      <span>威神V (WayV)</span>
      <span>03:17</span>
      <button class="favorite" onclick="toggleFavorite(this)">❤</button>
    </li>
    <li data-song-title="A Thousand Miles" data-song-artist="Josh Vietti" data-song-src="Josh Vietti - A Thousand Miles.mp3" onclick="playSong(this)">
      <input type="checkbox">
      <span>Poppin' Love (心动预告)</span>
      <span>威神V (WayV)</span>
      <span>03:05</span>
      <button class="favorite" onclick="toggleFavorite(this)">❤</button>
    </li>
    <!-- Add more songs here -->
  </ul>
</div>
<div class="player">
  <button onclick="previousTrack()">⏮</button>
  <button onclick="playPause()">▶</button>
  <button onclick="nextTrack()">⏭</button>
  <input type="range" min="0" max="100" value="0" id="seek" onchange="seekTo(this.value)">
  <span id="current-time">00:00</span>
  <span id="total-time">03:17</span>
</div>
<audio id="audio" controls class="hidden"></audio>
<script>
  let audio = document.getElementById('audio');
  let seek = document.getElementById('seek');
  let currentTime = document.getElementById('current-time');
  let totalTime = document.getElementById('total-time');

  function playPause() {
    if (audio.paused || audio.ended) {
      audio.play();
    } else {
      audio.pause();
    }
  }

  function previousTrack() {
    let currentPlaying = document.querySelector('.playlist li.playing');
    if (currentPlaying) {
      let allSongs = Array.from(document.querySelectorAll('.playlist li'));
      let currentIndex = allSongs.indexOf(currentPlaying);
      let newIndex = currentIndex - 1;

      // If at the beginning, loop to the last song
      if (newIndex < 0) {
        newIndex = allSongs.length - 1;
      }

      playSong(allSongs[newIndex]);
    }
  }

  function nextTrack() {
    let currentPlaying = document.querySelector('.playlist li.playing');
    if (currentPlaying) {
      let allSongs = Array.from(document.querySelectorAll('.playlist li'));
      let currentIndex = allSongs.indexOf(currentPlaying);
      let newIndex = currentIndex + 1;

      // If at the end, loop to the first song
      if (newIndex >= allSongs.length) {
        newIndex = 0;
      }

      playSong(allSongs[newIndex]);
    }
  }

  function seekTo(value) {
    audio.currentTime = (value / 100) * audio.duration;
  }

  function updateSeek() {
    if (!isNaN(audio.duration)) {
      seek.value = (audio.currentTime / audio.duration) * 100;
      currentTime.textContent = formatTime(audio.currentTime);
    }
  }

  function toggleFavorite(button) {
    let isFavorite = button.classList.toggle('red');

    if (isFavorite) {
      let songTitle = button.closest('li').dataset.songTitle;
      let songArtist = button.closest('li').dataset.songArtist;
      let songSrc = button.closest('li').dataset.songSrc; // 获取 songSrc

      fetch('?action=addFavorite', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
          title: songTitle,
          artist: songArtist,
          songSrc: songSrc // 添加 songSrc 到请求体中
        })
      })
              .then(response => response.text())
              .then(message => {
                console.log(message); // Optional: show success message
              })
              .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
                button.classList.remove('red');
              });
    }
  }

  function playSong(songElement) {
    let songSrc = songElement.dataset.songSrc;
    let songTitle = songElement.dataset.songTitle;
    let songArtist = songElement.dataset.songArtist;

    // Update the source of the audio element and load it
    audio.src = songSrc;
    audio.load(); // Important for loading the new file

    // Play the selected song
    audio.play();

    // Highlight the currently playing song in the playlist
    document.querySelectorAll('.playlist li').forEach(item => item.classList.remove('playing'));
    songElement.closest('li').classList.add('playing');

    // Record this play action in the history table
    fetch('?action=addHistory', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: new URLSearchParams({
        title: songTitle,
        artist: songArtist,
        songSrc:songSrc
      })
    }).then(response => response.text())
            .then(message => {
              console.log(message); // Optional: show success message
            })
            .catch(error => {
              console.error('There was a problem with the fetch operation:', error);
            });
  }

  audio.addEventListener('timeupdate', updateSeek);
  audio.addEventListener('ended', function () {
    // Optionally implement auto-play next track logic
  });

  // Initialize by selecting the first song - COMMENTED OUT TO PREVENT AUTOPLAY
  // document.querySelector('.playlist li').click();
</script>

<%
  String action = request.getParameter("action");

  if ("addFavorite".equals(action)) {
    String title = request.getParameter("title");
    String artist = request.getParameter("artist");
    String songSrc = request.getParameter("songSrc"); // 获取 songSrc 参数
    if (title != null && artist != null && songSrc != null) { // 检查 songSrc 是否为空
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      try {
        // Load MySQL JDBC driver and establish connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "lifaqi666");

        // Check if the song already exists in the database
        String checkSql = "SELECT COUNT(*) FROM love WHERE name = ? AND author = ?";
        pstmt = conn.prepareStatement(checkSql);
        pstmt.setString(1, title);
        pstmt.setString(2, artist);
        rs = pstmt.executeQuery();

        int count = 0;
        if (rs.next()) {
          count = rs.getInt(1);
        }

        if (count > 0) {
          // Song already exists, inform the user
          response.setContentType("text/plain");
          response.setCharacterEncoding("UTF-8");
          response.getWriter().write("The song \"" + title + "\" by " + artist + " already exists in your favorites.");
        } else {
          // Insert the new song into the database
          String insertSql = "INSERT INTO love (name, author, path) VALUES (?, ?, ?)";
          pstmt = conn.prepareStatement(insertSql);
          pstmt.setString(1, title);
          pstmt.setString(2, artist);
          pstmt.setString(3, songSrc); // 使用 songSrc 参数
          int result = pstmt.executeUpdate();

          // Respond with success or failure message
          response.setContentType("text/plain");
          response.setCharacterEncoding("UTF-8");
          response.getWriter().write(result > 0 ? "Song added to favorites!" : "Failed to add song.");
        }
      } catch (ClassNotFoundException | SQLException e) {
        response.getWriter().write("Error: " + e.getMessage());
      } finally {
        // Close resources in reverse order of their opening
        try { if (rs != null) rs.close(); } catch (SQLException ignore) {}
        try { if (pstmt != null) pstmt.close(); } catch (SQLException ignore) {}
        try { if (conn != null) conn.close(); } catch (SQLException ignore) {}
      }
    } else {
      response.getWriter().write("Invalid parameters.");
    }
  } else if ("addHistory".equals(action)) {
    String title = request.getParameter("title");
    String artist = request.getParameter("artist");
    String songSrc = request.getParameter("songSrc");

    if (title != null && artist != null) {
      Connection conn = null;
      PreparedStatement pstmt = null;

      try {
        // Load MySQL JDBC driver and establish connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "lifaqi666");

        // Insert the new history record into the database
        String insertSql = "INSERT INTO history (name, author,path) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(insertSql);
        pstmt.setString(1, title);
        pstmt.setString(2, artist);
        pstmt.setString(3,songSrc);
        int result = pstmt.executeUpdate();

        // Respond with success or failure message
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(result > 0 ? "Playback history added!" : "Failed to add playback history.");
      } catch (ClassNotFoundException | SQLException e) {
        response.getWriter().write("Error: " + e.getMessage());
      } finally {
        // Close resources in reverse order of their opening
        try { if (pstmt != null) pstmt.close(); } catch (SQLException ignore) {}
        try { if (conn != null) conn.close(); } catch (SQLException ignore) {}
      }
    } else {
      response.getWriter().write("Invalid parameters.");
    }
  }
%>
</body>
</html>