<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>500 – Server Error</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">

<div class="bg-white rounded-2xl shadow-xl w-full max-w-lg p-12 text-center">

  <div class="w-20 h-20 bg-red-50 rounded-full flex items-center justify-center mx-auto mb-6">
    <svg class="w-10 h-10 text-red-600" fill="none" stroke="currentColor" stroke-width="1.8"
         viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round">
      <path d="M10.29 3.86 1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"/>
      <line x1="12" y1="9" x2="12" y2="13"/>
      <line x1="12" y1="17" x2="12.01" y2="17"/>
    </svg>
  </div>

  <div class="text-7xl font-bold text-red-600 leading-none mb-2">500</div>
  <h1 class="text-2xl font-bold text-gray-800 mb-3">Internal server error</h1>
  <p class="text-gray-500 mb-8">
    Something went wrong on our end. Please try again later or
    contact support if the problem persists.
  </p>

  <div class="flex justify-center gap-3">
    <a href="${pageContext.request.contextPath}/"
       class="bg-indigo-600 hover:bg-indigo-700 text-white px-6 py-2.5 rounded-lg text-sm font-medium transition">
      Go to Topics
    </a>
    <button onclick="location.reload()"
            class="border border-gray-200 text-gray-600 hover:bg-gray-50 px-6 py-2.5 rounded-lg text-sm font-medium transition">
      Retry
    </button>
  </div>

</div>

</body>
</html>