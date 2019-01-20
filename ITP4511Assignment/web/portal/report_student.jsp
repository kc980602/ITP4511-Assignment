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
                            <div class="col-6">
                                <div class="input-group">
                                    <span class="input-group-addon" id="sizing-addon2"><i class="fa fa-search" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" placeholder="Keyword" aria-describedby="sizing-addon2" name="keyword" id="keyword">
                                </div>
                            </div>
                            <table class="table table-striped">
                                <tr>
                                    <th>Quiz Name</th>
                                </tr>
                                <%
                                    ArrayList<Integer> quizList = (ArrayList<Integer>) request.getAttribute("quizList");
                                    ArrayList<Quiz> allQuizList = (ArrayList<Quiz>) request.getAttribute("allQuizList");

                                    if (!quizList.isEmpty()) {
                                        for (Integer sq : quizList) {
                                            for(Quiz quiz : allQuizList){
                                                if(sq == quiz.getId()){
                                                    out.println("<tr>"
                                                            + "<td><a href='report?action=view&id=" + sq + "'>" + quiz.getName() + "</td>" 
                                                            + "</tr>"
                                                    );
                                                }
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
