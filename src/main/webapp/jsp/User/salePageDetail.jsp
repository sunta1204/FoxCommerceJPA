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
        
        .purple-border textarea {
		    border: 1px solid #ff9100;
		}
        
        .purple-border .form-control:focus {
		    border: 1px solid #ff9100;
		    box-shadow: 0 0 0 0.2rem rgba(255, 152, 0, 0.7);
		}
		
		.zoomclass{
			transition: transform .1s;
		}
		.zoomclass:hover{
			transform: scale(1.005);
			
		}
    </style>
</head>

<body class="fixed-sn " style="background-color: #fff3e0;">

    	<!--Navbar -->
		<nav class="mb-1 navbar navbar-expand-lg navbar-dark orange darken-1">
			<div class="container">
				<a class="navbar-brand waves-light waves-effect" href="#"> ${salePageDetail.pageName } </a>
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

    
    <!-- Modal -->
	<form action="/createContent" method="post">
		<div class="modal fade" id="editPage" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		  aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		    <div class="modal-content" style="border-radius: 15px;">
		      <div class="modal-header">
		        <h5 class="modal-title " id="exampleModalLabel">แก้ไขหน้าเพจ</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	<div class="row">
				  <div class="col-sm-5">
				    <div class="list-group z-depth-1-half" id="list-tab" role="tablist">
				      <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#addContent"
				        role="tab" aria-controls="home">เพิ่มบทความ</a>
				      <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#addPicture"
				        role="tab" aria-controls="profile">เพิ่มรูปภาพ</a>
				      <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#addVideo"
				        role="tab" aria-controls="messages">เพิ่มวิดีโอ</a>
				      <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#addContact"
				        role="tab" aria-controls="settings">เพิ่มปุ่มติดต่อสอบถาม</a>
				      <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#addPromo"
				        role="tab" aria-controls="settings">จับเวลาช่วงโปรโมชั่น</a>
				    </div>
				  </div>
				  <div class="col-sm-7">
				    <div class="tab-content" id="nav-tabContent">
				      <div class="tab-pane fade show active" id="addContent" role="tabpanel" aria-labelledby="list-home-list">
				       	<form action="/createContent" method="post">
				       		<div class="form-group purple-border">
							  <label > เพิ่มบทความ </label>
							  <input type="hidden" value="${salePageDetail.pageId }" name="pageId">
							  <textarea class="form-control" rows="3" name="content"></textarea>
							</div>
							<div class="form-group text-right">
								<button type="submit" class="btn btn-primary" style="border-radius: 20px;"> SAVE </button>
							</div>
				       	 </form>
				      </div>
				      <div class="tab-pane fade" id="addPicture" role="tabpanel" aria-labelledby="list-profile-list">
				       	<form action="/uploadFile" class="md-form" method="post" enctype="multipart/form-data">
							<div class="file-field">
							    <div class="btn btn-pink btn-rounded btn-sm float-left">
							      <span><i class="fas fa-upload mr-2" aria-hidden="true"></i>Choose file</span>
							      <input type="hidden" value="${salePageDetail.pageId }" name="pageId">
							      <input type="file" name="file" required="required"> 
							    </div>
							    <div class="file-path-wrapper">
							    	<input class="file-path validate" type="text"  placeholder="อัพโหลดภาพโฆษณา">
							    </div>
							 </div><br>
							 <div class="form-group text-right">
								<button type="submit" class="btn btn-primary" style="border-radius: 20px;"> SAVE </button>
							</div>
						</form>	
				      </div>
				      <div class="tab-pane fade" id="addVideo" role="tabpanel" aria-labelledby="list-messages-list">
				      	<!-- Large input -->
				      	<form action="/addVideo" method="post">
				      		<div class="md-form form-lg">
							  <input type="text" id="inputLGEx" class="form-control" name="videoName">
							  <label for="inputLGEx">เพิ่มวิดีโอ</label>
							</div>
							<div class="form-group text-right">
								<input type="hidden" value="${salePageDetail.pageId }" name="pageId">
								<button type="submit" class="btn btn-primary" style="border-radius: 20px;"> SAVE </button>
							</div>
				      	</form>	
				      </div>
				      <div class="tab-pane fade" id="addContact" role="tabpanel" aria-labelledby="list-settings-list">
				        
				      </div>
				      <div class="tab-pane fade" id="addPromo" role="tabpanel" aria-labelledby="list-settings-list">
				        
				      </div>
				    </div>
				  </div>
				</div>
		      </div>
		      <div class="modal-footer">
		        
		      </div>
		    </div>
		  </div>
		</div>
	</form>
	

    	<div class="container-fluid">
    		<c:if test="${contentDescription == null}">
	    	
	    	</c:if>
			<c:if test="${contentDescription != null}">
				<c:forEach items="${contentDescription}" var="contentDescription">
					<label class="text-primary" style="font-size: 20px;">
						${contentDescription.content}
					</label><br>
				</c:forEach>
			</c:if>
			
			<c:if test="${videoDescription == null}">
	    	
	    	</c:if>
			<c:if test="${videoDescription != null}">
				<c:forEach items="${videoDescription}" var="videoDescription">
					<iframe class=" rounded hoverable zoomclass" class="img-fluid" src="${videoDescription.videoName}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				</c:forEach>
			</c:if><br><br>
			<c:if test="${picture  == null}">
				Not HAVE PICTURE
			</c:if>
			<c:if test="${picture != null }">
				<c:forEach items="${picture }" var="picture">
					<img alt="" src="../../pagepicture/${picture.fileName}.jpg" class="img-fluid rounded hoverable zoomclass">
				</c:forEach><br>
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
        
        $('.file-upload').file_upload();
    </script>
</body>

</html>