<%@page import="java.beans.XMLEncoder"%>
<%@page import="java.io.ByteArrayOutputStream"%>
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
                        <div class="content-title"><h1>// Module Management //</h1></div>
                        <div class="closed-content">
                            <div class="control row">
                                <div class="col-6">
                                    <div class="input-group">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal">
                                            <i class="fa fa-plus" aria-hidden="true"></i>
                                        </button>
                                        <div class="px-2"></div>
                                        <span class="input-group-addon" id="sizing-addon2"><i class="fa fa-search" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" placeholder="Keyword" aria-describedby="sizing-addon2" name="keyword" id="keyword" value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
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
                                    <th>Module ID</th>
                                    <th>Code</th>
                                    <th>Name</th>
                                    <th>Action</th>
                                </tr>
                                <%
                                    ArrayList<Module> modules = (ArrayList<Module>) request.getAttribute("modulelist");
                                    if (!modules.isEmpty()) {
                                        for (Module m : modules) {
                                            List<Integer> assigned = new ArrayList();
                                            List<Integer> section = new ArrayList();
                                            for (Module_selection s : m.getAssigned()) {
                                                assigned.add(s.getGroupId());
                                            }
                                            for (Module_sections s : m.getSection()) {
                                                section.add(s.getId());
                                            }
                                            out.println("<tr>"
                                                    + "<td>" + m.getId() + "</td>"
                                                    + "<td>" + m.getCode() + "</td>"
                                                    + "<td><a href='module?id=" + m.getId() + "'>" + m.getName() + "<a></td>"
                                                    + "<td><button type='button' class='btn btn-sm btn-primary' data-toggle='modal' data-target='#editModal'"
                                                    + " data-id='" + m.getId() + "'"
                                                    + " data-code='" + m.getCode() + "'"
                                                    + " data-name='" + m.getName() + "'"
                                                    + " data-assigned='" + assigned + "'"
                                                    + ">Edit</button> "
                                                    + "<a href='module?action=section&id="+m.getId()+"'><button type='button' class='btn btn-sm btn-secondary'>Section</button></a> "
                                                    + "<a href='module?action=delete&id=" + m.getId() + "'><button type='button' class='btn btn-sm btn-danger'><i class='fa fa-trash' aria-hidden='true'></i></button></a></td>"
                                                    + "</tr>"
                                            );
                                        }
                                    } else {
                                        out.println("<tr><td colspan='8' style='text-align: center;'>No record</td></tr>");
                                    }
                                %>
                            </table>
                            <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Create New Module</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                        </div>
                                        <form id="addModule" action="module" method="POST">
                                            <div class="modal-body">
                                                <input type="hidden" name="action" value="create">
                                                <div class="form-group">
                                                    <label for="section" class="form-control-label">Assigned To:</label>
                                                    <select name="group_select" id="group_select" class="form-control" multiple>
                                                        <%
                                                            ArrayList<Groups> groupList = (ArrayList<Groups>) request.getAttribute("groupList");
                                                            if (!groupList.isEmpty()) {
                                                                for (Groups group : groupList) {
                                                                    out.println("<option value=" + group.getId() + ">" + group.getName() + "</option>");
                                                                }
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group col-md-6">
                                                        <label for="code" class="form-control-label">Code:</label>
                                                        <input type="text" class="form-control" name="code" required>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="name" class="form-control-label">Name:</label>
                                                        <input type="text" class="form-control" name="name" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <div class="form-group">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <input type="submit" class="btn btn-primary" value="Create">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Edit Module</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                        </div>
                                        <form id="editModule" action="module" method="POST">
                                            <div class="modal-body">
                                                <input type="hidden" name="id" id="id">
                                                <input type="hidden" name="action" value="edit">
                                                <div class="form-group">
                                                    <label for="section" class="form-control-label">Assigned To:</label>
                                                    <select name="group_select" id="group_select" class="form-control" multiple>
                                                        <%
                                                            groupList = (ArrayList<Groups>) request.getAttribute("groupList");
                                                            if (!groupList.isEmpty()) {
                                                                for (Groups group : groupList) {
                                                                    out.println("<option value=" + group.getId() + ">" + group.getName() + "</option>");
                                                                }
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group col-md-6">
                                                        <label for="code" class="form-control-label">Code:</label>
                                                        <input type="text" class="form-control" name="code" id="code" required>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="name" class="form-control-label">Name:</label>
                                                        <input type="text" class="form-control" name="name" id="name" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <div class="form-group">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                    <input type="submit" class="btn btn-primary" value="Edit">
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

        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
        <script>
            $('#editModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);
                var id = button.data('id');
                var name = button.data('name');
                var code = button.data('code');
                var assigned = button.data('assigned');
                var modal = $(this);
                modal.find('.modal-body input#id').val(id);
                modal.find('.modal-body input#name').val(name);
                modal.find('.modal-body input#code').val(code);
                modal.find('.modal-body select#group_select').val(assigned)
            });

            $('#keyword').keypress(function (e) {
                if (e.which === 13) {
                    window.location.href = 'module?action=search&keyword=' + $(this).val();
                }
            });
        </script>
    </body>
</html>
