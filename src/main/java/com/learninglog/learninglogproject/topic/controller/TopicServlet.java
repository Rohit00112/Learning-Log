package com.learninglog.learninglogproject.topic.controller;

import com.learninglog.learninglogproject.topic.dao.impl.TopicDAOImpl;
import com.learninglog.learninglogproject.topic.dto.TopicUserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "topic", value = "/topic")
public class TopicServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("loggedInUser") == null) {
            res.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String action = req.getParameter("action");
        if (action == null) action = "list";

        int userId = (int) session.getAttribute("loggedInUser");

        try {
            switch (action) {
                case "new":
                    req.getRequestDispatcher("pages/addtopic.jsp").forward(req, res);
                    break;

                // inside doGet switch
                case "edit":
                    int topicId = Integer.parseInt(req.getParameter("id"));
                    TopicDAOImpl topicDAO = new TopicDAOImpl();
                    TopicUserDTO topic = topicDAO.getTopicById(topicId);
                    req.setAttribute("topic", topic);
                    req.getRequestDispatcher("pages/editTopic.jsp").forward(req, res);
                    break;

                case "delete":
                    int topicIdDelete = Integer.parseInt(req.getParameter("id"));
                    try {
                        TopicDAOImpl topicDAO2 = new TopicDAOImpl();
                        topicDAO2.deleteTopic(topicIdDelete);
                        res.sendRedirect(req.getContextPath() + "/topic");
                    } catch (SQLException | ClassNotFoundException e) {
                        e.printStackTrace();
                        throw new RuntimeException(e);
                    }
                    break;

                default: // list
                    TopicDAOImpl topicDAO1 = new TopicDAOImpl();
                    List<TopicUserDTO> topics = topicDAO1.getTopicsByUser(userId);
                    req.setAttribute("topics", topics);
                    req.getRequestDispatcher("pages/home.jsp").forward(req, res);
                    break;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("loggedInUser") == null) {
            res.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String action = req.getParameter("action");
        int userId = (int) session.getAttribute("loggedInUser");

        if ("create".equals(action)) {
            String title = req.getParameter("title");
            String description = req.getParameter("description");

            try {
                TopicDAOImpl topicDAO = new TopicDAOImpl();
                topicDAO.createTopic(title, userId); // adjust to your DAO method
                res.sendRedirect(req.getContextPath() + "/topic");
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                req.setAttribute("error", "Failed to create topic. Please try again.");
                req.getRequestDispatcher("pages/addTopic.jsp").forward(req, res);
            }
        }

        // inside doPost
        if ("update".equals(action)) {
            int topicId = Integer.parseInt(req.getParameter("id"));
            String title = req.getParameter("title");
            try {
                TopicDAOImpl topicDAO = new TopicDAOImpl();
                topicDAO.updateTopic(topicId, title);
                res.sendRedirect(req.getContextPath() + "/topic");
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                req.setAttribute("error", "Failed to update topic. Please try again.");
                req.getRequestDispatcher("pages/editTopic.jsp").forward(req, res);
            }
        }
    }
}