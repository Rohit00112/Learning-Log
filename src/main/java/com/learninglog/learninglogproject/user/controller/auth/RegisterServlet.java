package com.learninglog.learninglogproject.user.controller.auth;

import com.learninglog.learninglogproject.user.dao.impl.UserDAOImpl;
import com.learninglog.learninglogproject.user.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "register", value = "/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("register.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (username == null || username.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                password == null || password.trim().isEmpty()) {

            request.setAttribute("error", "Please fill all the fields");
            request.getRequestDispatcher("register.jsp")
                    .forward(request, response);
            return;
        }

        String hashedPassword = BCrypt.hashpw(password,BCrypt.gensalt(12));

        User user = new User(username.trim(), email.trim(), hashedPassword);

        try {
            UserDAOImpl userDAO = new UserDAOImpl();
            boolean success = userDAO.registerUser(user);

            if (success) {
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                request.setAttribute("error", "Registration failed");
                request.setAttribute("user", user);
                request.getRequestDispatcher("register.jsp")
                        .forward(request, response);
            }

        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Error while registering user", e);
        }
    }
}