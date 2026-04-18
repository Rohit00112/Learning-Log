package com.learninglog.learninglogproject.user.controller.auth;

import com.learninglog.learninglogproject.user.dao.impl.UserDAOImpl;
import com.learninglog.learninglogproject.user.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "login", value = "/login")
public class LoginServlet extends HttpServlet {

    private static final int REMEMBER_ME_DURATION = 60 * 60 * 24 * 30; // 30 days
    private static final int DEFAULT_SESSION_DURATION = 60 * 30;        // 30 minutes

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("rememberedEmail".equals(cookie.getName())) {
                    request.setAttribute("email", cookie.getValue());
                    break;
                }
            }
        }

        request.getRequestDispatcher("login.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email    = request.getParameter("email");
        String password = request.getParameter("password");
        boolean rememberMe = "true".equals(request.getParameter("rememberMe"));

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
            User user = userDAO.getUserByEmail(email.trim());

            if (user != null && BCrypt.checkpw(password, user.getPassword())) {

                // --- Session setup ---
                HttpSession session = request.getSession();

                if (rememberMe) {
                    session.setMaxInactiveInterval(REMEMBER_ME_DURATION);
                } else {
                    session.setMaxInactiveInterval(DEFAULT_SESSION_DURATION);
                }

                session.setAttribute("loggedInUser", user.getId());


                Cookie emailCookie = new Cookie("rememberedEmail", rememberMe ? user.getEmail() : "");
                emailCookie.setMaxAge(rememberMe ? REMEMBER_ME_DURATION : 0);
                emailCookie.setHttpOnly(true);
                emailCookie.setPath("/");
                response.addCookie(emailCookie);

                response.sendRedirect(request.getContextPath() + "/topic");

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