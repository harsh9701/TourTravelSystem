package com.project.entities;

import java.sql.*;

public class User {

    private int id;
    private String fullName;
    private String email;
    private String contactNo;
    private String password;
    private String userRole;
    private Timestamp regDate;

    public User() {
    }

    public User(int id, String fullName, String email, String contactNo, String password, String userRole, Timestamp regDate) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.contactNo = contactNo;
        this.password = password;
        this.userRole = userRole;
        this.regDate = regDate;
    }

    public User(String fullName, String email, String contactNo, String password) {
        this.fullName = fullName;
        this.email = email;
        this.contactNo = contactNo;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public Timestamp getRegDate() {
        return regDate;
    }

    public void setRegDate(Timestamp regDate) {
        this.regDate = regDate;
    }
}
