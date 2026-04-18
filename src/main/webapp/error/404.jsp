<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>404 – Page Not Found</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center p-4">

<div class="w-full max-w-md">

  <%-- Brand --%>
  <div class="text-center mb-8">
    <div class="inline-flex items-center justify-center w-12 h-12 bg-indigo-600 rounded-xl mb-3">
      <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-white" fill="none"
           viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
        <path stroke-linecap="round" stroke-linejoin="round"
              d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"/>
      </svg>
    </div>
    <h1 class="text-2xl font-bold text-gray-800">Learning Log</h1>
  </div>

  <%-- Card --%>
  <div class="bg-white rounded-2xl shadow-sm border border-gray-200 p-10 text-center">

    <%-- Animated illustration --%>
    <div class="relative w-24 h-24 mx-auto mb-6">
      <div class="w-24 h-24 bg-indigo-50 rounded-full flex items-center justify-center">
        <svg xmlns="http://www.w3.org/2000/svg" class="w-12 h-12 text-indigo-400" fill="none"
             viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
          <path stroke-linecap="round" stroke-linejoin="round"
                d="M9.172 16.172a4 4 0 0 1 5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0z"/>
        </svg>
      </div>
      <%-- Floating badge --%>
      <div class="absolute -top-1 -right-1 w-8 h-8 bg-red-100 border-2 border-white rounded-full
                        flex items-center justify-center">
        <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-red-500" fill="none"
             viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
          <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"/>
        </svg>
      </div>
    </div>

    <%-- Code --%>
    <div class="text-7xl font-bold text-indigo-600 leading-none mb-2">404</div>

    <%-- Message --%>
    <h2 class="text-xl font-semibold text-gray-800 mb-2">Page not found</h2>
    <p class="text-sm text-gray-500 mb-8 leading-relaxed">
      The page you're looking for doesn't exist<br/>or may have been moved.
    </p>

    <%-- Divider --%>
    <div class="border-t border-gray-100 mb-6"></div>

    <%-- Actions --%>
    <div class="flex flex-col sm:flex-row justify-center gap-3">
      <a href="${pageContext.request.contextPath}/topic"
         class="inline-flex items-center justify-center gap-2 bg-indigo-600 hover:bg-indigo-700
                      active:scale-95 text-white px-6 py-2.5 rounded-lg text-sm font-medium transition duration-200">
        <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none"
             viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
          <path stroke-linecap="round" stroke-linejoin="round"
                d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 0 0 1 1h3m10-11l2 2m-2-2v10a1 1 0 0 1-1 1h-3m-6 0a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1m-6 0h6"/>
        </svg>
        Go to Topics
      </a>
      <button onclick="history.back()"
              class="inline-flex items-center justify-center gap-2 border border-gray-200
                           text-gray-600 hover:bg-gray-50 active:scale-95 px-6 py-2.5 rounded-lg
                           text-sm font-medium transition duration-200">
        <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none"
             viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
          <path stroke-linecap="round" stroke-linejoin="round"
                d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
        </svg>
        Go Back
      </button>
    </div>

  </div>

  <%-- Footer hint --%>
  <p class="text-center text-xs text-gray-400 mt-6">
    If you think this is a mistake, please contact support.
  </p>

</div>

</body>
</html>