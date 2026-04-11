<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Topics</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 min-h-screen flex items-center justify-center">

<div class="bg-white rounded-2xl shadow-xl w-full max-w-5xl p-8">


    <h2 class="text-3xl font-bold text-center text-gray-800 mb-6">Topics</h2>

    <table class="w-full border border-gray-200 rounded-lg overflow-hidden">
        <thead>
        <tr class="bg-indigo-600 text-white text-left">
            <th class="px-4 py-3">ID</th>
            <th class="px-4 py-3">Title</th>
            <th class="px-4 py-3">Created At</th>
            <th class="px-4 py-3">Updated At</th>
            <th class="px-4 py-3">User Name</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="topic" items="${topics}">
            <tr class="border-t hover:bg-gray-50 transition">
                <td class="px-4 py-3">${topic.topicId}</td>
                <td class="px-4 py-3 font-medium text-gray-700">${topic.title}</td>
                <td class="px-4 py-3 text-gray-600">${topic.createdAt}</td>
                <td class="px-4 py-3 text-gray-600">${topic.updatedAt}</td>
                <td class="px-4 py-3 text-gray-600">${topic.username}</td>
            </tr>
        </c:forEach>

        <c:if test="${empty topics}">
            <tr>
                <td colspan="5" class="text-center py-4 text-gray-500">
                    No topics found.
                </td>
            </tr>
        </c:if>
        </tbody>
    </table>


</div>

</body>
</html>
