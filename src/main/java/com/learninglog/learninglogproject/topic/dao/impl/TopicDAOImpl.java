package com.learninglog.learninglogproject.topic.dao.impl;

import com.learninglog.learninglogproject.topic.dao.interfaces.TopicDAOInterface;
import com.learninglog.learninglogproject.topic.dto.TopicUserDTO;
import com.learninglog.learninglogproject.util.DBConnection;
import com.learninglog.learninglogproject.util.Queries;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TopicDAOImpl implements TopicDAOInterface {

    private final Connection conn;

    public TopicDAOImpl() throws SQLException, ClassNotFoundException {
        this.conn = DBConnection.getConnection();
    }

    @Override
    public List<TopicUserDTO> getTopicsByUser(int user_id) throws SQLException {
        try(PreparedStatement ps = conn.prepareStatement(Queries.GET_ALL_TOPICS)) {
            ps.setInt(1,user_id);
            List<TopicUserDTO> topics = new ArrayList<>();
            try(ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    TopicUserDTO topic = new TopicUserDTO();
                    topic.setTopicId(rs.getInt("id"));
                    topic.setTitle(rs.getString("title"));
                    topic.setCreatedAt(rs.getTimestamp("created_at"));
                    topic.setUpdatedAt(rs.getTimestamp("updated_at"));
                    topic.setUsername(rs.getString("username"));
                    topics.add(topic);
                }
            }
            return topics;
        }
    }

    @Override
    public void createTopic(String title, int userId) throws SQLException {
        try (PreparedStatement ps = conn.prepareStatement(Queries.CREATE_TOPIC)) {
            ps.setString(1, title);
            ps.setInt(2, userId);
            ps.executeUpdate();
        }
    }

    @Override
    public TopicUserDTO getTopicById(int topicId) throws SQLException {
        try (PreparedStatement ps = conn.prepareStatement(Queries.GET_TOPIC_BY_ID)) {
            ps.setInt(1, topicId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    TopicUserDTO topic = new TopicUserDTO();
                    topic.setTopicId(rs.getInt("id"));
                    topic.setTitle(rs.getString("title"));
                    topic.setCreatedAt(rs.getTimestamp("created_at"));
                    topic.setUpdatedAt(rs.getTimestamp("updated_at"));
                    topic.setUsername(rs.getString("username"));
                    return topic;
                }
            }
        }
        return null;
    }

    @Override
    public void updateTopic(int topicId, String title) throws SQLException {
        try (PreparedStatement ps = conn.prepareStatement(Queries.UPDATE_TOPIC)) {
            ps.setString(1, title);
            ps.setInt(2, topicId);
            ps.executeUpdate();
        }
    }

    @Override
    public void deleteTopic(int topicId) throws SQLException {
        try (PreparedStatement ps = conn.prepareStatement(Queries.DELETE_TOPIC)) {
            ps.setInt(1, topicId);
            ps.executeUpdate();
        }
    }
}
