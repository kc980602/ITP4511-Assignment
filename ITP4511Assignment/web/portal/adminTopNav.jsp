<jsp:useBean id="user" scope="request" class="ict.bean.User" />
<div class="navbar navbar-light navbar-expand sticky-top p-0">
    <div class="container">
        <a href="main" class="navbar-brand"><img src="./img/ico.png" height="56"></a>
        <div class="navbar-collapse collapse flex-row-reverse">
            <a href="main" class="navbar-brand"><img src="./img/logo.png" height="40"></a>
        </div>
    </div>
</div>
<nav class="navbar navbar-custom navbar-expand-lg sticky-top" id="topmenu" style="top:66px">
    <div class="container">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="main">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link nav-link-last" href="#">Admin</a>
            </li>
        </ul>
        <ul class="navbar-nav float-right">
            <li class="nav-item">
                <form id= "form_logout" action="login" method="post">
                    <input type="hidden" name="action" value="logout">
                    <a class="nav-link nav-link-last" href="javascript: document.getElementById('form_logout').submit()">Sign out</a>
                </form>
            </li>
        </ul>
    </div>
</nav>
