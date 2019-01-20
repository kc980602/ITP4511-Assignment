/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.Groups;
import ict.bean.User;
import ict.db.GroupDB;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
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
@WebServlet(name = "GroupController", urlPatterns = {"/group"})
public class GroupController extends HttpServlet {

    private GroupDB groupDb;
    private User user;
    private Groups group;
    private String addGroup, updateGroup;

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        groupDb = new GroupDB(dbUrl, dbUser, dbPassword);
        groupDb.createGroupTable();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Groups> gps = new ArrayList();
        int numOfRecord = 0;
        if (isAuthenticatedAdmin(request)) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/group.jsp");
            request.setAttribute("group", group);
            String action = request.getParameter("action");
            if (action != null && action.equals("search")) {
                gps = searchGroup(request);
                numOfRecord = getNumOfRecord();
            } else if (action != null && action.equals("detail")) {
                String groupid = request.getParameter("groupid");
                request.setAttribute("userlist", getGroupDetail(groupid));
                rd = getServletContext().getRequestDispatcher("/portal/group_details.jsp");
            } else {
                gps = getGroup(request);
                numOfRecord = getNumOfRecord();
            }
            request.setAttribute("user", user);
            request.setAttribute("group", group);
            request.setAttribute("grouplist", gps);
            request.setAttribute("numOfRecord", numOfRecord);
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

                if (addGroup(request)) {
                    url = "group?edit=false&addfailed=false&name=" + addGroup;
                } else {
                    url = "group?edit=false&addfailed=true&name=" + addGroup;
                }
            }
            if (action.equals("update")) {
                if (updateGroup(request)) {
                    url = "group?edit=false&updatefailed=false&name=" + updateGroup;
                } else {
                    url = "group?edit=false&updatefailed=true&name=" + updateGroup;
                }
            }
            request.setAttribute("user", user);
            response.sendRedirect(url);
        } else {
            response.sendRedirect("login");
        }
    }

    private boolean isAuthenticatedAdmin(HttpServletRequest request) {
        boolean result = false;
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            user = (User) session.getAttribute("user");
            if (user.getRoles() == 0 || user.getRoles() == 2) {
                result = true;
            }
        }
        return result;
    }

    private boolean addGroup(HttpServletRequest request) {
        String name = request.getParameter("name");
        addGroup = name;
        String desc = request.getParameter("desc");
        return groupDb.addGroup(name, desc);
    }

    private ArrayList<Groups> getGroup(HttpServletRequest request) {
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        return groupDb.queryGroup(page);
    }

    private int getNumOfRecord() {
        return groupDb.countRecord();
    }

    private ArrayList<Groups> searchGroup(HttpServletRequest request) {
        int page = 1;
        long id;
        int status = -1;
        String name;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        id = !isNOWS(request.getParameter("id")) ? Long.parseLong(request.getParameter("id")) : -1;
        name = !isNOWS(request.getParameter("name")) ? request.getParameter("name") : null;
        status = Integer.valueOf(request.getParameter("status"));

        return groupDb.searchGroup(page, id, name, status);
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

    private boolean updateGroup(HttpServletRequest request) {
        Groups gb = new Groups();
        gb.setId(Long.parseLong(request.getParameter("id")));
        String name = request.getParameter("name");
        updateGroup = name;
        gb.setName(name);
        gb.setDescription(request.getParameter("desc"));
        gb.setStatus(Integer.parseInt(request.getParameter("status")));
        return groupDb.editRecord(gb);
    }

    public ArrayList<User> getGroupDetail(String id) {
        int groupid = Integer.parseInt(id);
        group = groupDb.queryGroupById(groupid);
        return groupDb.queryUserByGroup(groupid);

    }

}
