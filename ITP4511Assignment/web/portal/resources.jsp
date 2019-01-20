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
                        <div class="content-title"><h1>// Resources Management //</h1></div>
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
                                    <th>Resource ID</th>
                                    <th>Category</th>
                                    <th>Section</th>
                                    <th>Name</th>
                                    <th>Open Time</th>
                                    <th>Close Time</th>
                                    <th>Action</th>
                                </tr>
                                <%
                                    ArrayList<Resources> resourcelist = (ArrayList<Resources>) request.getAttribute("resourcelist");
                                    if (!resourcelist.isEmpty()) {
                                        for (Resources res : resourcelist) {
                                            out.println("<tr>"
                                                    + "<td>" + res.getId() + "</td>"
                                                    + "<td>" + res.getModule().getName() + "</td>"
                                                    + "<td>" + res.getSection() + "</td>"
                                                    + "<td><a href='resources?action=download&id=" + res.getId() + "'>" + res.getName() + "<a></td>"
                                                    + "<td>" + (res.getTimeopen() != null ? res.getTimeopen() : "No restrict") + "</td>"
                                                    + "<td>" + (res.getTimeclose() != null ? res.getTimeclose() : "No restrict") + "</td>"
                                                    + "<td><button type='button' class='btn btn-sm btn-primary' data-toggle='modal' data-target='#editModal'"
                                                        + " data-id='" + res.getId() + "'"
                                                        + " data-module='" + res.getCategory()+ "'"
                                                        + " data-section='" + res.getSection()+ "'"
                                                        + " data-name='" + res.getName()+ "'"
                                                        + " data-timeopen='" + res.getTimeopen() + "'"
                                                        + " data-timeclose='" + res.getTimeclose() + "'"
                                                        + ">Edit</button> <a href='resources?action=delete&id="+res.getId()+"'><button type='button' class='btn btn-sm btn-danger'><i class='fa fa-trash' aria-hidden='true'></i></button></a></td>"
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
                                            <h5 class="modal-title">Create New Resource</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                        </div>
                                        <form id="addRes" action="resources" method="POST" enctype="multipart/form-data">
                                            <div class="modal-body">
                                                <input type="hidden" name="action" value="create">
                                                <div class="form-group">
                                                    <label for="module" class="form-control-label">Module:</label>
                                                    <select name="module" id="module" class="form-control module" required>
                                                        <option selected disabled>Please choose a module</option>
                                                        <%
                                                            ArrayList<Module> modules = (ArrayList<Module>) request.getAttribute("modulelist");
                                                            if (!modules.isEmpty()) {
                                                                for (Module m : modules) {
                                                                    out.println("<option value='"+m.getId()+"'>"+ m.getCode() + " - " + m.getName() + "</option>");
                                                                }
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="section" class="form-control-label">Category:</label>
                                                    <select name="section" id="category" class="form-control category" required>
                                                        <option selected disabled>Please choose a category</option>
                                                        <option value="0">Default category</option>
                                                    </select>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group col-md-6">
                                                        <label for="name" class="form-control-label">Name:</label>
                                                        <input type="text" class="form-control" name="name" required>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="file" class="form-control-label">File:</label>
                                                        <input type="file" class="form-control" name="file" required>
                                                    </div>
                                                </div>
                                                <div class="custom-control custom-checkbox">
                                                    <input class="form-check-input" type="checkbox" id="timeRestrict">
                                                    <label class="form-check-label" for="timeRestrict">
                                                      Restrict download preiod
                                                    </label>
                                                </div>
                                                <div class="row" style="display: none" id="restrict">
                                                    <div class="form-group col-md-6">
                                                        <label for="startTime" class="form-control-label">Start Time:</label>
                                                        <input type="datetime-local" class="form-control" name="startTime">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="endTime" class="form-control-label">End Time:</label>
                                                        <input type="datetime-local" class="form-control" name="endTime">
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
                                            <h5 class="modal-title">Edit Resource</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                        </div>
                                        <form id="addRes" action="resources" method="POST" enctype="multipart/form-data">
                                            <div class="modal-body">
                                                <input type="hidden" name="id" id="id" value="0>">
                                                <input type="hidden" name="action" value="edit">
                                                <div class="form-group">
                                                    <label for="module" class="form-control-label">Module:</label>
                                                    <select name="module" id="module" class="form-control module" required>
                                                        <option selected disabled>Please choose a module</option>
                                                        <%
                                                            modules = (ArrayList<Module>) request.getAttribute("modulelist");
                                                            if (!modules.isEmpty()) {
                                                                for (Module m : modules) {
                                                                    out.println("<option value='"+m.getId()+"'>"+ m.getCode() + " - " + m.getName() + "</option>");
                                                                }
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="section" class="form-control-label">Category:</label>
                                                    <select name="section" id="category" class="form-control category" required>
                                                        <option selected disabled>Please choose a category</option>
                                                        <option value="0">Default category</option>
                                                    </select>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group col-md-6">
                                                        <label for="name" class="form-control-label">Name:</label>
                                                        <input type="text" class="form-control" name="name" id="name" required>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="file" class="form-control-label">File:</label>
                                                        <input type="file" class="form-control" name="file">
                                                    </div>
                                                </div>
                                                <div class="custom-control custom-checkbox">
                                                    <input class="form-check-input timeRestrict" type="checkbox" id="timeRestrict">
                                                    <label class="form-check-label" for="timeRestrict">
                                                      Restrict download preiod
                                                    </label>
                                                </div>
                                                <div class="row" style="display: none" id="restrict">
                                                    <div class="form-group col-md-6">
                                                        <label for="startTime" class="form-control-label">Start Time:</label>
                                                        <input type="datetime-local" class="form-control" name="startTime" id="timeopen">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="endTime" class="form-control-label">End Time:</label>
                                                        <input type="datetime-local" class="form-control" name="endTime" id="timeclose">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <div class="form-group">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
            var modulesXML = <%
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		XMLEncoder xmlEncoder = new XMLEncoder(baos);
		xmlEncoder.writeObject(modules);
		xmlEncoder.close();

		String xml = baos.toString();
		out.println("'" + xml.replace("\n", "").replace("\r", "") + "'");
            %>
            $('#editModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);
                var id = button.data('id');
                var name = button.data('name');
                var module = button.data('module');
                var section = button.data('section');
                var timeopen = button.data('timeopen');
                var timeclose = button.data('timeclose');
                var modal = $(this)
                modal.find('.modal-body select#category').html('<option selected disabled>Please choose a category</option><option value="0">Default category</option>');
                var modules = $.parseXML(modulesXML);
                var moduleNode = $(modules).find('object[class="ict.bean.Module"]').children('void[property="id"]').children('int:contains(' + module + ')');
                if (moduleNode) {
                    var categoryNode = moduleNode.closest('object').find('object[class="ict.bean.Module_sections"]');
                    for (var i = 0; i < categoryNode.length; i++) {
                        var Cid = $(categoryNode[i]).children('void[property="id"]').text().trim();
                        var Cname = $(categoryNode[i]).children('void[property="name"]').text().trim();
                        modal.find('.modal-body select#category').append('<option value="' + Cid + '">' + Cname + '</option>');
                    }
                }
                modal.find('.modal-body input#id').val(id);
                modal.find('.modal-body input#name').val(name)
                modal.find('.modal-body select#module').val(module)
                modal.find('.modal-body select#category').val(section)
                if (timeopen !== null && timeclose !== null) {
                    modal.find('.modal-body input#timeRestrict').prop('checked', true).closest("form").find('#restrict').show();
                    modal.find('.modal-body input#timeopen').val(timeopen.replace(' ', 'T'))
                    modal.find('.modal-body input#timeclose').val(timeclose.replace(' ', 'T'))
                } else {
                    modal.find('.modal-body input#timeRestrict').prop('checked', false).closest("form").find('#restrict').hide();
                    modal.find('.modal-body input#timeopen').val(timeopen)
                    modal.find('.modal-body input#timeclose').val(timeclose)
                }
            })

            $('#keyword').keypress(function (e) {
                if (e.which === 13) {
                    window.location.href = 'resources?action=search&keyword=' + $(this).val()
                }
            })
            $('.timeRestrict').click(function() {
                if ($(this).is(':checked'))
                    $(this).closest("form").find('#restrict').show();
                else
                    $(this).closest("form").find('#restrict').hide();
            });
            $('.module').change(function() {
                var modules = $.parseXML(modulesXML);
                var moduleNode = $(modules).find('object[class="ict.bean.Module"]').children('void[property="id"]').children('int:contains(' + $(this).val() + ')');
                if (moduleNode) {
                    var categoryNode = moduleNode.closest('object').find('object[class="ict.bean.Module_sections"]');
                    $(this).closest("form").find('.category').html('<option selected disabled>Please choose a category</option><option value="0">Default category</option>');
                    for (var i = 0; i < categoryNode.length; i++) {
                        var Cid = $(categoryNode[i]).children('void[property="id"]').text().trim();
                        var Cname = $(categoryNode[i]).children('void[property="name"]').text().trim();
                        $(this).closest("form").find('.category').append('<option value="' + Cid + '">' + Cname + '</option>');
                    }
                }
            });
        </script>
    </body>
</html>
