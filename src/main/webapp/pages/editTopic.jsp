<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit Topic</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 min-h-screen p-8">

<div class="max-w-2xl mx-auto">

    <%-- Header --%>
    <div class="flex items-center justify-between mb-6">
        <div>
            <h1 class="text-3xl font-bold text-gray-800">Edit Topic</h1>
            <p class="text-sm text-gray-500 mt-1">Update your learning topic</p>
        </div>
        <a href="topic"
           class="inline-flex items-center gap-2 bg-white hover:bg-gray-50 text-gray-600 text-sm font-medium px-4 py-2 rounded-lg border border-gray-200 transition duration-200">
            <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none"
                 viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7"/>
            </svg>
            Back
        </a>
    </div>

    <%-- Error Message --%>
    <c:if test="${not empty error}">
        <div class="mb-4 px-4 py-3 bg-red-50 border border-red-200 text-red-600 text-sm rounded-lg">
                ${error}
        </div>
    </c:if>

    <%-- Form Card --%>
    <div class="bg-white rounded-2xl shadow-sm border border-gray-200 overflow-hidden">

        <div class="px-6 py-4 border-b border-gray-100">
            <h2 class="text-sm font-semibold text-gray-600 uppercase tracking-wide">Topic Details</h2>
        </div>

        <form action="topic" method="post" class="px-6 py-6 space-y-5">

            <input type="hidden" name="action" value="update" />
            <input type="hidden" name="id" value="${topic.topicId}" />

            <%-- Title --%>
            <div>
                <label for="title" class="block text-sm font-medium text-gray-700 mb-1">
                    Title <span class="text-red-400">*</span>
                </label>
                <input type="text"
                       id="title"
                       name="title"
                       value="${topic.title}"
                       placeholder="Enter topic title"
                       required
                       class="w-full px-4 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition"/>
            </div>

            <%-- Actions --%>
            <div class="flex items-center justify-end gap-3 pt-2">
                <a href="topic"
                   class="px-4 py-2 text-sm font-medium text-gray-600 bg-white border border-gray-200 rounded-lg hover:bg-gray-50 transition duration-200">
                    Cancel
                </a>
                <button type="submit"
                        class="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium text-white bg-amber-500 hover:bg-amber-600 rounded-lg transition duration-200">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none"
                         viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M11 5H6a2 2 0 0 0-2 2v11a2 2 0 0 0 2 2h11a2 2 0 0 0 2-2v-5m-1.414-9.414a2 2 0 1 1 2.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                    </svg>
                    Update Topic
                </button>
            </div>

        </form>
    </div>
</div>

</body>
</html>