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

                            <%
                                ArrayList<Student_quiz> resultList = (ArrayList<Student_quiz>) request.getAttribute("resultList");
                                ArrayList<Quiz> quizList = (ArrayList<Quiz>) request.getAttribute("quizList");
                                ArrayList<User> studentList = (ArrayList<User>) request.getAttribute("studentList");
                                ArrayList<User> minStudent = (ArrayList<User>) request.getAttribute("minStudent");
                                ArrayList<User> maxStudent = (ArrayList<User>) request.getAttribute("maxStudent");
                                ArrayList<Groups> groupList = (ArrayList<Groups>) request.getAttribute("groupList");
                                String report_select = (String) request.getAttribute("report_select");
                                String title = (String) request.getAttribute("title");
                                out.println("<h2> <center>Report of " + title + "</center></h2>");
                            %>
                            <fieldset class='closed-content'>
                                <legend>Report Summary</legend>
                                <%
                                    Object a = request.getAttribute("average");
                                    out.println("<h5> Average mark of " + title + ": " + a + "</h5>");

                                    if (report_select.equals("quiz")) {
                                        out.println("<h5>Student(s) with lowest mark: ");
                                        if (!minStudent.isEmpty()) {
                                            for (User student : minStudent) {
                                                out.println(student.getFirstname() + " " + student.getLastname());
                                            }
                                        }
                                        out.println("</h5>");
                                        out.println("<h5>Student(s) with highest mark: ");
                                        if (!maxStudent.isEmpty()) {
                                            for (User student : maxStudent) {
                                                out.println(student.getFirstname() + " " + student.getLastname());
                                            }
                                        }
                                        out.println("</h5>");
                                    }
                                %>
                            </fieldset>

                            <table class="table table-striped">
                                <tr>
                                    <%
                                        if (report_select.equals("student")) {
                                            out.println("<th>Quiz</th>");
                                        } else if (report_select.equals("group")) {
                                            out.println("<th>Student</th><th>Quiz</th>");
                                        } else {
                                            out.println("<th>Student</th>");
                                        }
                                    %>                               
                                    <th>Mark</th>
                                    <th>Attempt</th>
                                </tr>
                                <%
                                    if (report_select.equals("student")) {
                                        if (!resultList.isEmpty()) {
                                            for (Student_quiz sq : resultList) {
                                                out.println("<tr>");
                                                for (int i = 0; i < quizList.size(); i++) {
                                                    if (sq.getQuiz() == quizList.get(i).getId()) {
                                                        out.println("<td>" + quizList.get(i).getName() + "</td>");
                                                    }
                                                }
                                                out.println("<td>" + sq.getMark() + "</td>"
                                                        + "<td>" + sq.getAttempt() + "</td>"
                                                        + "</tr>"
                                                );
                                            }
                                        }
                                    } else if (report_select.equals("group")) {
                                        if (!resultList.isEmpty()) {
                                            for (Student_quiz sq : resultList) {
                                                out.println("<tr>");
                                                for (int i = 0; i < studentList.size(); i++) {
                                                    if (sq.getStudent() == studentList.get(i).getId()) {
                                                        out.println("<td>" + studentList.get(i).getFirstname() + " " + studentList.get(i).getLastname() + "</td>");
                                                    }
                                                }
                                                for (int i = 0; i < quizList.size(); i++) {
                                                    if (sq.getQuiz() == quizList.get(i).getId()) {
                                                        out.println("<td>" + quizList.get(i).getName() + "</td>");
                                                    }
                                                }
                                                out.println("<td>" + sq.getMark() + "</td>"
                                                        + "<td>" + sq.getAttempt() + "</td>"
                                                        + "</tr>"
                                                );
                                            }
                                        }
                                    } else {
                                        if (!resultList.isEmpty()) {
                                            for (Student_quiz sq : resultList) {
                                                out.println("<tr>");
                                                for (int i = 0; i < studentList.size(); i++) {
                                                    if (sq.getStudent() == studentList.get(i).getId()) {
                                                        out.println("<td>" + studentList.get(i).getFirstname() + " " + studentList.get(i).getLastname() + "</td>");
                                                    }
                                                }
                                                out.println("<td>" + sq.getMark() + "</td>"
                                                        + "<td>" + sq.getAttempt() + "</td>"
                                                        + "</tr>"
                                                );
                                            }
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
