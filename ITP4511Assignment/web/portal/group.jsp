<%@page import="ict.bean.*, java.util.*, java.util.ArrayList"%>
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
                $('tr[data-href]').on("click", function () {
                    document.location = $(this).data('href');
                });
            })
        </script>
    </head>
    <body>
        <jsp:useBean id="user" scope="request" class="ict.bean.User" />
        <jsp:useBean id="group" scope="request" class="ict.bean.Groups" />
        <jsp:useBean id="grouplist" scope="request" class="java.util.ArrayList<ict.bean.Groups>"/>
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
                        <div class="content-title"><h1>// Group Management //</h1></div>
                        <div class="closed-content">
                            <div class="control row">
                                <div class="col-2">
                                    <button <%= user.getGroup()==2 ? "" : "hidden" %> type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal">
                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#searchModal">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                    </button>
                                </div>
                                <div class="col-8">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination pagination justify-content-center" style="margin-bottom: 0;">
                                            <%
                                                int currPage = 1;
                                                if (request.getParameter("page") != null) {
                                                    currPage = Integer.parseInt(request.getParameter("page"));
                                                }
                                                int maxPage = (int) Math.ceil(
                                                        (((Integer) request.getAttribute("numOfRecord")) / 10.0)
                                                );
                                                
                                                int first, last, pre, next;
                                                String activePre = "", activeNext = "", activeOne = "", activeTwo = "", activeThree = "";
                                                if (currPage <= 1) {
                                                    first = 1;
                                                    last = 3;
                                                    activePre = "disabled";
                                                    activeOne = "active";
                                                } else if (currPage >= maxPage) {
                                                    currPage = maxPage;
                                                    first = currPage - 2;
                                                    last = maxPage;
                                                    activeNext = "disabled";
                                                    activeThree = "active";
                                                } else {
                                                    first = currPage - 1;
                                                    last = currPage + 1;
                                                    activeTwo = "active";
                                                }
                                                if (maxPage <= 1) {
                                                    activePre = "disabled";
                                                    activeNext = "disabled";
                                                    activeOne = "disabled";
                                                    activeTwo = "disabled";
                                                    activeThree = "disabled";
                                                }
                                            %>
                                            <li class="page-item <%=activePre%>">
                                                <a class="page-link" href="group?page=1" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>
                                            <li class="page-item <%=activePre%>">
                                                <a class="page-link" href="group?page=<%=currPage - 1%>" aria-label="Previous">
                                                    <span aria-hidden="true">&lsaquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>
                                            <li class="page-item <%=activeOne%>"><a class="page-link" href="group?page=<%=first%>"><%=first%></a></li>
                                            <li class="page-item <%=activeTwo%>"><a class="page-link" href="group?page=<%=first + 1%>"><%=first + 1%></a></li>
                                            <li class="page-item <%=activeThree%>"><a class="page-link" href="group?page=<%=first + 2%>"><%=last%></a></li>
                                            <li class="page-item <%=activeNext%>">
                                                <a class="page-link" href="group?page=<%=currPage + 1%>" aria-label="Next">
                                                    <span aria-hidden="true">&rsaquo;</span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </li>
                                            <li class="page-item <%=activeNext%>">
                                                <a class="page-link" href="group?page=<%=maxPage%>" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                                <div class="col-2">

                                </div>


                                <div <%= user.getGroup()==2 ? "" : "hidden" %> class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Create new group</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form id="group_add" action="group" method="POST">
                                                    <input type="hidden" name="action" value="add">
                                                    <div class="form-group">
                                                        <label for="name" class="form-control-label">Name:</label>
                                                        <input type="text" class="form-control" name="name" maxlength="80">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="desc">Description:</label>
                                                        <textarea class="form-control" id="exampleFormControlTextarea1" name="desc" rows="4" maxlength="400"></textarea>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <button type="button" class="btn btn-primary" onclick="javascript: document.getElementById('group_add').submit()">Add</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Search groups</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form id="group_search" action="group" method="GET">
                                                    <input type="hidden" name="action" value="search">
                                                    <div class="form-group">
                                                        <label for="id" class="form-control-label">Id:</label>
                                                        <input type="number" class="form-control" name="id" maxlength="11">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="name" class="form-control-label">Name:</label>
                                                        <input type="text" class="form-control" name="name" maxlength="80">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="status" class="form-control-label">Status:</label>
                                                        <select class="form-control" name="status">
                                                            <option value="-1">Select</option>
                                                            <option value="0">In use</option>
                                                            <option value="1">Deleted</option>
                                                        </select>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <button type="button" class="btn btn-primary" onclick="javascript: document.getElementById('group_search').submit()">Search</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                if (request.getParameter("addfailed") != null) {
                                    String name = request.getParameter("name");
                                    String message;
                                    if (request.getParameter("addfailed").equals("true")) {
                                        message = name + " can not been created.";
                            %>          <ict:message message="<%=message%>" type="danager"/>
                            <%      } else {
                                message = name + " have been created.";
                            %>          <ict:message message="<%=message%>" type="success"/>
                            <%      }
                                }
                            %>
                            <%
                                if (request.getParameter("updatefailed") != null) {
                                    String name = request.getParameter("name");
                                    String message;
                                    if (request.getParameter("updatefailed").equals("true")) {
                                        message = name + " can not been updated.";
                            %>          <ict:message message="<%=message%>" type="danager"/>
                            <%      } else {
                                message = name + " have been updated.";
                            %>          <ict:message message="<%=message%>" type="success"/>
                            <%      }
                                }
                            %>

                            <table id="group" class="table table-hover" style="width:856px">
                                <thead>
                                    <tr>
                                        <th scope="col">Id</th>
                                        <th scope="col">Name</th>
                                        <th scope="col" style="width:380px">Description</th>    
                                        <th scope="col" style="width:100px">Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%if (grouplist.size() == 0) {%>      
                                    <ict:message message="No result found!" type="info"/>
                                    <%}%>
                                    <%
                                        for (int i = 0; i < grouplist.size(); i++) {
                                            String print;
                                            Groups gb = grouplist.get(i);
                                            String status = gb.getStatus() == 0 ? "In use" : "Deleted";
                                            print = "<tr id='" + gb.getId() + "' data-href='group?action=detail&groupid=" + gb.getId() +"' ><th scope='row'>" + gb.getId() + "</th><td>"
                                                    + gb.getName() + "</td><td>"
                                                    + gb.getDescription() + "</td><td>"
                                                    + status + "</td>";
                                            out.print(print + "</tr></a>");
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>

            </div>
        </main>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    </body>
</html>
