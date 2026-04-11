<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String error = (String) request.getAttribute("error");
    String emailValue = (String) request.getAttribute("email");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">

<div class="bg-white rounded-2xl shadow-xl w-full max-w-md p-8">

    <h2 class="text-3xl font-bold text-center text-gray-800 mb-6">Login</h2>

    <% if (error != null) { %>
    <div class="mb-4 p-3 bg-red-100 text-red-700 rounded-lg text-center">
        <%= error %>
    </div>
    <% } %>

    <form action="login" method="post" class="space-y-5">

        <div>
            <label class="block text-gray-600 mb-1">Email</label>
            <input
                    type="email"
                    name="email"
                    required
                    value="<%= emailValue != null ? emailValue : "" %>"
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

        <!-- Keep me logged in -->
        <div class="flex items-center gap-2">
            <input
                    type="checkbox"
                    id="rememberMe"
                    name="rememberMe"
                    value="true"
                    class="w-4 h-4 accent-indigo-600 cursor-pointer" />
            <label for="rememberMe" class="text-gray-600 text-sm cursor-pointer select-none">
                Keep me logged in
            </label>
        </div>

        <button
                type="submit"
                class="w-full bg-indigo-600 text-white py-2 rounded-lg hover:bg-indigo-700 transition duration-200">
            Login
        </button>

        <p class="text-center text-gray-500 text-sm">
            Don't have an account?
            <a href="register" class="text-indigo-600 hover:underline">Register</a>
        </p>

    </form>

</div>

</body>
</html>