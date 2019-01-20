/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.Groups;
import ict.bean.Module;
import ict.bean.Module_sections;
import ict.bean.Resources;
import ict.bean.User;
import ict.db.GroupDB;
import ict.db.ModuleDB;
import ict.db.ResourceDB;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author PokeGuys
 */
@WebServlet(name = "ModuleController", urlPatterns = {"/module"})
public class ModuleController extends HttpServlet {

    private ResourceDB resDb;
    private GroupDB groupDb;
    private ModuleDB moduleDb;
    public User user;

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        resDb = new ResourceDB(dbUrl, dbUser, dbPassword);
        moduleDb = new ModuleDB(dbUrl, dbUser, dbPassword);
        groupDb = new GroupDB(dbUrl, dbUser, dbPassword);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (isAuthenticated(request)) {
            HttpSession session = request.getSession();
            user = (User) session.getAttribute("user");
            request.setAttribute("user", user);
            String action;
            if ((action = request.getParameter("action")) != null) {
                switch (action) {
                    case "section":
                        showSection(request, response);
                        break;
                    case "deletesection":
                        deleteSection(request, response);
                        break;
                    case "search":
                        searchModules(request, response);
                        break;
                    case "delete":
                        deleteModule(request, response);
                        break;
                    case "":
                        showModules(request, response);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_NOT_IMPLEMENTED);
                }
            } else {
                showModules(request, response);
            }
        } else {
            response.sendRedirect("login");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (isAuthenticated(request)) {
            HttpSession session = request.getSession();
            user = (User) session.getAttribute("user");
            request.setAttribute("user", user);
            if (user.getRoles() == 0) {
                String action = request.getParameter("action");
                switch (action) {
                    case "addsection":
                        addSection(request, response);
                        break;
                    case "editsection":
                        editSection(request, response);
                        break;
                    case "create":
                        createModule(request, response);
                        break;
                    case "edit":
                        editModule(request, response);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_NOT_IMPLEMENTED);
                }
            } else {
                response.sendRedirect("main");
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

    private void showModules(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            ArrayList<Module> modules = moduleDb.queryModule();
            ArrayList<Groups> grouplist = groupDb.getAllGroups();
            request.setAttribute("groupList", grouplist);
            request.setAttribute("modulelist", modules);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/module.jsp");
            rd.forward(request, response);
        } else {
            String id = request.getParameter("id");
            if (id != null) {
                ArrayList<Module> modules = groupDb.getModules(user.getGroup());
                if (!modules.isEmpty()) {
                    Module module = moduleDb.queryModuleByID(Integer.parseInt(id));
                    if (module != null) {
                        ArrayList<Resources> res = resDb.getMaterialByModule(module.getId());
                        request.setAttribute("resourcelist", res);
                        request.setAttribute("module", module);
                        RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/module_student.jsp");
                        rd.forward(request, response);
                    } else {
                        response.sendRedirect("resources?failed=true&message=Invalid module id.");
                    }
                } else {
                    response.sendRedirect("resources?failed=true&message=You are not studying that module");
                }
            } else {
                response.sendRedirect("resources?failed=true&message=Invalid module id.");
            }
        }
    }

    private void deleteModule(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (user.getRoles() == 0) {
            if (id != null) {
                Module module = moduleDb.queryModuleByID(Integer.parseInt(id));
                if (module != null) {
                    moduleDb.removeModule(module.getId());
                    response.sendRedirect("module?failed=false&message=Module Removed.");
                } else {
                    response.sendRedirect("module?failed=true&message=Invalid module id.");
                }
            } else {
                response.sendRedirect("module?failed=true&message=Invalid module id.");
            }
        } else {
            response.sendRedirect("main");
        }
    }

    private void createModule(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] assigned = request.getParameterValues("group_select");
        String name = request.getParameter("name");
        String code = request.getParameter("code");
        request.setAttribute("user", user);
        
        if (moduleDb.queryModuleByName(name) == null) {
            if (assigned != null && assigned.length > 0) {
                moduleDb.addModuleWithAssigned(name, code, assigned);
            } else {
                moduleDb.addModule(name, code);
            }
            response.sendRedirect("module?failed=false&message=Module created");
        } else {
            response.sendRedirect("module?failed=true&message=Module is already created");
        }
    }

    private void editModule(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String[] assigned = request.getParameterValues("group_select");
        String name = request.getParameter("name");
        String code = request.getParameter("code");
        request.setAttribute("user", user);
        
        if (!id.equals("")) {
            if (moduleDb.queryModuleByID(Integer.parseInt(id)) != null) {
                moduleDb.modifyModule(Integer.parseInt(id), name, code, assigned);
                response.sendRedirect("module?failed=false&message=Module modified");
            } else {
                response.sendRedirect("module?failed=true&message=Module is not exists");
            }
        } else {
            response.sendRedirect("module?failed=true&message=Module is not exists");
        }
    }

    private void searchModules(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            String keyword = request.getParameter("keyword");
            if (keyword != null) {
                ArrayList<Module> modules = moduleDb.queryModule(keyword);
                ArrayList<Groups> grouplist = groupDb.getAllGroups();
                request.setAttribute("groupList", grouplist);
                request.setAttribute("modulelist", modules);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/module.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("main");
            }
        } else {
            response.sendRedirect("main");
        }
    }

    private void showSection(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            String id = request.getParameter("id");
            if (id != null) {
                Module module = moduleDb.queryModuleByID(Integer.parseInt(id));
                request.setAttribute("module", module);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/section.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("main");
            }
        } else {
            response.sendRedirect("main");
        }
    }

    private void addSection(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        request.setAttribute("user", user);
        Module m = moduleDb.queryModuleByID(Integer.parseInt(id));
        if (m != null) {
            moduleDb.addSection(m.getId(), name);
            response.sendRedirect("module?failed=false&message=Module section created");
        } else {
            response.sendRedirect("module?failed=true&message=Module not exists");
        }
    }

    private void editSection(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        request.setAttribute("user", user);
        Module_sections s = moduleDb.querySectionById(Integer.parseInt(id));
        if (s != null) {
            moduleDb.editSection(Integer.parseInt(id), name);
            response.sendRedirect("module?failed=false&message=Module section modified");
        } else {
            response.sendRedirect("module?failed=true&message=Module not exists");
        }
    }

    private void deleteSection(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        request.setAttribute("user", user);
        Module_sections s = moduleDb.querySectionById(Integer.parseInt(id));
        if (s != null) {
            moduleDb.removeSection(Integer.parseInt(id));
            response.sendRedirect("module?failed=false&message=Module section removed");
        } else {
            response.sendRedirect("module?failed=true&message=Module not exists");
        }
    }
}
