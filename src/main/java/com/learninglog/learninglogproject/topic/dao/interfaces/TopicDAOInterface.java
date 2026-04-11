package com.learninglog.learninglogproject.topic.dao.interfaces;

import com.learninglog.learninglogproject.topic.dto.TopicUserDTO;

import java.sql.SQLException;
import java.util.List;

public interface TopicDAOInterface {
    List<TopicUserDTO> getTopicsByUser(int user_id) throws SQLException;
}
