/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.Groups;
import ict.bean.User;
import ict.db.UserDB;
import java.io.IOException;
import java.util.ArrayList;
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
@WebServlet(name = "AccountController", urlPatterns = {"/account"})
public class AccountController extends HttpServlet {

    private UserDB userDb;
    private User user = new User();
    private String addUsername, updateUsername;

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        userDb = new UserDB(dbUrl, dbUser, dbPassword);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<User> ubs = new ArrayList();
        ArrayList<Groups> gbs = new ArrayList();
        int numOfRecord = 0;

        if (isAuthenticatedAdmin(request)) {
            String action = request.getParameter("action");
            if (action != null && action.equals("search")) {
                ubs = searchUser(request);
                numOfRecord = getNumOfRecord();
            } else {
                ubs = getUser(request);
                numOfRecord = getNumOfRecord();
            }
            gbs = getGroup();
            request.setAttribute("user", user);
            request.setAttribute("userlist", ubs);
            request.setAttribute("grouplist", gbs);
            request.setAttribute("numOfRecord", numOfRecord);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/account.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (isAuthenticatedAdmin(request)) {
            String url = "main";
            if (action.equals("add")) {

                if (addUser(request)) {
                    url = "account?edit=false&addfailed=false&username=" + addUsername;
                } else {
                    url = "account?edit=false&addfailed=true&username=" + addUsername;
                }
            }
            if (action.equals("update")) {
                if (updateUser(request)) {
                    url = "account?edit=false&updatefailed=false&username=" + updateUsername;
                } else {
                    url = "account?edit=false&updatefailed=true&username=" + updateUsername;
                }
            }
            request.setAttribute("user", user);
            response.sendRedirect(url);
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

    private boolean isAuthenticatedAdmin(HttpServletRequest request) {
        boolean result = false;
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            user = (User) session.getAttribute("user");
            if (user.getRoles() == 0) {
                result = true;
            }
        }
        return result;
    }

    private boolean addUser(HttpServletRequest request) {
        String username = request.getParameter("username");
        addUsername = username;
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        int roles = Integer.parseInt(request.getParameter("roles"));
        int group = Integer.parseInt(request.getParameter("group"));
        return userDb.addUser(username, fname, lname, roles, group);
    }

    private ArrayList<User> getUser(HttpServletRequest request) {
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        return userDb.queryUser(page);
    }

    private int getNumOfRecord() {
        return userDb.countRecord();
    }

    private ArrayList<User> searchUser(HttpServletRequest request) {
        int page = 1;
        long id;
        int roles = -1, status = -1;
        String username, fname, lname;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        id = !isNOWS(request.getParameter("id")) ? Long.parseLong(request.getParameter("id")) : -1;
        username = !isNOWS(request.getParameter("username")) ? request.getParameter("username") : null;
        fname = !isNOWS(request.getParameter("fname")) ? request.getParameter("fname") : null;
        lname = !isNOWS(request.getParameter("lname")) ? request.getParameter("lname") : null;
        roles = Integer.valueOf(request.getParameter("roles"));
        status = Integer.valueOf(request.getParameter("status"));
        int group = Integer.parseInt(request.getParameter("group"));
        return userDb.searchUser(page, id, username, fname, lname, roles, status, group);
    }

    public static boolean isNOWS(String value) {
        if (value == null) {
            return true;
        }

        for (int i = 0; i < value.length(); i++) {
            if (!Character.isWhitespace(value.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    private boolean updateUser(HttpServletRequest request) {
        User ub = new User();
        ub.setId(Long.parseLong(request.getParameter("id")));
        String username = request.getParameter("username");
        updateUsername = username;
        ub.setUsername(username);
        ub.setPassword(!isNOWS(request.getParameter("reset")) ? request.getParameter("reset") : "no reset");
        ub.setFirstname(request.getParameter("fname"));
        ub.setLastname(request.getParameter("lname"));
        ub.setRoles(Integer.parseInt(request.getParameter("roles")));
        ub.setStatus(Integer.parseInt(request.getParameter("status")));
        ub.setGroup(Integer.parseInt(request.getParameter("group")));
        return userDb.editRecord(ub);
    }

    private ArrayList<Groups> getGroup() {
        int page = 0;
        return userDb.queryGroup(page);
    }
}
