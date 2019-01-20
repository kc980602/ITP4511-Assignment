<%-- 
    Document   : attempt
    Created on : 2018/1/4, 下午 06:48:29
    Author     : HaYYY
--%>

<%@page import="ict.bean.Quiz"%>
<%@page import="ict.bean.Question_multichoice"%>
<%@page import="ict.bean.Question_selection"%>
<%@page import="ict.bean.Question"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Happy E-Learning | Student Quiz</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/1.7.22/css/materialdesignicons.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="./css/index.css" rel="stylesheet">
        <link href="./css/common.css" rel="stylesheet">
    </head>
    <body>
        <jsp:useBean id="user" scope="request" class="ict.bean.User" />
        <jsp:include page="./studentTopNav.jsp"/>
        <main role="main">
            <div class="container">
                <div class="welcome">
                    <h1><a href="main">Home</a> / Quiz List</h1>
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
                            <br/>
                            <%
                                ArrayList<Quiz> quizzes = null;
                                ArrayList numberOfAttempt = null;
                                if (request.getAttribute("quizzes") != null) {
                                    quizzes = (ArrayList<Quiz>) request.getAttribute("quizzes");
                                    numberOfAttempt = (ArrayList) request.getAttribute("numberOfAttempt");
                                    out.println("<table class='table table-striped'>");
                                    out.println("<tr>");
                                    out.println("<th>Quiz</th>");
                                    out.println("<th>Open</th>");
                                    out.println("<th>Close</th>");
                                    out.println("<th>Time Limit</th>");
                                    out.println("<th>Attempt</th>");
                                    out.println("<th>Action</th>");
                                    out.println("</tr>");
                                    for (int i = 0; i < quizzes.size(); i++) {
                                        Quiz quiz = quizzes.get(i);
                                        out.println("<tr>");
                                        out.println("<td>" + quiz.getId() + "</td>");
                                        out.println("<td>" + quiz.getTimeOpen() + "</td>");
                                        out.println("<td>" + quiz.getTimeClose() + "</td>");
                                        out.println("<td>" + quiz.getTimeLimit() + "mins</td>");
                                        out.println("<td>" + numberOfAttempt.get(i) + "/" + quiz.getAttempts() + "</td>");
                                        out.println("<td><form method='post' action='studentQuiz?action=quiz'>");
                                        out.println("<input type='hidden' name='quizId'value='" + quiz.getId() + "'/>");
                                        out.println("<input class='btn btn-primary' type='submit' value='Attempt'");
                                        if (Integer.parseInt(numberOfAttempt.get(i).toString()) >= quiz.getAttempts()) {
                                            out.println("disabled");
                                        }
                                        out.println("/>");
                                        out.println("</form></td>");
                                        out.println("</tr>");
                                    }
                                    out.println("</table>");
                                } else {
                                    out.println("<center><h1><b>No quiz at this moment.</b></h1></center><br/>");
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    </body>
</html>
