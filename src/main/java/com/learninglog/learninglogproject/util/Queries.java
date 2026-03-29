package com.learninglog.learninglogproject.util;

public class Queries {
    public static final String INSERT_USER = "INSERT INTO users (username,email,password) VALUES (?,?,?)";
    public static final String GET_USER_BY_EMAIL = "SELECT * FROM users WHERE email = ?";
    public static final String GET_USER_BY_Email_AND_Password = "SELECT * FROM users WHERE email = ? AND password = ?";
}
