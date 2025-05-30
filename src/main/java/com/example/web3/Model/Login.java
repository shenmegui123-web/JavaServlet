package com.example.web3.Model;

public class Login {
    private int accout;  // 添加 id 属性
    private String username;
    private int password; // 更改为String类型
    private String mail;


    public Login(String username, int accout, int password,String mail) {
        this.username = username;
        this.accout = accout;
        this.mail = mail;
        this.password = password;
    }
    public Login(String username, int accout, int password) {
        this.username = username;
        this.accout = accout;
        this.password = password;
    }
    // Getter和Setter方法
    public int getAccout() {
        return accout;
    }
    public void setAccout(int id) {
        this.accout = id;
    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getPassword() {
        return password;
    }

    public void setPassword(int password) {
        this.password = password;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }
}
