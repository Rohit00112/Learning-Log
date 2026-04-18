package com.learninglog.learninglogproject.topic.dao.interfaces;

import com.learninglog.learninglogproject.topic.dto.TopicUserDTO;

import java.sql.SQLException;
import java.util.List;

public interface TopicDAOInterface {
    List<TopicUserDTO> getTopicsByUser(int user_id) throws SQLException;
    void createTopic(String title, int userId) throws SQLException, ClassNotFoundException;
    TopicUserDTO getTopicById(int topicId) throws SQLException;
    void updateTopic(int topicId, String title) throws SQLException;
    void deleteTopic(int topicId) throws SQLException;
}