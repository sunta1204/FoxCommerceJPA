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
    <title> ${salePageDetail.pageName } Detail </title>
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

    
    <header>
   
    	<!--Navbar -->
		<nav class="mb-1 navbar navbar-expand-lg navbar-dark orange darken-1">
			<div class="container">
				<a class="navbar-brand" href="#"> ${salePageDetail.pageName } </a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-333"
			    aria-controls="navbarSupportedContent-333" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			  <div class="collapse navbar-collapse" id="navbarSupportedContent-333">
			    <ul class="navbar-nav mr-auto">
			      
			    </ul>
			    <ul class="navbar-nav ml-auto nav-flex-icons">
			      <li class="nav-item dropdown">
			        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333" data-toggle="dropdown"
			          aria-haspopup="true" aria-expanded="false">
			          <i class="fas fa-user"></i>&nbsp;
			          	จัดการระบบ
			        </a>
			        <div class="dropdown-menu  dropdown-default"
			          aria-labelledby="navbarDropdownMenuLink-333">
			          <button type="button" data-toggle="modal" data-target="#editPage" class="dropdown-item">
			          	<i class="fas fa-tools"></i>&nbsp; จัดการหน้าเพจ
			          </button>
			          <button type="button" data-toggle="modal" data-target="#" class="dropdown-item">
			          	<i class="fas fa-tools"></i>&nbsp; สร้างหน้าขอบคุณลูกค้า
			          </button>
			          <button type="button" data-toggle="modal" data-target="#" class="dropdown-item">
			          	<i class="fas fa-tools"></i>&nbsp; จัดการสินค้า
			          </button>
			        </div>
			      </li>
			    </ul>
			  </div> 
			</div>
		</nav>
		<!--Navbar --> 
    </header>

	<!-- Modal -->
	<form action="/createContent" method="post">
		<div class="modal fade" id="editPage" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		  aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">แก้ไขหน้าเพจ</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	<input type="hidden" value=" ${salePageDetail.pageId} " name="pageId">
		        <input type="text" class="form-control" name="content">
		      </div>
		      <div class="modal-footer">
		        <button type="submit" class="btn btn-primary">Save</button>
		      </div>
		    </div>
		  </div>
		</div>
	</form>
	
    <div class="container-fluid" style="margin: 3% 5% 3% 5%;">
    	<c:if test="${contentDescription == null}">
    	
    	</c:if>
		<c:if test="${contentDescription != null}">
			<c:forEach items="${contentDescription}" var="contentDescription">
				<label class="text-primary" style="font-size: 20px;">
					${contentDescription.content}
				</label><br>
			</c:forEach>
		</c:if>
    </div>
    	

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