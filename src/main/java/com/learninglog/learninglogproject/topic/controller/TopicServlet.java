// Source - https://stackoverflow.com/a/77403079
// Posted by Ali, modified by community. See post 'Timeline' for change history
// Retrieved 2026-03-18, License - CC BY-SA 4.0

package com.learninglog.learninglogproject.topic.controller;

import java.io.*;
import java.sql.SQLException;
import java.util.List;

import com.learninglog.learninglogproject.topic.dao.impl.TopicDAOImpl;
import com.learninglog.learninglogproject.topic.dto.TopicUserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "topic", value = "/topic")
public class TopicServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        HttpSession session = req.getSession();
        int user_id = (int) session.getAttribute("loggedInUser");

        TopicDAOImpl topicDAO = null;
        try {
            topicDAO = new TopicDAOImpl();
            List<TopicUserDTO> topics = topicDAO.getTopicsByUser(user_id);
            req.setAttribute("topics",topics);
            req.getRequestDispatcher("pages/home.jsp").forward(req,res);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
