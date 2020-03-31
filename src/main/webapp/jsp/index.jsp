<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Fox Commerce</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
        integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="../css/mdb.min.css" rel="stylesheet">
    <style>
        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }
    </style>
</head>

<body class="fixed-sn " style="background-color: #fff3e0;">

    <!-- Start your project here-->
    <!--Double navigation-->
    <header>
    
        <!-- Navbar -->
        <nav class="navbar fixed-top  navbar-expand-lg scrolling-navbar  orange darken-3">
            <!-- Breadcrumb-->
            <div class="breadcrumb-dn mr-auto">
                <a href="index.html" class="btn btn-light"> <img src="../logo/logo.png"
                        style="max-width: 100px; max-height: 100px;"> </a>
            </div>
            <ul class="nav navbar-nav nav-flex-icons ml-auto">
                <li class="nav-item">
                    <a class="nav-link">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalLogin"><i class="fas fa-user"></i>&nbsp; Login </button> </a>
                </li>
                <li>
					<a>
						<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modalRegister"><i class="fas fa-user-plus"></i>&nbsp; Register </button>
					</a>
                </li>
            </ul>
        </nav>
        <!-- /.Navbar -->
    </header>
    <!--/.Double navigation-->

    <main>

        <!-- Modal -->
        <form action="/userLogin" method="POST">
            <div class="modal fade" id="modalLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">

                    <div class="modal-content">

                        <div class="modal-header text-center">
                            <h4 class="modal-title w-100 font-weight-bold">Log In</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body mx-3">
                            <div class="md-form mb-5">
                                <i class="fas fa-envelope prefix grey-text"></i>
                                <input type="text" id="defaultForm-email" name="username" class="form-control validate" autofocus>
                                <label data-error="wrong" data-success="right" for="defaultForm-email">Username
                                    email</label>
                            </div>

                            <div class="md-form mb-4">
                                <i class="fas fa-lock prefix grey-text"></i>
                                <input type="password" id="defaultForm-pass" name="password" class="form-control validate">
                                <label data-error="wrong" data-success="right" for="defaultForm-pass">Password
                                    </label>
                            </div>

                        </div>
                        <div class="modal-footer d-flex justify-content-center">
                            <button class="btn btn-default" type="submit">Login</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        
        <!-- Modal -->
        <form action="/register" method="POST">
           <div class="modal fade" id="modalRegister" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
			  aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			  
			    <div class="modal-content">
			    
			      <div class="modal-header text-center">
			        <h4 class="modal-title w-100 font-weight-bold">Sign up</h4>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      
			      <div class="modal-body mx-3">
			        <div class="md-form mb-5">
			          <i class="fas fa-user prefix grey-text"></i>
			          <input type="text" id="orangeForm-name" name="username" class="form-control validate">
			          <label data-error="wrong" data-success="right" for="orangeForm-name">Your name</label>
			        </div>
			    
			        <div class="md-form mb-4">
			          <i class="fas fa-lock prefix grey-text"></i>
			          <input type="password" id="orangeForm-pass" name="password" class="form-control validate">
			          <label data-error="wrong" data-success="right" for="orangeForm-pass">Your password</label>
			        </div>
			
			      </div>
			      <div class="modal-footer d-flex justify-content-center">
			        <button type="submit" class="btn btn-deep-orange">Sign up</button>
			      </div>
			    </div>
			  </div>
			</div>

        </form>
        
        
    </main>




    <!-- SCRIPTS -->
    <!-- JQuery -->
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="../js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="../js/mdb.min.js"></script>

    <script>
        $(document).ready(function () {
            // SideNav Button Initialization
            $(".button-collapse").sideNav();
            // SideNav Scrollbar Initialization
            var sideNavScrollbar = document.querySelector('.custom-scrollbar');
            var ps = new PerfectScrollbar(sideNavScrollbar);
        });
    </script>
</body>

</html>