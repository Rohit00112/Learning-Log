package com.learninglog.learninglogproject.topic.model;

import java.sql.Timestamp;

public class Topic {
    private int id;
    private String title;
    private Timestamp created_at;
    private Timestamp updated_at;
    private int user_id;

    public Topic(int id, String title, Timestamp created_at, Timestamp updated_at, int user_id) {
        this.id = id;
        this.title = title;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.user_id = user_id;
    }

    public Topic() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
}
