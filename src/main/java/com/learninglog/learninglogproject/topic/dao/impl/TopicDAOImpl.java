package com.learninglog.learninglogproject.topic.dao.impl;

import com.learninglog.learninglogproject.topic.dao.interfaces.TopicDAOInterface;
import com.learninglog.learninglogproject.topic.dto.TopicUserDTO;
import com.learninglog.learninglogproject.util.DBConnection;
import com.learninglog.learninglogproject.util.Queries;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TopicDAOImpl implements TopicDAOInterface {

    private final Connection conn;

    public TopicDAOImpl() throws SQLException, ClassNotFoundException {
        this.conn = DBConnection.getConnection();
    }

    @Override
    public List<TopicUserDTO> getTopicsByUser(int user_id) throws SQLException {
        try(PreparedStatement ps = conn.prepareStatement(Queries.GET_ALL_TOPICS);) {
            ps.setInt(1,user_id);
            List<TopicUserDTO> topics = new ArrayList<>();
            try(ResultSet rs = ps.executeQuery();) {
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
}
