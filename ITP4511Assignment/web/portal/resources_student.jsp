<%@page import="java.beans.XMLEncoder"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="ict.bean.*, java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/ict-taglib.tld" prefix="ict" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Happy E-Learning | Template</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="./css/index.css" rel="stylesheet">
        <link href="./css/common.css" rel="stylesheet">
        <link rel="icon" href="./img/favicon.ico">
    </head>
    <body>
        <jsp:useBean id="user" scope="request" class="ict.bean.User" />

        <jsp:include page="./studentTopNav.jsp"/>

        <main role="main">
            <div class="container">
                <div class="welcome">
                    <h2>Welcome, <%= user.getFirstname() + " " + user.getLastname()%></h2>
                    <p>Welcome to the Happy E-Learning Platform</p>
                </div>
            </div>
            <div class="container">
                <div class="he-maincontent row">
                    <div class="he-maincontent-left">
                        <li class="nav-item nav-title">
                            <a class="nav-link disabled">Navgation</a>
                        </li>
                        <div class="content">
                            <jsp:include page="./studentSideNav.jsp"/>
                        </div>
                    </div>
                        
                    <div class="he-maincontent-right">
                        <div class="content-title"><h1>// Please select a module first //</h1></div>
                        <div class="closed-content">
                            <%
                                if (request.getParameter("failed") != null) {
                                    String message = request.getParameter("message");
                                    if (request.getParameter("failed").equals("true")) {
                            %>          <ict:message message="<%=message%>" type="danager"/>
                            <%      } else {
                            %>          <ict:message message="<%=message%>" type="success"/>
                            <%      }
                                }
                            %>
                            <%
                                ArrayList<Module> modulelist = (ArrayList<Module>) request.getAttribute("modulelist");
                                if (!modulelist.isEmpty()) {
                                    for (Module module : modulelist) {
                                        out.println("<div class='mb-4 mt-4'>"
                                                + "<h5>Module Code: "+module.getCode()+"</h5>"
                                                + "<div class='card'>"
                                                + "<div class='card-body'>"
                                                + "<h3><a href='module?id="+module.getId()+"'>"+module.getName()+"</a></h3>"
                                                + "</div>"
                                                + "</div>"
                                                + "</div>"
                                        );
                                    }
                                } else {
                                    out.println("<div class='mb-4'><h5>You don't have any module yet.</h5></div>");
                                }
                            %>
                        </div>
                    </div>
                </div>

            </div>
        </main>

        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    </body>
</html>
