<%@ page import="java.util.List" %>
<%@ page import="com.example.web3.Model.Song" %>
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
      cursor: pointer;
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
    <%
      List<Song> songs = (List<Song>) request.getAttribute("songs");
      if (songs != null) {
        for (Song song : songs) {
    %>
    <li data-song-title="<%= song.getName() %>" data-song-artist="<%= song.getAuthor() %>" data-song-src="<%= song.getPath() %>" onclick="selectSong(this)">
      <input type="checkbox">
      <span><%= song.getName() %></span>
      <span><%= song.getAuthor() %></span>
      <button class="favorite" onclick="toggleFavorite(this)">❤</button>
    </li>
    <%
        }
      }
    %>
  </ul>
</div>
<div class="player">
  <button onclick="previousTrack()">⏮</button>
  <button id="playPauseBtn" onclick="playPause()">▶</button>
  <button onclick="nextTrack()">⏭</button>
  <input type="range" min="0" max="100" value="0" id="seek" onchange="seekTo(this.value)">
  <span id="current-time">00:00</span>
  <span id="total-time">00:00</span> <!-- Total time will be updated -->
</div>
<audio id="audio" controls class="hidden"></audio>
<script>
  let audio = document.getElementById('audio');
  let seek = document.getElementById('seek');
  let currentTime = document.getElementById('current-time');
  let totalTime = document.getElementById('total-time');
  let playPauseBtn = document.getElementById('playPauseBtn');

  audio.addEventListener('loadedmetadata', function() {
    totalTime.textContent = formatTime(audio.duration);
  });

  function playPause() {
    if (audio.paused || audio.ended) {
      audio.play();
      playPauseBtn.textContent = '⏸'; // Change the button text to pause icon
    } else {
      audio.pause();
      playPauseBtn.textContent = '▶'; // Change the button text to play icon
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

  function formatTime(seconds) {
    const minutes = Math.floor(seconds / 60);
    const remainderSeconds = seconds % 60;
    return `${minutes}:${remainderSeconds < 10 ? '0' : ''}${remainderSeconds}`;
  }

  function toggleFavorite(button) {
    // ...省略 toggleFavorite() 函数代码...
  }

  function selectSong(songElement) {
    let songSrc = songElement.dataset.songSrc;
    let songTitle = songElement.dataset.songTitle;

    audio.src = songSrc;
    audio.load(); // Load the song but do not play

    updateMetadata(songElement);

    document.querySelectorAll('.playlist li').forEach(item => item.classList.remove('playing'));
    songElement.classList.add('playing');
  }

  function updateMetadata(songElement) {
    // Since we can't fetch the song duration without playing it, we use the audio element's metadata
    audio.addEventListener('loadedmetadata', function() {
      const durationElement = document.getElementById('duration-' + songElement.dataset.songTitle);
      durationElement.textContent = formatTime(audio.duration);
    });
  }

  function playSong(songElement) {
    selectSong(songElement);
    audio.play();
  }

  audio.addEventListener('timeupdate', updateSeek);
  audio.addEventListener('ended', function () {
    nextTrack();
  });

  // Initialize by selecting the first song if it exists
  document.querySelectorAll('.playlist li')[0].click();
</script>
</body>
</html>