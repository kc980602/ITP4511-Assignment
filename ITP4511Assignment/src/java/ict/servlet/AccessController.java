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
 * @author Kevin
 */
@WebServlet(name = "AccessController", urlPatterns = {"/main"})
public class AccessController extends HttpServlet {

    private UserDB userDb;
    private User user;

    @Override
    public void init() {
        user = null;
//        String dbUser = this.getServletContext().getInitParameter("dbUser");
//        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
//        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
//        userDb = new UserDB(dbUrl, dbUser, dbPassword);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (isAuthenticated(request)) {
            HttpSession session = request.getSession();
            user = (User) session.getAttribute("user");
            request.setAttribute("user", user);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/main.jsp");
            rd.forward(request, response);
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
