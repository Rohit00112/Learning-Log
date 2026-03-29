package com.learninglog.learninglogproject.user.controller.auth;

import java.io.IOException;
import java.sql.SQLException;

import com.learninglog.learninglogproject.user.dao.impl.UserDAOImpl;
import com.learninglog.learninglogproject.user.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "login", value = "/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("login.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || email.trim().isEmpty() ||
                password == null || password.trim().isEmpty()) {

            request.setAttribute("error", "Please fill all the fields");
            request.setAttribute("email", email);
            request.getRequestDispatcher("login.jsp")
                    .forward(request, response);
            return;
        }

        try {
            UserDAOImpl userDAO = new UserDAOImpl();
            User user = userDAO.loginUser(email.trim(), password);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("loggedInUser", user);

                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                request.setAttribute("error", "Invalid email or password");
                request.setAttribute("email", email);
                request.getRequestDispatcher("login.jsp")
                        .forward(request, response);
            }

        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Error while logging in user", e);
        }
    }
}