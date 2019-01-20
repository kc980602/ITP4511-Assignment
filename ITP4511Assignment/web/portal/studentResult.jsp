<%-- 
    Document   : attempt
    Created on : 2018/1/4, 下午 06:48:29
    Author     : HaYYY
--%>

<%@page import="ict.bean.Student_quiz"%>
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
                    <h1><a href="main">Home</a> / Quiz Result</h1>
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
                        <%
                            Object marks = null;
                            Object quiz = null;
                            ArrayList<Student_quiz> sqs = null;
                            if (request.getAttribute("marks") != null) {
                                marks = request.getAttribute("marks");
                                out.println("<br/>");
                                out.println("<center><h1>Total marks = ");
                                if (Integer.parseInt(marks.toString()) < 6) {
                                    out.println("<span style='color:#D00'>" + marks.toString() + "</span>");
                                } else {
                                    out.println("<span style='color:#0D0'>" + marks.toString() + "</span>");
                                }
                                out.println("/10</h1></center>");
                            } else {
                                out.println("No answer");
                            }
                            if (request.getAttribute("quiz") != null) {
                                quiz = request.getAttribute("quiz");
                            }
                        %>
                        <table class="table table-striped">
                            <tr>
                                <th>Quiz ID</th>
                                <th>Your Marks</th>
                                <th>Total Marks</th>
                                <th>Attempt</th>
                            </tr>
                            <%
                                if (request.getAttribute("attemptDetail") != null) {
                                    sqs = (ArrayList<Student_quiz>) request.getAttribute("attemptDetail");
                                    for (int i = 0; i < sqs.size(); i++) {
                                        Student_quiz sq = sqs.get(i);
                                        out.println("<tr>");
                                        out.println("<td>" + sq.getQuiz() + "</td>");
                                        out.println("<td>" + sq.getMark() + "</td>");
                                        out.println("<td>" + request.getAttribute("totalMarks") + "</td>");
                                        out.println("<td>" + sq.getAttempt() + "</td>");
                                        out.println("</tr>");
                                    }
                                }
                            %>
                        </table>
                    </div>
                </div>
            </div>
        </main>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    </body>
</html>
