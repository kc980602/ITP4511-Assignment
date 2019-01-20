<%@page import="ict.bean.*, java.util.*, java.util.ArrayList"%>
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
        <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
        <script>

        </script>
    </head>
    <body>
        <jsp:useBean id="user" scope="request" class="ict.bean.User" />
        <jsp:useBean id="userlist" scope="request" class="java.util.ArrayList<ict.bean.User>"/>
        <jsp:useBean id="group" scope="request" class="ict.bean.Groups" />
        <jsp:include page="./adminTopNav.jsp"/>
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
                            <jsp:include page="./adminSideNav.jsp"/>
                        </div>
                    </div>
                    <div class="he-maincontent-right">
                        <div class="content-title"><h1>// <%=group.getName()%> - Participants //</h1></div>
                        <div class="closed-content">
                            <div class="control row">
                                <div class="col-12">
                                    <h2>All participants: <%= userlist.size()%></h2>
                                </div>
                            </div>

                            <table id="user" class="table table-striped" style="width:856px">
                                <thead>
                                    <tr>
                                        <th scope="col" style="width:56px">Id</th>
                                        <th scope="col" style="width:200px">First Name</th>
                                        <th scope="col" style="width:200px">Last Name</th>
                                        <th scope="col" style="width:200px">Username</th>
                                        <th scope="col" style="width:100px">Roles</th>
                                        <th scope="col" style="width:100px">Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%if (userlist.size() == 0) {%>      
                                    <ict:message message="No result found!" type="info"/>
                                    <%}%>
                                    <%
                                        for (int i = 0; i < userlist.size(); i++) {
                                            String print;
                                            User ub = userlist.get(i);
                                            String roles = ub.getRoles() == 0 ? "Admin/Teacher" : "Student";
                                            String status = ub.getStatus() == 0 ? "In use" : "Deleted";
                                            print = "<tr id='" + ub.getId() + "'><th scope='row'>" + ub.getId() + "</th><td>"
                                                    + ub.getFirstname() + "</td><td>"
                                                    + ub.getLastname() + "</td><td>"
                                                    + ub.getUsername() + "</td><td>"
                                                    + roles + "</td><td>"
                                                    + status + "</td>";
                                            out.print(print + "</tr>");
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>

            </div>
        </main>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    </body>
</html>
