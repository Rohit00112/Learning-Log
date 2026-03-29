<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String error = (String) request.getAttribute("error");
    com.learninglog.learninglogproject.user.model.User user =
            (com.learninglog.learninglogproject.user.model.User) request.getAttribute("user");

    String usernameValue = "";
    String emailValue = "";

    if (user != null) {
        usernameValue = user.getUsername() != null ? user.getUsername() : "";
        emailValue = user.getEmail() != null ? user.getEmail() : "";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">

<div class="bg-white rounded-2xl shadow-xl w-full max-w-md p-8">

    <h2 class="text-3xl font-bold text-center text-gray-800 mb-6">Create Account</h2>

    <% if (error != null) { %>
    <div class="mb-4 p-3 bg-red-100 text-red-700 rounded-lg text-center">
        <%= error %>
    </div>
    <% } %>

    <form action="register" method="post" class="space-y-5">

        <div>
            <label class="block text-gray-600 mb-1">Username</label>
            <input
                    type="text"
                    name="username"
                    required
                    value="<%= usernameValue %>"
                    class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500" />
        </div>

        <div>
            <label class="block text-gray-600 mb-1">Email</label>
            <input
                    type="email"
                    name="email"
                    required
                    value="<%= emailValue %>"
                    class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500" />
        </div>

        <div>
            <label class="block text-gray-600 mb-1">Password</label>
            <input
                    type="password"
                    name="password"
                    required
                    class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500" />
        </div>

        <button
                type="submit"
                class="w-full bg-indigo-600 text-white py-2 rounded-lg hover:bg-indigo-700 transition duration-200">
            Register
        </button>

        <p class="text-center text-gray-500 text-sm">
            Already have an account?
            <a href="login" class="text-indigo-600 hover:underline">Login</a>
        </p>

    </form>

</div>

</body>
</html>