package com.learninglog.learninglogproject.user.dao.interfaces;

import com.learninglog.learninglogproject.user.model.User;

import java.sql.SQLException;

public interface UserDAOInterface {
    boolean registerUser(User user) throws SQLException;
    User loginUser(String email, String password) throws SQLException;
    boolean emailExists(String email) throws SQLException;
}
