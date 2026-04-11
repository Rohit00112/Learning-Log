<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Topics</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 min-h-screen p-8">

<div class="max-w-6xl mx-auto">

    <%-- Header --%>
    <div class="flex items-center justify-between mb-6">
        <div>
            <h1 class="text-3xl font-bold text-gray-800">Topics</h1>
            <p class="text-sm text-gray-500 mt-1">Manage and view all learning topics</p>
        </div>
        <a href="topic?action=new"
           class="inline-flex items-center gap-2 bg-indigo-600 hover:bg-indigo-700 text-white text-sm font-medium px-4 py-2 rounded-lg transition duration-200">
            <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none"
                 viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"/>
            </svg>
            Add Topic
        </a>
    </div>

    <%-- Stats --%>
    <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 mb-6">
        <div class="bg-white rounded-xl border border-gray-200 p-4">
            <p class="text-xs text-gray-500 uppercase tracking-wide mb-1">Total Topics</p>
            <p class="text-2xl font-bold text-gray-800">${fn:length(topics)}</p>
        </div>
        <div class="bg-white rounded-xl border border-gray-200 p-4">
            <p class="text-xs text-gray-500 uppercase tracking-wide mb-1">Active Users</p>
            <p class="text-2xl font-bold text-indigo-600">—</p>
        </div>
        <div class="bg-white rounded-xl border border-gray-200 p-4">
            <p class="text-xs text-gray-500 uppercase tracking-wide mb-1">Last Updated</p>
            <p class="text-2xl font-bold text-gray-800">—</p>
        </div>
    </div>

    <%-- Table Card --%>
    <div class="bg-white rounded-2xl shadow-sm border border-gray-200 overflow-hidden">

        <%-- Search & Filter Bar --%>
        <div class="flex items-center justify-between px-6 py-4 border-b border-gray-100">
            <div class="relative">
                <svg xmlns="http://www.w3.org/2000/svg"
                     class="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400"
                     fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M21 21l-4.35-4.35M17 11A6 6 0 1 1 5 11a6 6 0 0 1 12 0z"/>
                </svg>
                <input type="text"
                       placeholder="Search topics..."
                       class="pl-9 pr-4 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 w-64"/>
            </div>
            <span class="text-sm text-gray-400">${fn:length(topics)} results</span>
        </div>

        <%-- Table --%>
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead>
                <tr class="bg-gray-50 text-left text-xs font-semibold text-gray-500 uppercase tracking-wide">
                    <th class="px-6 py-3 w-12">#</th>
                    <th class="px-6 py-3">Title</th>
                    <th class="px-6 py-3">Author</th>
                    <th class="px-6 py-3">Created At</th>
                    <th class="px-6 py-3">Updated At</th>
                    <th class="px-6 py-3 text-center">Actions</th>
                </tr>
                </thead>

                <tbody class="divide-y divide-gray-100">

                <c:forEach var="topic" items="${topics}">
                    <tr class="hover:bg-indigo-50/40 transition-colors duration-150 group">

                            <%-- ID --%>
                        <td class="px-6 py-4 text-gray-400 font-mono text-xs">${topic.topicId}</td>

                            <%-- Title --%>
                        <td class="px-6 py-4">
                            <span class="font-medium text-gray-800 group-hover:text-indigo-700 transition-colors">
                                    ${topic.title}
                            </span>
                        </td>

                            <%-- Author --%>
                        <td class="px-6 py-4">
                            <div class="flex items-center gap-2">
                                <div class="w-7 h-7 rounded-full bg-indigo-100 text-indigo-700 text-xs font-semibold flex items-center justify-center uppercase">
                                        ${fn:substring(topic.username, 0, 1)}
                                </div>
                                <span class="text-gray-600">${topic.username}</span>
                            </div>
                        </td>

                            <%-- Created At --%>
                        <td class="px-6 py-4 text-gray-500">${topic.createdAt}</td>

                            <%-- Updated At --%>
                        <td class="px-6 py-4 text-gray-500">${topic.updatedAt}</td>

                            <%-- Actions --%>
                        <td class="px-6 py-4">
                            <div class="flex items-center justify-center gap-1">

                                    <%-- View --%>
                                <a href="topic?action=view&id=${topic.topicId}"
                                   title="View"
                                   class="p-2 rounded-lg text-gray-400 hover:text-indigo-600 hover:bg-indigo-50 transition-colors">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none"
                                         viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                              d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                              d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
                                    </svg>
                                </a>

                                    <%-- Edit --%>
                                <a href="topic?action=edit&id=${topic.topicId}"
                                   title="Edit"
                                   class="p-2 rounded-lg text-gray-400 hover:text-amber-600 hover:bg-amber-50 transition-colors">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none"
                                         viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                              d="M11 5H6a2 2 0 0 0-2 2v11a2 2 0 0 0 2 2h11a2 2 0 0 0 2-2v-5m-1.414-9.414a2 2 0 1 1 2.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                                    </svg>
                                </a>

                                    <%-- Delete --%>
                                <a href="topic?action=delete&id=${topic.topicId}"
                                   title="Delete"
                                   onclick="return confirm('Are you sure you want to delete this topic?')"
                                   class="p-2 rounded-lg text-gray-400 hover:text-red-600 hover:bg-red-50 transition-colors">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none"
                                         viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                              d="M19 7l-.867 12.142A2 2 0 0 1 16.138 21H7.862a2 2 0 0 1-1.995-1.858L5 7m5 4v6m4-6v6M9 7V4a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v3m-9 0h14"/>
                                    </svg>
                                </a>

                            </div>
                        </td>

                    </tr>
                </c:forEach>

                <%-- Empty state --%>
                <c:if test="${empty topics}">
                    <tr>
                        <td colspan="6" class="px-6 py-16 text-center">
                            <svg xmlns="http://www.w3.org/2000/svg"
                                 class="w-10 h-10 mx-auto text-gray-300 mb-3" fill="none"
                                 viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M9 13h6m-3-3v6m5 5H7a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5.586a1 1 0 0 1 .707.293l5.414 5.414a1 1 0 0 1 .293.707V19a2 2 0 0 1-2 2z"/>
                            </svg>
                            <p class="text-gray-400 font-medium">No topics found</p>
                            <p class="text-gray-300 text-xs mt-1">Click "Add Topic" to create your first one</p>
                        </td>
                    </tr>
                </c:if>

                </tbody>
            </table>
        </div>

        <%-- Footer --%>
        <div class="px-6 py-3 border-t border-gray-100 bg-gray-50 text-xs text-gray-400 text-right">
            Showing all ${fn:length(topics)} topics
        </div>

    </div>
</div>

</body>
</html>