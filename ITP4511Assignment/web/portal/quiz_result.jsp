<%@page import="java.text.SimpleDateFormat"%>
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
        <jsp:useBean id="quiz" scope="request" class="ict.bean.Quiz" />


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
                        <div class="content-title"><h1>// Report //</h1></div>
                        <div class="closed-content">
                            <h2> <center>Quiz Result of <%=quiz.getName()%></center></h2>
                            <fieldset class='closed-content'>
                                <legend>Summary</legend>
                                <%
                                    Object a = request.getAttribute("average");
                                    Object max = request.getAttribute("max");
                                    Object min = request.getAttribute("min");
                                    out.println("<h5> Average mark: " + a + "</h5>");
                                                                        out.println("<h5> Highest mark: " + max + "</h5>");
                                    out.println("<h5> Lowest mark: " + min + "</h5>");


                                %>
                            </fieldset>
                            <table class="table table-striped">
                                <tr>
                                    <th>Attempt</th>
                                    <th>Mark</th>
                                </tr>
                                <%
                                    ArrayList<Student_quiz> quizList = (ArrayList<Student_quiz>)request.getAttribute("quizList");
                                    if (!quizList.isEmpty()) {
                                        for (Student_quiz sq : quizList) {
                                            out.println("<tr><td>" + sq.getAttempt() + "</td>");
                                            out.println("<td>" + sq.getMark() + "</td></tr>");
                                        }
                                    }
                                %>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </main>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#group_select").hide();
                $("#student_select").hide();
                $('input:radio[name="assign"]').change(function () {
                    if ($(this).val() == 'group') {
                        $("#group_select").show();
                        $("#student_select").hide();
                    } else {
                        $("#group_select").hide();
                        $("#student_select").show();
                    }
                });
            });
        </script>
    </body>
</html>
