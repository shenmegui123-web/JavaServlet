<%@ page import="java.util.List" %>
<%@ page import="com.example.web3.Model.Song" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Music Collection</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f0f0f0;
      margin: 0;
      padding: 20px;
    }
    h1 {
      color: #333;
    }
    ul {
      list-style-type: none;
      padding: 0;
    }
    li {
      background-color: #fff;
      margin: 5px 0;
      padding: 10px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      cursor: pointer;
      transition: background-color 0.3s;
    }
    li:hover {
      background-color: #e0e0e0;
    }
    .hidden {
      display: none;
    }
  </style>
</head>
<body>
<h1>音乐收藏</h1>
<ul id="song-list">
  <%
    List<Song> songs = (List<Song>) request.getAttribute("songs");
    if (songs != null) {
      for (Song song : songs) {
  %>
  <li data-file-path="<%= song.getPath() %>">音乐：<%= song.getName() %>；作者：<%= song.getAuthor() %></li>
  <%
      }
    }
  %>
</ul>
<audio id="audio-player" controls class="hidden"></audio>

<script>
  document.addEventListener('DOMContentLoaded', function () {
    const songList = document.getElementById('song-list');
    const audioPlayer = document.getElementById('audio-player');

    songList.addEventListener('click', function (event) {
      if (event.target.tagName.toLowerCase() === 'li') {
        const filePath = event.target.dataset.filePath;
        if (filePath) {
          audioPlayer.src = filePath;
          audioPlayer.classList.remove('hidden');
          audioPlayer.load(); // Load the new audio file
          audioPlayer.play();
        }
      }
    });

    audioPlayer.addEventListener('ended', function () {
      // Optional: implement auto-play next track logic here
      // or hide the audio player if you don't want auto-play
    });
  });
</script>
</body>
</html>