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
                        <div class="content-title"><h1>// Report //</h1></div>
                        <div class="closed-content">
                            <form id="addQuiz" action="report" method="GET">
                                <div class="modal-body">

                                    <input type="hidden" name="action" value="generate">
                                    <div class="form-group">
                                        <label for="report_select" class="col-form-label col-form-label-lg ">Generate Report by:</label>
                                        <div class="radio">
                                            <label><input type="radio" name="report_select" value="quiz">Quiz</label>
                                        </div>
                                        <div class="radio">
                                            <label><input type="radio" name="report_select" value="group">Group</label>
                                        </div>
                                        <div class="radio">
                                            <label><input type="radio" name="report_select" value="student">Student</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <select name="group_select" id="group_select" class="form-control" >
                                            <option disabled selected> Please select a group</option>
                                            <%
                                                ArrayList<Groups> groupList = (ArrayList<Groups>) request.getAttribute("groupList");
                                                if (!groupList.isEmpty()) {
                                                    for (Groups group : groupList) {
                                                        out.println("<option value=" + group.getId() + ">" + group.getName() + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                        <select name="student_select" id="student_select" class="form-control" >
                                            <option disabled selected> Please select a student</option>
                                            <%
                                                ArrayList<User> studentList = (ArrayList<User>) request.getAttribute("studentList");
                                                if (!studentList.isEmpty()) {
                                                    for (User student : studentList) {
                                                        out.println("<option value=" + student.getId() + ">" + student.getFirstname() + " " + student.getLastname() + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                        <select name="quiz_select" id="quiz_select" class="form-control" >
                                            <option disabled selected> Please select a quiz</option>
                                            <%
                                                ArrayList<Quiz> quizList = (ArrayList<Quiz>) request.getAttribute("quizList");
                                                if (!quizList.isEmpty()) {
                                                    for (Quiz quiz : quizList) {
                                                        out.println("<option value=" + quiz.getId() + ">" + quiz.getName() + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>

                                </div>

                                <div class="form-group">                     
                                    <input type="submit" class="btn btn-primary" value="Generate"/>
                                    <input type="reset" class="btn btn-secondary" value="Reset"/>
                                </div>


                            </form>
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
                $("#quiz_select").hide();
                $('input:radio[name="report_select"]').change(function () {
                    if ($(this).val() == 'group') {
                        $("#group_select").show();
                        $("#student_select").hide();
                        $("#quiz_select").hide();
                    } else if ($(this).val() == 'student') {
                        $("#group_select").hide();
                        $("#student_select").show();
                        $("#quiz_select").hide();
                    } else {
                        $("#group_select").hide();
                        $("#student_select").hide();
                        $("#quiz_select").show();
                    }
                });
            });
        </script>
    </body>
</html>
