<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.web3.Model.Song" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>搜索结果</title>
  <style>
    .error { color: red; }
    ul {
      list-style-type: none;
      padding: 0;
    }
    li {
      cursor: pointer;
      padding: 5px;
    }
    li:hover {
      background-color: #f0f0f0;
    }
  </style>
</head>
<body>
<h2>搜索结果:</h2>
<%
  List<Song> songs = (List<Song>) request.getAttribute("songs");
  String error = (String) request.getAttribute("error");
  if (error != null) {
%>
<p class="error"><%= error %></p>
<%
} else if (songs != null && !songs.isEmpty()) {
%>
<ul id="song-list">
  <% for (Song song : songs) { %>
  <li data-name="<%= song.getName() %>" data-author="<%= song.getAuthor() %>" data-path="<%= song.getPath() %>"><%= song.getName() %> - <%= song.getAuthor() %></li>
  <% } %>
</ul>
<audio id="audio-player" controls style="width: 100%;"></audio>
<%
} else {
%>
<p>没有找到相关歌曲。</p>
<% } %>
<a href="首页.jsp">返回首页</a>

<script>
  document.addEventListener('DOMContentLoaded', function () {
    const songList = document.getElementById('song-list');
    const audioPlayer = document.getElementById('audio-player');

    songList.addEventListener('click', function (event) {
      if (event.target.tagName.toLowerCase() === 'li') {
        const songName = event.target.dataset.name;
        const songAuthor = event.target.dataset.author;
        const songPath = event.target.dataset.path;
        audioPlayer.src = songPath; // Set the source of the audio player to the song path
        audioPlayer.load(); // Load the new audio source
        audioPlayer.play(); // Play the audio
        document.title = `${songName} - ${songAuthor}`; // Update the page title with the song info
      }
    });
  });
</script>
</body>
</html>