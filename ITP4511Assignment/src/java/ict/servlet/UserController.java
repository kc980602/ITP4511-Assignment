/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.User;
import ict.db.UserDB;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PokeGuys
 */
@WebServlet(name = "UserController", urlPatterns = {"/profile"})
public class UserController extends HttpServlet {
    private UserDB userDb;
    private User user;

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        userDb = new UserDB(dbUrl, dbUser, dbPassword);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (isAuthenticated(request)) {
            HttpSession session = request.getSession();
            user = (User) session.getAttribute("user");
            request.setAttribute("user", user);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/profile.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("login");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (isAuthenticated(request)) {
            HttpSession session = request.getSession();
            user = (User) session.getAttribute("user");
            request.setAttribute("user", user);
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String cpassword = request.getParameter("cpassword");
            String password = request.getParameter("password");
            boolean reset = false;
            if (!"".equals(fname) && !"".equals(lname)) {
                if (!"".equals(cpassword)) {
                    reset = true;
                    if (userDb.isValidUser(user.getUsername(), cpassword)) {
                        user.setPassword(password);
                    } else {
                        response.sendRedirect("profile?failed=true&message=Incorrect Password!");
                        return;
                    }
                }
                user.setFirstname(fname);
                user.setLastname(lname);
                userDb.editProfile(user, reset);
                response.sendRedirect("profile?failed=false&message=Profile Updated!");
            } else {
                response.sendRedirect("profile?failed=true&message=FirstName / LastName cannot be empty!");
            }
        } else {
            response.sendRedirect("login");
        }
    }

    private boolean isAuthenticated(HttpServletRequest request) {
        boolean result = false;
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            result = true;
        }
        return result;
    }    
}
