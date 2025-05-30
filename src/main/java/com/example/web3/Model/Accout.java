package com.example.web3.Model;

public class Accout {
    private int id;  // 添加 id 属性
    private String name;
    private int accout; // 更改为String类型
    private String mail;


    public Accout(String name, int accout, String mail) {
        this.name = name;
        this.accout = accout;
        this.mail = mail;
    }
    // Getter和Setter方法
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getStuName() {
        return name;
    }
    public int getStuNo() {
        return accout;
    }

    public String getMajor() {
        return mail;
    }

    public void setMajor(String major) {
        this.mail = major;
    }
}