package com.learninglog.learninglogproject.util;

public class Queries {
    public static final String INSERT_USER = "INSERT INTO users (username,email,password) VALUES (?,?,?)";
    public static final String GET_USER_BY_EMAIL = "SELECT * FROM users WHERE email = ?";
    public static final String GET_USER_BY_Email_AND_Password = "SELECT * FROM users WHERE email = ? AND password = ?";

    public static final String GET_ALL_TOPICS="SELECT t.id,t.title,t.created_at,t.updated_at,u.username FROM topics t JOIN users u ON t.user_id=u.id WHERE user_id=?";
}
