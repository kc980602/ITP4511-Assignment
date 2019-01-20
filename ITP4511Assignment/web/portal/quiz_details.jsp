<%@page import="java.time.LocalDateTime"%>
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
        <jsp:useBean id="quizAssignment" scope="request" class="ict.bean.QuizAssignment" />
        <jsp:useBean id="questionList" scope="request" class="java.util.ArrayList<ict.bean.Question>" />
        <jsp:useBean id="groupList" scope="request" class="java.util.ArrayList<ict.bean.Groups>" />
        <jsp:useBean id="studentList" scope="request" class="java.util.ArrayList<ict.bean.User>" />
        <jsp:useBean id="selectedQuestionList" scope="request" class="java.util.ArrayList<ict.bean.Question>" />
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
                    <%
                        LocalDateTime timeOpen = quiz.getTimeOpen().toLocalDateTime();
                        LocalDateTime timeClose = quiz.getTimeClose().toLocalDateTime();
                    %>
                    <div class="he-maincontent-right">
                        <div class="content-title"><h1>// Edit Quiz //</h1></div>
                        <div class="closed-content">

                            <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Add Question</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <form id="addQuiz" action="quiz" method="GET">
                                            <div class="modal-body">

                                                <input type="hidden" name="action" value="addQuestion">
                                                <input type="hidden" name="quiz_id" value=<%=quiz.getId()%>>
                                                <div class="row">
                                                    <div class="form-group col-md-3">
                                                        <label for="startTime" class="form-control-label">Select Question:</label>
                                                    </div>

                                                    <div class="form-group col-md-9">
                                                        <select name="question_select" id="question_select" class="form-control" >
                                                            <option selected disabled>Please select a question</option>
                                                            <%
                                                                if (!questionList.isEmpty()) {
                                                                    for (Question question : questionList) {
                                                                        out.println("<option value=" + question.getId() + ">" + question.getQuestion() + "</option>");
                                                                    }
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <div class="form-group">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                    <input type="submit" class="btn btn-primary" value="Add"/>
                                                </div>

                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>

                            <form id="editQuiz" action="quiz" method="GET">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="quiz_id" value=<%=quiz.getId()%>>
                                <input type="hidden" name="qa_id" value=<%=quizAssignment.getId()%>>

                                <div class="form-group">
                                    <label for="name" class="form-control-label">Name</label>
                                    <input type="text" class="form-control" name="name" maxlength="80" value=<%=quiz.getName()%> required>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="startTime" class="form-control-label">Start Time:</label>
                                        <input type="datetime-local" class="form-control" name="startTime" value=<%=timeOpen%> required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="endTime" class="form-control-label">End Time:</label>
                                        <input type="datetime-local" class="form-control" name="endTime" value=<%=timeClose%> required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="attempt" class="form-control-label">No. of Attempt:</label>
                                        <input type="number" class="form-control" name="attempt" min="0" value=<%=quiz.getAttempts()%> required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="timeLimit" class="form-control-label">Time Limit:</label>
                                        <input type="number" class="form-control" name="timeLimit" min="0" value=<%=quiz.getTimeLimit()%> required>

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="intro" class="form-control-label">Intro (Optional)</label>
                                    <textarea class="form-control" rows="3" name="intro"><%=quiz.getIntro()%></textarea>
                                </div>

                                <div class="form-group">

                                    <label for="status" class="form-control-label ">Status</label>
                                    <select name="status" id="status" class="form-control" required>
                                        <%
                                            if (quiz.getStatus() == 0) {
                                                out.println("<option selected value=0>Close</option> <option value=1>Open</option>");
                                            } else {
                                                out.println("<option value=0>Close</option><option selected value=1>Open</option>");
                                            }
                                        %>
                                    </select>

                                </div>

                                <fieldset class="form-group">
                                    <div class="row">
                                        <label class="form-control-label col-sm-2 pt-0">Assign To:</label>
                                        <div class="col-sm-3">
                                            <div class="form-check">

                                                <input class="form-check-input" type="radio" name="assign" id="group" value="group" <%
                                                    if (quizAssignment != null) {
                                                        if (quizAssignment.getType().equals("group")) {
                                                            out.print("checked");
                                                        }
                                                    } else {
                                                    }
                                                       %> required>
                                                <label class="form-check-label" for="group">
                                                    A Group
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="assign" id="student" value="student"<%
                                                    if (quizAssignment != null) {
                                                        if (quizAssignment.getType().equals("student")) {
                                                            out.print("checked");
                                                        }
                                                    } else {
                                                    }
                                                       %>>
                                                <label class="form-check-label" for="student">
                                                    A Student
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-sm-5">
                                            <div class="form-group">
                                                <select name="group_select" id="group_select" class="form-control" >
                                                    <option disabled > Please select a group</option>
                                                    <%
                                                        if (!groupList.isEmpty()) {
                                                            for (Groups group : groupList) {
                                                                if (quizAssignment.getGroups() == group.getId()) {
                                                                    out.println("<option selected value=" + group.getId() + ">" + group.getName() + "</option>");
                                                                } else {
                                                                    out.println("<option value=" + group.getId() + ">" + group.getName() + "</option>");
                                                                }
                                                            }
                                                        }
                                                    %>
                                                </select>
                                                <select name="student_select" id="student_select" class="form-control" >
                                                    <option disabled > Please select a student</option>
                                                    <%
                                                        if (!studentList.isEmpty()) {
                                                            for (User student : studentList) {
                                                                if (quizAssignment.getStudent() == student.getId()) {
                                                                    out.println("<option selected value=" + student.getId() + ">" + student.getFirstname() + " " + student.getLastname() + "</option>");
                                                                } else {
                                                                    out.println("<option value=" + student.getId() + ">" + student.getFirstname() + " " + student.getLastname() + "</option>");
                                                                }
                                                            }
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>

                                <fieldset class="form-group">
                                    <legend>Quiz Question </legend>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal">
                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                    </button>
                                    <table class="table table-striped">
                                        <tr>
                                            <th>Name</th>
                                            <th>Question Type</th>
                                            <th>Module</th>
                                            <th>Action</th>
                                        </tr>
                                        <%

                                            if (!selectedQuestionList.isEmpty()) {
                                                for (Question question : selectedQuestionList) {
                                                    out.println("<tr>"
                                                            + "<td>" + question.getQuestion()+ "</td>"
                                                            + "<td>" + question.getQuestionType() + "</td>"
                                                            + "<td>" + question.getModule()+ "</td>"
                                                            + "<td><a href='quiz?action=deleteQuestion&quiz_id=" + quiz.getId() + "&question_id=" + question.getId() + "'><button type='button' class='btn btn-sm btn-danger'><i class='fa fa-trash' aria-hidden='true'></i></button>"
                                                            + "</td>"
                                                            + "</tr>"
                                                    );
                                                }
                                            }
                                        %>
                                    </table>
                                </fieldset>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary" value="Save"/>
                                    <a href="quiz"></a><button type="button" class="btn btn-secondary" >Cancel</button>
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
                var assign = $('input:radio[name="assign"]:checked').val();
                if (assign == "group") {
                    $("#group_select").show();
                } else {
                    $("#student_select").show();
                }
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
