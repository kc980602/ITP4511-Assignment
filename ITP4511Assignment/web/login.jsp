<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Happy E-Learning | Index</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="./css/index.css" rel="stylesheet">
        <link href="./css/common.css" rel="stylesheet">
        <link rel="icon" href="./img/favicon.ico">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="he-banner"></div>
        <div class="container">
            <div class="he-login">
                <div class="row">
                    <div class="col-6 login-col login-left-col ">
                        <p align="center">
                            <img src="./img/ico.png"height="120">
                        </p>
                        <h1>Platform guide for students</h1>
                        <p><a href="#">Download platform guide</a></p>
                        <h1>Information</h1>
                        <p>
                            This e-learning site is for the new Academic Year 2017/18.
                            For AY2016/17, please visit e-learning AY1617 site <a href="#">https://e-learning.edu.hk/</a>.
                        </p>
                        <p>
                            <a href="#" class="btn btn-info">
                                <span class="glyphicon glyphicon-print" style="vertical-align: middle;display: inline-flex;">
                                    <i class="material-icons">help</i>
                                </span>
                                <span>Help Desk</span>
                            </a>
                        </p>
                    </div>

                    <div class="col-6 login-col login-right-col">
                        <div class="card loginbox col-12">
                            <div class="he-loginform">
                                <p>&nbsp;</p>
                                <%= request.getParameter("failed") == null ? "<p>&nbsp;</p>" : "<p style='color:#b94a48'><i class='fa fa-exclamation-triangle' style='color:#999999'></i>&nbsp;Invalid login, please try again</span></p>"%>
                                <h1><i class="fa fa-sign-in"></i>&nbsp;Sign in to your course here.</h1>
                                <p class="login-error"></p>
                                <form action="login" method="post">
                                    <input type="hidden" name="action" value="authenticate">
                                    <p>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="material-icons">person</i></span>
                                        <input type="text" class="form-control" placeholder="Username" name="username">
                                    </div>
                                    </p>
                                    <p>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="material-icons">vpn_key</i></span>
                                        <input type="text" class="form-control" placeholder="Password" name="password">
                                    </div>
                                    </p>
                                    <p align="right">
                                        <button class="btn btn-primary" type="submit">Sign in</button>
                                    </p>
                                </form>
                                <div align="right" class="login-forgot-password"><a href="">Forgot your username or password?</a></div>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </main>
    <jsp:include page="footer.jsp"/>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
</body>
</html>
