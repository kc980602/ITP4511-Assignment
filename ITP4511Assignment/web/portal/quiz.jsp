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
                        <div class="content-title"><h1>// Quiz Management //</h1></div>
                        <div class="closed-content">
                            <div class="control row">
                                <div class="col-6">
                                    <div class="input-group">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal">
                                            <i class="fa fa-plus" aria-hidden="true"></i>
                                        </button>
                                        <div class="px-2"></div>
                                        <span class="input-group-addon" id="sizing-addon2"><i class="fa fa-search" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" placeholder="Keyword" aria-describedby="sizing-addon2" name="keyword" id="keyword">
                                    </div>
                                </div>
                            </div>
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
                            <table class="table table-striped">
                                <tr>
                                    <th>Quiz ID</th>
                                    <th>Name</th>
                                    <th>Open</th>
                                    <th>Close</th>
                                    <th>Attempt</th>
                                    <th>Time Limit</th>
                                    <th>Action</th>
                                </tr>
                                <%
                                    ArrayList<Quiz> quizList = (ArrayList<Quiz>) request.getAttribute("quizList");
                                    if (!quizList.isEmpty()) {
                                        for (Quiz quiz : quizList) {
                                            out.println("<tr>"
                                                    + "<td>" + quiz.getId() + "</td>"
                                                    + "<td>" + quiz.getName() + "</td>"
                                                    + "<td>" + new SimpleDateFormat("dd/MM/yyyy hh:mm").format(quiz.getTimeOpen()) + "</td>"
                                                    + "<td>" + new SimpleDateFormat("dd/MM/yyyy hh:mm").format(quiz.getTimeClose()) + "</td>"
                                                    + "<td>" + quiz.getAttempts() + "</td>"
                                                    + "<td>" + quiz.getTimeLimit() + "</td>"
                                                    + "<td><a href='quiz?action=view&id=" + quiz.getId() + "'><button type='button' class='btn btn-sm btn-primary'>Edit</button></a> "
                                                    + "<a href='quiz?action=delete&id=" + quiz.getId() + "'><button type='button' class='btn btn-sm btn-danger'><i class='fa fa-trash' aria-hidden='true'></i></button>"
                                                    + "</td>"
                                                    + "</tr>"
                                            );
                                        }
                                    } else {
                                        out.println("<tr><td colspan='7' style='text-align: center;'>No Record</td></tr>");
                                    }
                                %>
                            </table>

                            <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Create New Quiz</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <form id="addQuiz" action="quiz" method="GET">
                                            <div class="modal-body">

                                                <input type="hidden" name="action" value="add">
                                                <div class="form-group">
                                                    <label for="name" class="form-control-label">Name</label>
                                                    <input type="text" class="form-control" name="name" maxlength="80" required>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group col-md-6">
                                                        <label for="startTime" class="form-control-label">Start Time:</label>
                                                        <input type="datetime-local" class="form-control" name="startTime" required>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="endTime" class="form-control-label">End Time:</label>
                                                        <input type="datetime-local" class="form-control" name="endTime" required>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group col-md-6">
                                                        <label for="attempt" class="form-control-label">No. of Attempt:</label>
                                                        <input type="number" class="form-control" name="attempt" min="0" required>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="timeLimit" class="form-control-label">Time Limit:</label>
                                                        <input type="number" class="form-control" name="timeLimit" min="0" required>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="intro" class="form-control-label">Intro (Optional)</label>
                                                    <textarea class="form-control" rows="3" name="intro"></textarea>
                                                </div>

                                                <fieldset class="form-group">
                                                    <div class="row">
                                                        <label class="form-control-label col-sm-2 pt-0">Assign To</label>
                                                        <div class="col-sm-3">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="radio" name="assign" id="group" value="group" required>
                                                                <label class="form-check-label" for="group">
                                                                    A Group
                                                                </label>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="radio" name="assign" id="student" value="student">
                                                                <label class="form-check-label" for="student">
                                                                    A Student
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-5">
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
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                                                
                                            </div>
                                            <div class="modal-footer">
                                                <div class="form-group">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <input type="submit" class="btn btn-primary" value="Create"/>
                                                </div>

                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>
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
                
                $('#keyword').keypress(function (e) {
                if (e.which === 13) {
                    window.location.href = 'quiz?action=search&keyword=' + $(this).val()
                }
            })
                $("#group_select").hide();
                $("#student_select").hide();
                $('input:radio[name="assign"]').change(function () {
                    if ($(this).val() == 'group') {
                        $("#group_select").show();
                        $("#group_select").attr("required", true);
                        $("#student_select").hide();
                        $("#student_select").attr("required", false);
                    } else {
                        $("#group_select").hide();
                        $("#group_select").attr("required", false);
                        $("#student_select").show();
                        $("#student_select").attr("required", true);
                    }
                });
            });
        </script>
    </body>
</html>
