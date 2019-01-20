/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.Module;
import ict.bean.Resources;
import ict.bean.User;
import ict.db.GroupDB;
import ict.db.ModuleDB;
import ict.db.ResourceDB;
import ict.db.UserDB;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author PokeGuys
 */
@WebServlet(name = "ResourceControlelr", urlPatterns = {"/resources"})
@MultipartConfig
public class ResourceControlelr extends HttpServlet {
    private ResourceDB resDb;
    private ModuleDB moduleDb;
    private GroupDB groupDb;
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
                    case "view":
                        showResource(request, response);
                        break;
                    case "search":
                        showSearch(request, response);
                        break;
                    case "download":
                        downloadFile(request, response);
                        break;
                    case "delete":
                        deleteFile(request, response);
                        break;
                    case "":
                        showManage(request, response);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_NOT_IMPLEMENTED);
                }
            } else {
                showManage(request, response);
            }
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
            if (user.getRoles() == 0) {
                String action = request.getParameter("action");
                switch (action) {
                    case "create":
                        createResource(request, response);
                        break;
                    case "edit":
                        editResource(request, response);
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

    private void createResource(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("file");
        String fileName = System.currentTimeMillis() + "_" +Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String name = request.getParameter("name");
        int module = Integer.parseInt(request.getParameter("module"));
        int section = Integer.parseInt(request.getParameter("section"));
        String timeopen = request.getParameter("startTime");
        String timeclose = request.getParameter("endTime");
        if (!"".equals(timeopen) && !"".equals(timeclose)) {
            timeopen = timeopen.replace("T", " ") + (timeopen.contains(":00.0") ? "" : ":00");
            timeclose = timeclose.replace("T", " ") +  (timeclose.contains(":00.0") ? "" : ":00");
            resDb.createRestrictedMaterial(module, section, name, fileName, Timestamp.valueOf(timeopen), Timestamp.valueOf(timeclose));
        } else {
            resDb.createMaterial(module, section, name, fileName);
        }
        
        try (InputStream fileContent = filePart.getInputStream()) {
            File targetFile = new File(getServletContext().getRealPath("") + File.separator + "upload" + File.separator + fileName);
            Files.copy(fileContent,  targetFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }
        request.setAttribute("user", user);
        response.sendRedirect("resources?failed=false&message=Resource upload successfully");
    }

    private ArrayList<Resources> getResources() {
        return resDb.getMaterial();
    }

    private void showManage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            ArrayList<Resources> res = getResources();
            ArrayList<Module> modules = moduleDb.queryModule();
            request.setAttribute("resourcelist", res);
            request.setAttribute("modulelist", modules);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/resources.jsp");
            rd.forward(request, response);
        } else {
            ArrayList<Module> modules = groupDb.getModules(user.getGroup());
            request.setAttribute("modulelist", modules);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/resources_student.jsp");
            rd.forward(request, response);
        }
    }

    private void showResource(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            String id = request.getParameter("id");
            if (id != null) {
                Resources res = resDb.getMaterial(Integer.parseInt(id));
                request.setAttribute("resource", res);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/resources_details.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("main");
            }
        } else {
            response.sendRedirect("main");
        }
    }

    private void showSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            String keyword = request.getParameter("keyword");
            if (keyword != null) {
                ArrayList<Resources> resourcelist = resDb.getMaterial(keyword);
                ArrayList<Module> modules = moduleDb.queryModule();
                request.setAttribute("resourcelist", resourcelist);
                request.setAttribute("modulelist", modules);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/resources.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("main");
            }
        } else {
            response.sendRedirect("main");
        }
    }

    private void downloadFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (isAllowDownload()) {
            String id = request.getParameter("id");
            if (id != null) {
                Resources res = resDb.getMaterial(Integer.parseInt(id));
                if (res != null) {
                    if (user.getRoles() != 0) {
                        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                        Timestamp timeopen = res.getTimeopen();
                        Timestamp timeclose = res.getTimeclose();
                        if (timeopen != null && timeclose != null) {
                            if (timestamp.before(timeopen) || timestamp.after(timeclose)) {
                                response.sendRedirect("resources?failed=true&message=Resource is not accessible");
                                return;
                            }
                        }
                    }
                    response.setContentType("text/plain");
                    response.setHeader("Content-disposition","attachment; filename="+res.getFileName());
                    File my_file = new File(getServletContext().getRealPath("") + File.separator + "upload" + File.separator + res.getFileName());

                    OutputStream out = response.getOutputStream();
                    FileInputStream in = new FileInputStream(my_file);
                    byte[] buffer = new byte[4096];
                    int length;
                    while ((length = in.read(buffer)) > 0){
                       out.write(buffer, 0, length);
                    }
                    in.close();
                    out.flush();
                } else {
                    response.sendRedirect("resources?failed=true&message=Resource not found");
                }
            } else {
                response.sendRedirect("main");
            }
        } else {
            response.sendRedirect("main");
        }
    }

    private boolean isAllowDownload() {
        boolean valid = hasModule(user.getGroup());
        return user.getRoles() == 0 || valid;
    }

    private void deleteFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            String id = request.getParameter("id");
            boolean success = false;
            if (id != null) {
                success = resDb.removeMaterial(Integer.parseInt(id));
            }
            ArrayList<Resources> res = getResources();
            ArrayList<Module> modules = moduleDb.queryModule();
            request.setAttribute("resourcelist", res);
            request.setAttribute("modulelist", modules);
            request.setAttribute("user", user);
            String message = success ? "Resource removed" : "Resource not found";
            response.sendRedirect("resources?failed=" + !success + "&message=" + message);
        } else {
            response.sendRedirect("main");
        }
    }

    private void editResource(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("file");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        if (!fileName.equals("")) {
            fileName = System.currentTimeMillis() + "_" + fileName;
        }
        String name = request.getParameter("name");
        int id = Integer.parseInt(request.getParameter("id"));
        int module = Integer.parseInt(request.getParameter("module"));
        int section = Integer.parseInt(request.getParameter("section"));
        String timeopen = request.getParameter("startTime");
        String timeclose = request.getParameter("endTime");
        if (!"".equals(timeopen) && !"".equals(timeclose)) {
            timeopen = timeopen.replace("T", " ") + (timeopen.contains(":00.0") ? "" : ":00");
            timeclose = timeclose.replace("T", " ") +  (timeclose.contains(":00.0") ? "" : ":00");
            resDb.modifyRestrictedMaterial(id, module, section, name, fileName, Timestamp.valueOf(timeopen), Timestamp.valueOf(timeclose));
        } else {
            resDb.modifyMaterial(id, module, section, name, fileName);
        }
        if (!fileName.equals("")) {
            try (InputStream fileContent = filePart.getInputStream()) {
                File targetFile = new File(getServletContext().getRealPath("") + File.separator + "upload" + File.separator + fileName);
                Files.copy(fileContent,  targetFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }
        }
        request.setAttribute("user", user);
        response.sendRedirect("resources?failed=false&message=Resource update successfully");
    }

    private boolean hasModule(int group) {
        ArrayList<Module> modules = groupDb.getModules(group);
        return !modules.isEmpty();
    }
}
