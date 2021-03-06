package com.travel.bean;

import java.io.Serializable;

public class UserBean implements Serializable {
    int id;
    String userName;
    String password;
    String name;
    String email;
    String phone;
    int status;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public UserBean(int id, String userName, String password, String name, String email, String phone, int status) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.status = status;
    }

    public UserBean(String userName, String password, String name, String email, String phone, int status) {
        this.userName = userName;
        this.password = password;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.status = status;
    }

    public UserBean(String userName, String name, String email, String phone, int status) {
        this.userName = userName;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.status = status;
    }

    public UserBean(int id, String userName, String name, String email, String phone) {
        this.id = id;
        this.userName = userName;
        this.name = name;
        this.email = email;
        this.phone = phone;
    }

    public UserBean(int id, String userName, String name, String email, String phone, int status) {
        this.id = id;
        this.userName = userName;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.status = status;
    }

    @Override
    public String toString() {
        return "UserBean{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", status=" + status +
                '}';
    }
}
