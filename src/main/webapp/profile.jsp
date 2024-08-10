<%@ page import="org.blogify.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error.jsp" %>
<%
    User user = (User) session.getAttribute("user");
    if(user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html data-ds-theme="dark">
    <head>
        <title>Title</title>
    </head>
    <body>
        <%= user.getName() %>
        <%= user.getEmail() %>
        <%= user.getAbout() %>
    </body>
</html>
