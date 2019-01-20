<%@page import="ict.bean.Question"%>
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
        <jsp:useBean id="modulelist" scope="request" class="java.util.HashMap"/>
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
                        <div class="content-title"><h1>// Question Management //</h1></div>
                        <div class="closed-content">
                            <div class="control row">
                                <div class="col-2">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal">
                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#searchModal">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                    </button>
                                </div>
                                <div class="col-8">
                                </div>

                                <div class="col-2">

                                </div>
                            </div>
                            <%
                                if (request.getAttribute("addfailed") != null) {
                                    String message;
                                    if (request.getAttribute("addfailed").equals("true")) {
                                        message = "Question cannot be added.";
                            %>          <ict:message message="<%=message%>" type="danager"/>
                            <%      } else {
                                        message = "Question added.";
                            %>          <ict:message message="<%=message%>" type="success"/>
                            <%      }
                                }
                            %>
                            <%
                                if (request.getAttribute("updatefailed") != null) {
                                    String message;
                                    if (request.getAttribute("updatefailed").equals("true")) {
                                        message = "Question cannot been updated.";
                            %>          <ict:message message="<%=message%>" type="danager"/>
                            <%      } else {
                                         message = "Quesetion have been updated.";
                            %>          <ict:message message="<%=message%>" type="success"/>
                            <%      }
                                }
                            %>
                            <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Create new question</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form id="question_add" action="question" method="POST">
                                                <input type="hidden" name="action" value="add">
                                                <div class="form-group">
                                                    <label for="module" class="form-control-label">Module:</label>
                                                    <select class="form-control" name="module">
                                                        <option value="0">--Not Selected--</option>
                                                        <%
                                                            Set entrySet = modulelist.entrySet();
                                                            Iterator it = entrySet.iterator();
                                                            while (it.hasNext()) {
                                                                Map.Entry mb = (Map.Entry) it.next();
                                                                out.print("<option value='" + mb.getKey() + "'>" + mb.getValue() + "</option>");
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="type" class="form-control-label">Type:</label>
                                                    <select class="form-control" name="type">
                                                        <option value="selection">selection</option>
                                                        <option value="multichoice">multichoice</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="question" class="form-control-label">Question:</label>
                                                    <input type="text" class="form-control" name="question" maxlength="80">
                                                </div>
                                                <div class="form-group">
                                                    <label for="offeranswer" class="form-control-label">Offered Answer (Separate the answer with ";")</label>
                                                    <input type="text" class="form-control" name="offeranswer" maxlength="80">
                                                </div>
                                                <div class="form-group">
                                                    <label for="correctanswer" class="form-control-label">Correct Answer</label>
                                                    <input type="text" class="form-control" name="correctanswer" maxlength="80">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary" onclick="javascript: document.getElementById('question_add').submit()">Add</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <table id="user" class="table table-striped" style="width:856px">
                                <thead>
                                    <tr>
                                        <th scope="col" style="width:56px">Id</th>
                                        <th scope="col" style="width:100px">Module</th>
                                        <th scope="col" style="width:100px">Type</th>
                                        <th scope="col" style="width:400px">Question</th>
                                        <th scope="col" style="width:100px">Status</th>
                                        <th scope="col" style="width:100px">Edit/Del</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        ArrayList<Question> questionlist = null;
                                        if (request.getAttribute("questions") != null) {
                                            questionlist = (ArrayList<Question>) request.getAttribute("questions");
                                        }
                                    %>
                                    <%if (questionlist.size() == 0) {%>      
                                    <ict:message message="No result found!" type="info"/>
                                    <%}%>
                                    <%
                                        if (request.getAttribute("questions") != null) {
                                            for (int i = 0; i < questionlist.size(); i++) {
                                                String print;
                                                Question qb = questionlist.get(i);
                                                print = "<tr id='" + qb.getId() + "'><th scope='row'>" + qb.getId() + "</th><td>"
                                                        + modulelist.get(qb.getModule()) + "</td><td>"
                                                        + qb.getQuestionType() + "</td><td>"
                                                        + qb.getQuestion() + "</td><td>"
                                                        + qb.getStatus() + "</td><td>"
                                                        + "<a href='question?action=edit&questionId=" + qb.getId() + "'><button type='button' class='btn btn-sm btn-primary'>Edit</button></a>" + " "
                                                        + "<a href='question?action=delete&questionId=" + qb.getId() + "&type=" + qb.getQuestionType() + "'><button type='button' class='btn btn-sm btn-danger'><i class='fa fa-trash' aria-hidden='true'></i></button>";
                                                out.print(print + "</td></tr>");
                                            }
                                        }
                                    %>
                                </tbody>
                            </table>
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
