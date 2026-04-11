<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>404 – Page Not Found</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">

<div class="bg-white rounded-2xl shadow-xl w-full max-w-lg p-12 text-center">

  <div class="w-20 h-20 bg-indigo-50 rounded-full flex items-center justify-center mx-auto mb-6">
    <svg class="w-10 h-10 text-indigo-600" fill="none" stroke="currentColor" stroke-width="1.8"
         viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round">
      <circle cx="11" cy="11" r="8"/>
      <path d="m21 21-4.35-4.35M11 8v3M11 14h.01"/>
    </svg>
  </div>

  <div class="text-7xl font-bold text-indigo-600 leading-none mb-2">404</div>
  <h1 class="text-2xl font-bold text-gray-800 mb-3">Page not found</h1>
  <p class="text-gray-500 mb-8">
    The page you're looking for doesn't exist or may have been moved.
  </p>

  <div class="flex justify-center gap-3">
    <a href="${pageContext.request.contextPath}/"
       class="bg-indigo-600 hover:bg-indigo-700 text-white px-6 py-2.5 rounded-lg text-sm font-medium transition">
      Go to Topics
    </a>
    <button onclick="history.back()"
            class="border border-indigo-200 text-indigo-600 hover:bg-indigo-50 px-6 py-2.5 rounded-lg text-sm font-medium transition">
      Go Back
    </button>
  </div>

</div>

</body>
</html>