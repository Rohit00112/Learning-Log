package com.learninglog.learninglogproject.user.dao.impl;

import com.learninglog.learninglogproject.user.dao.interfaces.UserDAOInterface;
import com.learninglog.learninglogproject.user.model.User;
import com.learninglog.learninglogproject.util.DBConnection;
import com.learninglog.learninglogproject.util.Queries;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAOImpl implements UserDAOInterface {

    private final Connection conn;

    public UserDAOImpl() throws SQLException, ClassNotFoundException {
        this.conn = DBConnection.getConnection();
    }

    @Override
    public boolean registerUser(User user) throws SQLException {
        try (PreparedStatement ps = conn.prepareStatement(Queries.INSERT_USER)) {
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        }
    }

    @Override
    public User loginUser(String email, String password) throws SQLException {
        try (PreparedStatement ps = conn.prepareStatement(Queries.GET_USER_BY_Email_AND_Password)) {
            ps.setString(1, email);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    return user;
                }
            }
        }
        return null;
    }

    @Override
    public boolean emailExists(String email) throws SQLException {
        try (PreparedStatement ps = conn.prepareStatement(Queries.GET_USER_BY_EMAIL)) {
            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }

    public User getUserByEmail(String email) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM users WHERE email = ?";
        User user = null;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password")); // hashed password
                }
            }
        }

        return user;
    }
}