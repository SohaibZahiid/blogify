package org.blogify.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.blogify.dao.UserDAO;
import org.blogify.entity.User;
import org.blogify.util.ConnectionProvider;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out = resp.getWriter();

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String gender = req.getParameter("gender");
        String about = req.getParameter("about");

        // CREATE USER OBJECT
        User user = new User(name, email, password, gender, about);
        // CREATE DAO OBJECT
        UserDAO userDAO = new UserDAO(ConnectionProvider.getConnection());

        if(userDAO.save(user)) {
            out.println("success");
        } else {
            out.println("failed");
        }


    }
}
