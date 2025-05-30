<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  // Database connection settings
  final String DB_URL = "jdbc:mysql://localhost:3306/student";
  final String USER = "root";
  final String PASS = "lifaqi666";

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  try {
    // Load MySQL JDBC driver and establish connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(DB_URL, USER, PASS);

    // Prepare SQL statement to select songs with their file paths
    String sql = "SELECT name, author, path FROM love"; // Assuming there's a 'file_path' column for the audio file path
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
%>
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
    // Process the results and display them in a list
    while (rs.next()) {
      String name = rs.getString("name");
      String author = rs.getString("author");
      String filePath = rs.getString("path"); // Path to the song file
  %>
  <li data-file-path="<%= filePath %>">音乐：<%= name %>；作者：<%= author %></li>
  <%
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
          audioPlayer.play();
        }
      }
    });
  });
</script>
</body>
</html>
<%
  } catch (SQLException | ClassNotFoundException e) {
    out.println("An error occurred: " + e.getMessage());
  } finally {
    // Close resources in reverse order of their opening
    try { if (rs != null) rs.close(); } catch (SQLException ignore) {}
    try { if (pstmt != null) pstmt.close(); } catch (SQLException ignore) {}
    try { if (conn != null) conn.close(); } catch (SQLException ignore) {}
  }
%>