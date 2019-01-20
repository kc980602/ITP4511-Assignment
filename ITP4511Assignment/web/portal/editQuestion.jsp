<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.ArrayList"%>
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
        <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
        <script>
            $(document).ready(function () {
                $('select#module').val($('#pre_module').val());
                $('select#type').val($('#pre_type').val());
            });
        </script>
    </head>
    <body>
        <jsp:useBean id="user" scope="request" class="ict.bean.User" />
        <jsp:useBean id="modulelist" scope="request" class="java.util.HashMap"/>
        <jsp:include page="./adminTopNav.jsp"/>
        <%
            ArrayList<Question> questions = null;
            Question question = null;
            Question_multichoice answer = null;
            String[] parts = null;

            if (request.getAttribute("question") != null) {
                questions = (ArrayList<Question>) request.getAttribute("question");
                for (int i = 0; i < questions.size(); i++) {
                    question = questions.get(i);
                }
            }
            if (request.getAttribute("answer") != null) {
                answer = (Question_multichoice) request.getAttribute("answer");
                parts = answer.getOfferedAnswer().split(Pattern.quote(";"));
            }
        %>


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
                        <div class="content-title"><h1>// Edit Question //</h1></div>
                        <div class="closed-content">
                            <h3 class="form-group">Question: <%=question.getQuestion()%></h3>
                            <input type="hidden" id="pre_module" value="<%=question.getModule()%>">
                            <input type="hidden" id="pre_type" value="<%=question.getQuestionType()%>">
                            <form id="question_update" action="question" method="POST">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="qid" value="<%=question.getId()%>">
                                <input type="hidden" name="aid" value="<%=answer.getId()%>">
                                <div class="form-group row">
                                    <label for="module" class="col-sm-2 col-form-label">Module:</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="module" name="module" value="<%=question.getModule()%>">
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
                                </div>
                                <div class="form-group row">
                                    <label for="type" class="col-sm-2 col-form-label">Type:</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="type" name="type">
                                            <option value="0">--Not Selected--</option>
                                            <option value="selection">selection</option>
                                            <option value="multichoice">multichoice</option>
                                        </select>
                                    </div>
                                </div>    
                                <div class="form-group row">
                                    <label for="question" class="col-sm-2 col-form-label">Question:</label>
                                    <div class="col-sm-10">
                                        <textarea type="text" class="form-control" name="question" maxlength="80"><%=question.getQuestion()%></textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="question" class="col-sm-2 col-form-label">Offered Answer: (Separate the answer with ";")</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="offeranswer" maxlength="80" value="<%=answer.getOfferedAnswer()%>">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="question" class="col-sm-2 col-form-label">Correct Answer:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="correctanswer" maxlength="80" value="<%=answer.getCorrectAnswer()%>">
                                    </div>
                                </div>
                                <div class="row ">
                                    <div class="col-sm-12 ">
                                        <button type="submit" class="btn btn-primary float-right">Update</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </main>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

    </body>
</html>
