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
                        <div class="content-title"><h1>// Module Section Management //</h1></div>
                        <div class="closed-content">
                            <div class="control row">
                                <div class="col-6">
                                    <div class="input-group">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal">
                                            <i class="fa fa-plus" aria-hidden="true"></i>
                                        </button>
                                        <div class="px-2"></div>
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
                                    <th>Module Name</th>
                                    <th>Section Name</th>
                                    <th>Action</th>
                                </tr>
                                <%
                                    Module m = (Module) request.getAttribute("module");
                                    if (!m.getSection().isEmpty()) {
                                        for (Module_sections s : m.getSection()) {
                                            out.println("<tr>"
                                                    + "<td>" + m.getId() + "</td>"
                                                    + "<td>" + m.getName() + "</td>"
                                                    + "<td>" + s.getName() + "</td>"
                                                    + "<td><button type='button' class='btn btn-sm btn-primary' data-toggle='modal' data-target='#editModal'"
                                                    + " data-id='" + s.getId() + "'"
                                                    + " data-name='" + s.getName() + "'"
                                                    + ">Edit</button> "
                                                    + "<a href='module?action=deletesection&id=" + s.getId() + "'><button type='button' class='btn btn-sm btn-danger'><i class='fa fa-trash' aria-hidden='true'></i></button></a></td>"
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
                                            <h5 class="modal-title">Create New Sections</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                        </div>
                                        <form id="addModule" action="module" method="POST">
                                            <div class="modal-body">
                                                <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
                                                <input type="hidden" name="action" value="addsection">
                                                <div class="form-group">
                                                    <label for="name" class="form-control-label">Name:</label>
                                                    <input type="text" class="form-control" name="name" required>
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
                                                <input type="hidden" name="action" value="editsection">
                                                <div class="form-group">
                                                    <label for="name" class="form-control-label">Name:</label>
                                                    <input type="text" id="name" class="form-control" name="name" required>
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
                var modal = $(this);
                modal.find('.modal-body input#id').val(id);
                modal.find('.modal-body input#name').val(name);
            });

            $('#keyword').keypress(function (e) {
                if (e.which === 13) {
                    window.location.href = 'module?action=search&keyword=' + $(this).val();
                }
            });
        </script>
    </body>
</html>
