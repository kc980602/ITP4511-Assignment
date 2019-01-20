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

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    private UserDB userDb;

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        userDb = new UserDB(dbUrl, dbUser, dbPassword);
        userDb.createUserTable();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!isAuthenticated(request)) {
            doLogin(request, response);
        } else {
            showMain(response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (!isAuthenticated(request) && !("authenticate".equals(action))) {
            doLogin(request, response);
            return;
        }
        if ("authenticate".equals(action)) {
            doAuthenticate(request, response);
        } else if ("logout".equals(action)) {
            doLogout(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_IMPLEMENTED);
        }
    }

    protected void doAuthenticate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean isValid = userDb.isValidUser(username, password);
        if (isValid) {
            HttpSession session = request.getSession(true);
            User bean = userDb.queryCustByName(username);
            session.setAttribute("user", bean);
            showMain(response);
        } else {
            response.sendRedirect("login?failed=true");
        }
    }

    private boolean isAuthenticated(HttpServletRequest request) {
        boolean result = false;
        HttpSession session = request.getSession();
        // get the UserInfo from session
        if (session.getAttribute("user") != null) {
            result = true;
        }
        return result;
    }

    private void doLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
        dispatcher.forward(request, response);
    }

    private void showMain(HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("main");
    }

    private void doLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute("user");
            session.invalidate();
        }
        doLogin(request, response);
    }
}
