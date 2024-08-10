package org.blogify.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.blogify.dao.UserDAO;
import org.blogify.entity.User;
import org.blogify.util.ConnectionProvider;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDAO userDAO = new UserDAO(ConnectionProvider.getConnection());

        User user = userDAO.getUserByEmailAndPassword(email, password);

        if(user == null) {
            out.println("Invalid Details... try again!");
        } else {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            resp.sendRedirect("profile.jsp");
        }

        out.println(email);
        out.println(password);
    }
}
