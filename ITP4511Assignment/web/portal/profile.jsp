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
                        <div class="content-title"><h1>// Edit Profile //</h1></div>
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
                            <div class='mt-4 mb-4'>
                                <form method="POST" action="profile">
                                    <div class="form-group">
                                        <label for="username" class="form-control-label">Username: <%= user.getUsername()%></label>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="fname" class="form-control-label">First Name:</label>
                                            <input type="text" class="form-control" name="fname" id="fname" maxlength="80" value="<%= user.getFirstname()%>" data-name="<%= user.getFirstname()%>">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="lname" class="form-control-label">Last Name:</label>
                                            <input type="text" class="form-control" name="lname" id="lname" maxlength="80" value="<%= user.getLastname()%>" data-name="<%= user.getLastname()%>">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="lname" class="form-control-label">Current Password:</label>
                                        <input type="password" class="form-control" name="cpassword" id="cpassword" maxlength="80">
                                    </div>
                                    <div class="form-group">
                                        <label for="lname" class="form-control-label">New Password:</label>
                                        <input type="password" class="form-control" name="password" id="password" maxlength="80">
                                    </div>
                                    <div class="form-group text-center">
                                        <button type="button" class="btn btn-secondary" id="btnReset">Reset</button>
                                        <input type="submit" class="btn btn-primary" value="Submit">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
        <script>
            $('#btnReset').click(function() {
                $('#password').val('');
                $('#cpassword').val('');
                $('#fname').val($('#fname').data('name'));
                $('#lname').val($('#lname').data('name'));
            });
        </script>
    </body>
</html>
