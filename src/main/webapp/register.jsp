<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String error = (String) request.getAttribute("error");
    com.learninglog.learninglogproject.user.model.User user =
            (com.learninglog.learninglogproject.user.model.User) request.getAttribute("user");

    String usernameValue = "";
    String emailValue = "";

    if (user != null) {
        usernameValue = user.getUsername() != null ? user.getUsername() : "";
        emailValue    = user.getEmail()    != null ? user.getEmail()    : "";
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
<body class="bg-gray-100 min-h-screen flex items-center justify-center p-4">

<div class="w-full max-w-md">

    <%-- Logo / Brand --%>
    <div class="text-center mb-8">
        <div class="inline-flex items-center justify-center w-12 h-12 bg-indigo-600 rounded-xl mb-3">
            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-white" fill="none"
                 viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round"
                      d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path>
            </svg>
        </div>
        <h1 class="text-2xl font-bold text-gray-800">Learning Log</h1>
        <p class="text-gray-500 text-sm mt-1">Create your account to get started</p>
    </div>

    <%-- Card --%>
    <div class="bg-white rounded-2xl shadow-sm border border-gray-200 p-8">

        <% if (error != null) { %>
        <div class="mb-5 flex items-start gap-3 p-3 bg-red-50 border border-red-200 text-red-700 rounded-lg text-sm">
            <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 mt-0.5 shrink-0" fill="none"
                 viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round"
                      d="M12 9v2m0 4h.01M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
            </svg>
            <%= error %>
        </div>
        <% } %>

        <form action="register" method="post" class="space-y-5">

            <%-- Username --%>
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Username</label>
                <div class="relative">
                    <span class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none"
                             viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M16 7a4 4 0 1 1-8 0 4 4 0 0 1 8 0zM12 14a7 7 0 0 0-7 7h14a7 7 0 0 0-7-7z"></path>
                        </svg>
                    </span>
                    <input
                            type="text"
                            name="username"
                            required
                            placeholder="e.g. john_doe"
                            value="<%= usernameValue %>"
                            class="w-full pl-10 pr-4 py-2.5 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition" />
                </div>
            </div>

            <%-- Email --%>
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Email address</label>
                <div class="relative">
                    <span class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none"
                             viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M3 8l7.89 5.26a2 2 0 0 0 2.22 0L21 8M5 19h14a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2H5a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2z"></path>
                        </svg>
                    </span>
                    <input
                            type="email"
                            name="email"
                            required
                            placeholder="you@example.com"
                            value="<%= emailValue %>"
                            class="w-full pl-10 pr-4 py-2.5 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition" />
                </div>
            </div>

            <%-- Password --%>
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                <div class="relative">
                    <span class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none"
                             viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M12 15v2m-6 4h12a2 2 0 0 0 2-2v-6a2 2 0 0 0-2-2H6a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2zm10-10V7a4 4 0 0 0-8 0v4h8z"></path>
                        </svg>
                    </span>
                    <input
                            type="password"
                            name="password"
                            id="password"
                            required
                            placeholder="Min. 8 characters"
                            class="w-full pl-10 pr-10 py-2.5 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition" />
                    <%-- Toggle visibility --%>
                    <button type="button" onclick="togglePassword()"
                            class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600">
                        <svg id="eye-icon" xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none"
                             viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"></path>
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
                        </svg>
                    </button>
                </div>

                <%-- Password strength bar --%>
                <div class="mt-2">
                    <div class="flex gap-1 mb-1">
                        <div id="bar1" class="h-1 flex-1 rounded-full bg-gray-200 transition-colors duration-300"></div>
                        <div id="bar2" class="h-1 flex-1 rounded-full bg-gray-200 transition-colors duration-300"></div>
                        <div id="bar3" class="h-1 flex-1 rounded-full bg-gray-200 transition-colors duration-300"></div>
                        <div id="bar4" class="h-1 flex-1 rounded-full bg-gray-200 transition-colors duration-300"></div>
                    </div>
                    <p id="strength-label" class="text-xs text-gray-400"></p>
                </div>
            </div>

            <%-- Terms --%>
            <div class="flex items-start gap-2">
                <input type="checkbox" id="terms" required
                       class="mt-0.5 w-4 h-4 accent-indigo-600 cursor-pointer" />
                <label for="terms" class="text-xs text-gray-500 cursor-pointer">
                    I agree to the
                    <a href="#" class="text-indigo-600 hover:underline">Terms of Service</a>
                    and
                    <a href="#" class="text-indigo-600 hover:underline">Privacy Policy</a>
                </label>
            </div>

            <%-- Submit --%>
            <button type="submit"
                    class="w-full bg-indigo-600 text-white py-2.5 rounded-lg text-sm font-medium hover:bg-indigo-700 active:scale-95 transition duration-200">
                Create Account
            </button>

            <p class="text-center text-gray-500 text-sm">
                Already have an account?
                <a href="login" class="text-indigo-600 font-medium hover:underline">Sign in</a>
            </p>

        </form>
    </div>
</div>

<script>
    function togglePassword() {
        const input = document.getElementById('password');
        const icon  = document.getElementById('eye-icon');
        const isHidden = input.type === 'password';
        input.type = isHidden ? 'text' : 'password';
        icon.innerHTML = isHidden
            ? `<path stroke-linecap="round" stroke-linejoin="round"
                d="M13.875 18.825A10.05 10.05 0 0 1 12 19c-4.478 0-8.268-2.943-9.542-7a9.97 9.97 0 0 1 2.425-3.895M6.53 6.53A9.97 9.97 0 0 1 12 5c4.478 0 8.268 2.943 9.542 7a9.97 9.97 0 0 1-4.293 5.218M3 3l18 18"/>`
            : `<path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
               <path stroke-linecap="round" stroke-linejoin="round" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>`;
    }

    document.getElementById('password').addEventListener('input', function () {
        const val    = this.value;
        const bars   = [1,2,3,4].map(i => document.getElementById('bar' + i));
        const label  = document.getElementById('strength-label');

        let score = 0;
        if (val.length >= 8)              score++;
        if (/[A-Z]/.test(val))            score++;
        if (/[0-9]/.test(val))            score++;
        if (/[^A-Za-z0-9]/.test(val))     score++;

        const colors = ['bg-red-400', 'bg-orange-400', 'bg-yellow-400', 'bg-green-500'];
        const labels = ['', 'Weak', 'Fair', 'Good', 'Strong'];

        bars.forEach((bar, i) => {
            bar.className = 'h-1 flex-1 rounded-full transition-colors duration-300 ' +
                (i < score ? colors[score - 1] : 'bg-gray-200');
        });

        label.textContent = val.length ? labels[score] : '';
        label.className   = 'text-xs transition-colors duration-300 ' + (
            score <= 1 ? 'text-red-400' :
                score === 2 ? 'text-orange-400' :
                    score === 3 ? 'text-yellow-500' : 'text-green-500'
        );
    });
</script>

</body>
</html>