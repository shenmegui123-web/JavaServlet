package com.example.web3.Model;

public class Song {
    private String name;
    private String author;
    private String path;

    public Song(String name, String author, String path) {
        this.name = name;
        this.author = author;
        this.path = path;
    }

    public String getName() { return name; }
    public String getAuthor() { return author; }
    public String getPath() { return path; }
}