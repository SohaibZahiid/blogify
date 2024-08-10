<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>

<html data-bs-theme="dark">
    <head>
        <title>Sorry! Something went wrong...</title>
        <!-- css -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="css/style.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container min-vh-100  d-flex flex-column justify-content-center align-items-center">
            <h2 class="display-5 mb-3">Sorry! Something went wrong...</h2>
            <%= exception %>
            <a class="btn custom-button mt-3" href="index.jsp">Go back!</a>
        </div>
    </body>
</html>
