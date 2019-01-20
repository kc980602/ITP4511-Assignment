<%-- 
    Document   : attempt
    Created on : 2018/1/4, 下午 06:48:29
    Author     : HaYYY
--%>

<%@page import="java.util.regex.Pattern"%>
<%@page import="ict.bean.User"%>
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
                    <%
                        Quiz quiz = (Quiz) request.getAttribute("quiz");
                    %>
                    <h1><a href="main">Home</a> / Quiz / <%=quiz.getName()%></h1>
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
                                if (request.getAttribute("questions") != null) {
                                    out.println("<h1>" + quiz.getName() + "</h1>");
                                    out.println("<form method='GET' action='studentQuiz'>");
                                    out.println("<input type='hidden' name='quizId' value='" + quiz.getId() + "'/>");
                                    out.println("<input type='hidden' name='action' value='finish'/>");
                                    ArrayList<Question> questions = (ArrayList<Question>) request.getAttribute("questions");
                                    ArrayList answers = (ArrayList) request.getAttribute("answers");
                                    String[] parts = null;

                                    for (int i = 0; i < questions.size(); i++) {
                                        Question q = questions.get(i);
                                        out.println("Q" + (i + 1) + ": " + q.getQuestion() + "<br />");
                                        if (q.getQuestionType().equalsIgnoreCase("multichoice")) {
                                            Question_multichoice qm = (Question_multichoice) answers.get(i);
                                            parts = qm.getOfferedAnswer().split(Pattern.quote(";"));
                                            for (int j = 0; j < parts.length; j++) {
                                                out.println("<label><input type='radio' name='Q" + (i + 1) + "' value='" + parts[j] + "'/>");
                                                out.println(parts[j] + "</label><br/>");
                                            }
                                        } else if (q.getQuestionType().equalsIgnoreCase("selection")) {
                                            Question_selection qs = (Question_selection) answers.get(i);
                                            parts = qs.getOfferedAnswer().split(Pattern.quote(";"));
                                            for (int j = 0; j < parts.length; j++) {
                                                out.println("<label><input type='checkbox' name='Q" + (i + 1) + "' value='" + parts[j] + "'/>" + parts[j] + "</label><br/>");
                                            }
                                        }
                                        out.println("<br />");
                                    }
                                    out.println("<center><input class='btn btn-success' type='submit' value='Submit'/>");
                                    out.println("<input class='btn btn-danger'type='reset' value='Reset'/></center>");
                                    out.println("</form>");
                                } else {
                                    out.println("database error occur!");
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
