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
                $('#editModal').on('show.bs.modal', function (event) {
                    var button = $(event.relatedTarget)
                    var id = button.data('id')
                    var username = button.data('username')
                    var fname = button.data('fname')
                    var lname = button.data('lname')
                    var roles = button.data('roles')
                    var status = button.data('status')
                    var group = button.data('group')
                    var modal = $(this)
                    modal.find('.modal-body input#id').val(id)
                    modal.find('.modal-body input#username').val(username)
                    modal.find('.modal-body input#fname').val(fname)
                    modal.find('.modal-body input#lname').val(lname)
                    modal.find('.modal-body select#roles').val(roles)
                    modal.find('.modal-body select#status').val(status)
                    modal.find('.modal-body select#group').val(group)
                })
            })

            function enableEdit() {
                var str = window.location.href
                var patt = new RegExp('edit')
                var res = patt.test(str)
                if (!res) {
                    str = containExpr(str)
                }
                var target = str.replace("edit=false", "edit=true")
                window.location.replace(target)
            }
            function disableEdit() {
                var str = window.location.href;
                var res = str.replace("edit=true", "edit=false")
                window.location.replace(res)
            }
            function containExpr(inStr) {
                if (inStr.includes("account?")) {
                    inStr += "&edit=false"
                } else {
                    inStr += "?edit=false"
                }
                return inStr
            }
        </script>
    </head>
    <body>
        <jsp:useBean id="user" scope="request" class="ict.bean.User" />
        <jsp:useBean id="userlist" scope="request" class="java.util.ArrayList<ict.bean.User>"/>
        <jsp:useBean id="grouplist" scope="request" class="java.util.ArrayList<ict.bean.Groups>"/>
        <jsp:include page="./adminTopNav.jsp"/>
        <%
            String edit = request.getParameter("edit");
            boolean editEnable = true;
            if (edit == null || edit.equals("false")) {
                editEnable = false;
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
                        <div class="content-title"><h1>// Account Management //</h1></div>
                        <div class="closed-content">
                            <div class="control row">
                                <div class="col-2">
                                    <button <%= user.getGroup() == 2 ? "" : "hidden"%> type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal">
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
                                                <a class="page-link" href="account?page=1" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>
                                            <li class="page-item <%=activePre%>">
                                                <a class="page-link" href="account?page=<%=currPage - 1%>" aria-label="Previous">
                                                    <span aria-hidden="true">&lsaquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>
                                            <li class="page-item <%=activeOne%>"><a class="page-link" href="account?page=<%=first%>"><%=first%></a></li>
                                            <li class="page-item <%=activeTwo%>"><a class="page-link" href="account?page=<%=first + 1%>"><%=first + 1%></a></li>
                                            <li class="page-item <%=activeThree%>"><a class="page-link" href="account?page=<%=first + 2%>"><%=last%></a></li>
                                            <li class="page-item <%=activeNext%>">
                                                <a class="page-link" href="account?page=<%=currPage + 1%>" aria-label="Next">
                                                    <span aria-hidden="true">&rsaquo;</span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </li>
                                            <li class="page-item <%=activeNext%>">
                                                <a class="page-link" href="account?page=<%=maxPage%>" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>

                                <div class="col-2">
                                    <button <%= user.getGroup() == 2 ? "" : "hidden"%> type="button" class="btn <%=editEnable ? "btn-danger" : "btn-warning"%> float-right" onclick="<%=editEnable ? "disableEdit()" : "enableEdit()"%>;">
                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                    </button>
                                </div>
                            </div>

                            <div <%= user.getGroup() == 2 ? "" : "hidden"%> class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Create new user</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form id="account_add" action="account" method="POST">
                                                <input type="hidden" name="action" value="add">
                                                <div class="form-group">
                                                    <label for="username" class="form-control-label">Username:</label>
                                                    <input type="text" class="form-control" name="username" maxlength="80">
                                                </div>
                                                <div class="form-group">
                                                    <label for="fname" class="form-control-label">First Name:</label>
                                                    <input type="text" class="form-control" name="fname" maxlength="80">
                                                </div>
                                                <div class="form-group">
                                                    <label for="lname" class="form-control-label">Last Name:</label>
                                                    <input type="text" class="form-control" name="lname" maxlength="80">
                                                </div>
                                                <div class="form-group">
                                                    <label for="roles" class="form-control-label">Roles:</label>
                                                    <select class="form-control" name="roles">
                                                        <option value="0">Teacher</option>
                                                        <option value="1">Student</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="group" class="form-control-label">User group: </label>
                                                    <select class="form-control" name="group">
                                                        <option value="0">--Not Selected--</option>
                                                        <%
                                                            for (int i = 0; i < grouplist.size(); i++) {
                                                                Groups gb = grouplist.get(i);
                                                                out.print("<option value='" + gb.getId() + "'>" + gb.getName() + "</option>");
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                                <p class="bg-warning">Notes: Password will be same as username in default!</p>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary" onclick="javascript: document.getElementById('account_add').submit()">Add</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Search users</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form id="account_search" action="account" method="GET">
                                                <input type="hidden" name="action" value="search">
                                                <div class="form-group">
                                                    <label for="id" class="form-control-label">Id:</label>
                                                    <input type="number" class="form-control" name="id" maxlength="11">
                                                </div>
                                                <div class="form-group">
                                                    <label for="username" class="form-control-label">Username:</label>
                                                    <input type="text" class="form-control" name="username">
                                                </div>
                                                <div class="form-group">
                                                    <label for="fname" class="form-control-label">First Name:</label>
                                                    <input type="text" class="form-control" name="fname">
                                                </div>
                                                <div class="form-group">
                                                    <label for="lname" class="form-control-label">Last Name:</label>
                                                    <input type="text" class="form-control" name="lname">
                                                </div>
                                                <div class="form-group">
                                                    <label for="roles" class="form-control-label">Roles:</label>
                                                    <select class="form-control" name="roles">
                                                        <option value="-1">Select</option>
                                                        <option value="0">Teacher</option>
                                                        <option value="1">Student</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="status" class="form-control-label">Status:</label>
                                                    <select class="form-control" name="status">
                                                        <option value="-1">Select</option>
                                                        <option value="0">In use</option>
                                                        <option value="1">Deleted</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="group" class="form-control-label">User group: </label>
                                                    <select class="form-control" name="group">
                                                        <option value="0">--Not Selected--</option>
                                                        <%
                                                            for (int i = 0; i < grouplist.size(); i++) {
                                                                Groups gb = grouplist.get(i);
                                                                out.print("<option value='" + gb.getId() + "'>" + gb.getName() + "</option>");
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary" onclick="javascript: document.getElementById('account_search').submit()">Search</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%
                                if (request.getParameter("addfailed") != null) {
                                    String username = request.getParameter("username");
                                    String message;
                                    if (request.getParameter("addfailed").equals("true")) {
                                        message = username + " can not been created.";
                            %>          <ict:message message="<%=message%>" type="danager"/>
                            <%      } else {
                                message = username + " have been created.";
                            %>          <ict:message message="<%=message%>" type="success"/>
                            <%      }
                                }
                            %>
                            <%
                                if (request.getParameter("updatefailed") != null) {
                                    String username = request.getParameter("username");
                                    String message;
                                    if (request.getParameter("updatefailed").equals("true")) {
                                        message = username + " can not been updated.";
                            %>          <ict:message message="<%=message%>" type="danager"/>
                            <%      } else {
                                message = username + " have been updated.";
                            %>          <ict:message message="<%=message%>" type="success"/>
                            <%      }
                                }
                            %>

                            <table id="user" class="table table-striped" style="width:856px">
                                <thead>
                                    <tr>
                                        <th scope="col" style="width:56px">Id</th>
                                        <th scope="col" style="width:200px">First Name</th>
                                        <th scope="col" style="width:200px">Last Name</th>
                                        <th scope="col" style="width:200px">Username</th>
                                        <th scope="col" style="width:100px">Roles</th>
                                        <th scope="col" style="width:100px">Status</th>
                                            <%=editEnable ? "<th scope='col'>Edit</th>" : ""%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%if (userlist.size() == 0) {%>      
                                    <ict:message message="No result found!" type="info"/>
                                    <%}%>
                                    <%
                                        for (int i = 0; i < userlist.size(); i++) {
                                            String print;
                                            User ub = userlist.get(i);
                                            String roles = ub.getRoles() == 0 ? "Teacher" : "Student";
                                            String status = ub.getStatus() == 0 ? "In use" : "Deleted";
                                            print = "<tr id='" + ub.getId() + "'><th scope='row'>" + ub.getId() + "</th><td>"
                                                    + ub.getFirstname() + "</td><td>"
                                                    + ub.getLastname() + "</td><td>"
                                                    + ub.getUsername() + "</td><td>"
                                                    + roles + "</td><td>"
                                                    + status + "</td>";
                                            if (editEnable) {
                                                print += "<td><button type='button' class='btn btn-sm btn-primary' data-toggle='modal' data-target='#editModal'"
                                                        + " data-id='" + ub.getId() + "'"
                                                        + " data-username='" + ub.getUsername() + "'"
                                                        + " data-fname='" + ub.getFirstname() + "'"
                                                        + " data-lname='" + ub.getLastname() + "'"
                                                        + " data-roles='" + ub.getRoles() + "'"
                                                        + " data-status='" + ub.getStatus() + "'"
                                                        + " data-group='" + ub.getGroup() + "'"
                                                        + ">Edit</button></td>";
                                            }
                                            out.print(print + "</tr>");
                                        }
                                    %>
                                </tbody>
                            </table>
                            <div <%= user.getGroup() == 2 ? "" : "hidden"%> class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Edit user</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form id="account_update" action="account" method="POST">
                                                <input type="hidden" name="action" value="update">
                                                <div class="form-group">
                                                    <label for="id" class="form-control-label">Id:</label>
                                                    <input type="number" class="form-control" id="id" name="id" readonly>
                                                </div>
                                                <div class="form-group">
                                                    <label for="username" class="form-control-label">Username:</label>
                                                    <input type="text" class="form-control" id="username" name="username">
                                                </div>
                                                <div class="form-group">
                                                    <label for="fname" class="form-control-label">First Name:</label>
                                                    <input type="text" class="form-control" id="fname" name="fname">
                                                </div>
                                                <div class="form-group">
                                                    <label for="lname" class="form-control-label">Last Name:</label>
                                                    <input type="text" class="form-control" id="lname" name="lname">
                                                </div>
                                                <div class="form-group">
                                                    <label for="roles" class="form-control-label">Roles:</label>
                                                    <select class="form-control" id="roles" name="roles">
                                                        <option value="-1">Select</option>
                                                        <option value="0">Teacher</option>
                                                        <option value="1">Student</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="status" class="form-control-label">Status:</label>
                                                    <select class="form-control" id="status" name="status">
                                                        <option value="-1">Select</option>
                                                        <option value="0">In use</option>
                                                        <option value="1">Deleted</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="group" class="form-control-label">User group: </label>
                                                    <select class="form-control" id="group" name="group">
                                                        <%
                                                            for (int i = 0; i < grouplist.size(); i++) {
                                                                Groups gb = grouplist.get(i);
                                                                out.print("<option value='" + gb.getId() + "'>" + gb.getName() + "</option>");
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <div class="form-check">
                                                        <label class="form-check-label">
                                                            <input class="form-check-input" type="checkbox" name="reset" value="reset"> Rest Password to username
                                                        </label>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary" onclick="javascript: document.getElementById('account_update').submit()">Update</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </main>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    </body>
</html>
