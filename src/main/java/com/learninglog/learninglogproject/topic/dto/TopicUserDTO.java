package com.learninglog.learninglogproject.topic.dto;

import java.sql.Timestamp;

public class TopicUserDTO {

    private int topicId;
    private String title;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    private String username; // only this from user

    public TopicUserDTO() {}

    public TopicUserDTO(int topicId, String title, Timestamp createdAt, Timestamp updatedAt, String username) {
        this.topicId = topicId;
        this.title = title;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.username = username;
    }

    public int getTopicId() {
        return topicId;
    }

    public void setTopicId(int topicId) {
        this.topicId = topicId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
