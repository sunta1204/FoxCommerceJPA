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

  <link href="../../css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="../../css/mdb.min.css" rel="stylesheet">
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
    <!-- Sidebar navigation -->
    <div id="slide-out" class="side-nav fixed grey lighten-5">
      <ul class="custom-scrollbar">
        <!-- Logo -->
        <li>
          <div class="logo-wrapper waves-light">
            <p class="text-warning text-center" style="font-size: 20px;">ยินดีต้อนรับ</p>
            <p class="text-warning text-center" style="font-size: 16px;">คุณ  ${userProfile.username} </p>
          </div>
        </li>
        <!--/. Logo -->
        <!--Search Form-->
        <li style="background-color: #ef6c00;">
          <form class="search-form" role="search">
            <div class="form-group md-form mt-0 pt-1 waves-light">
              <input type="text" class="form-control" placeholder="Search">
            </div>
          </form>
        </li>
        <!--/.Search Form-->
        <!-- Side navigation links -->
        <li>
          <ul class="collapsible collapsible-accordion">
            <li class="mb-2">
              <a href="index.htm" class="waves-effect" style="font-size: 18px;">
                <i class="fas fa-plus-square" style="margin-right: 0px;color: #ef6c00;"></i>&nbsp;
                <label style="color: #ef6c00;font-size: 16px;">สร้างเพจขายสินค้า</label>
              </a>
            </li>

            <li class="mb-2">
              <a href="gallery.html" class=" waves-effect" style="font-size: 18px;">
                <i class="fas fa-clipboard-list" style="margin-right: 0px; color: #ef6c00;"></i>&nbsp;
                <label style="color: #ef6c00;font-size: 16px;">ตรวจสอบรายการสั่งซื้อ </label>
              </a>
            </li>

            <li class="mb-2">
              <a href="location.html" class=" waves-effect " style="font-size: 18px;">
                <i class="fas fa-cash-register" style="margin-right: 0px;color: #ef6c00;"></i>&nbsp;
                <label style="color: #ef6c00;font-size: 16px;"> เปลี่ยน/ต่ออายุแพ็คเกจ</label>
              </a>
            </li>

            <hr>

            <li class="mb-2">
              <a class="collapsible-header waves-effect arrow-r" style="font-size: 18px;">
                <i class="fas fa-user-tie" style="margin-right: 0px; color: #ef6c00;"></i>&nbsp;
                <label style="color: #ef6c00;font-size: 16px;"> ข้อมูลส่วนตัว </label>
                <i class="fas fa-angle-down rotate-icon"
                  style="margin-right: 0px;margin-right: 15px; color: #ef6c00;"></i>
              </a>
              <div class="collapsible-body waves-effect waves-light">
                <ul class="list-unstyled">
                  <li>
                    <a href="air_room.html" class="waves-effect" style="font-size: 14px;">
                      <i class="fas fa-user-edit" style="margin-right: 0px;color: #ef6c00;"></i>&nbsp;
                      <label style="color: #ef6c00;font-size: 16px;"> แก้ไขข้อมูลส่วนตัว</label>
                    </a>
                  </li>
                  <li>
                    <a href="fan_room.html" class="waves-effect" style="font-size: 14px;">
                      <i class="fas fa-key" style="margin-right: 0px;color: #ef6c00;"></i>&nbsp;
                      <label style="color: #ef6c00;font-size: 16px;"> เปลี่ยนรหัสผ่าน</label>
                    </a>
                  </li>
                </ul>
              </div>
            </li>

            <hr>

            <li class="mb-2">
              <a href="room_detail.html" class=" waves-effect " style="font-size: 18px;">
                <i class="fas fa-sign-out-alt" style="margin-right: 0px;color: #ef6c00;"></i>&nbsp;
                <label style="color: #ef6c00;font-size: 16px;"> ออกจากระบบ</label>
              </a>
            </li>

          </ul>
        </li>
        <!--/. Side navigation links -->
      </ul>
      <div class="sidenav-bg mask-strong"></div>
    </div>
    <!--/. Sidebar navigation -->

    <!-- Navbar -->
    <nav class="navbar fixed-top navbar-toggleable-md navbar-expand-lg scrolling-navbar double-nav orange darken-3">
      <!-- SideNav slide-out button -->
      <div class="float-left">
        <a href="#" data-activates="slide-out" class="button-collapse"><i class="fas fa-bars"></i></a>
      </div>
      <!-- Breadcrumb-->
      <div class="breadcrumb-dn mr-auto">
        <a href="index.html" class="btn btn-light"> <img src="../../logo/logo.png"
            style="max-width: 100px; max-height: 100px;"> </a>
      </div>
      <!--<ul class="nav navbar-nav nav-flex-icons ml-auto">
            <li class="nav-item">
              <a class="nav-link"><i class="fas fa-cash-register"></i>&nbsp; <span class="clearfix d-none d-sm-inline-block">Book Room</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link"><i class="fas fa-user"></i>&nbsp; <span class="clearfix d-none d-sm-inline-block">Account</span></a>
            </li>    
        </ul> -->
    </nav>
    <!-- /.Navbar -->
  </header>
  <!--/.Double navigation-->

  <main>
    <div class="container-fluid" style="margin-top: 3%;">
      <div class="table-responsive">
        <table class="table table-hover text-center">
          <thead class="black white-text">
            <tr>
              <th scope="col">รหัสเพจขายสินค้า</th>
              <th scope="col">ชื่อเพจ</th>
              <th scope="col">สถานะของเพจ</th>
              <th scope="col"></th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${salePageList}" var="salePageList">
              <tr>
                <td>
                  ${salePageList.pageId}
                </td>
                <td>
                  <a target="_blank" href="/salePage/${salePageList.pageId}"> ${salePageList.pageName} </a>
                </td>
                <td>
                  <c:if test="${salePageList.status=='1'}">
                    กำลังใช้งาน
                  </c:if>
                  <c:if test="${salePageList.status=='2'}">
                    ปิดการใช้งาน
                  </c:if>
                </td>
                <td class="text-center">
                  <button class="btn btn-warning">แก้ไขชื่อเพจ</button> &nbsp; | &nbsp;
                  <button class="btn btn-danger">ลบเพจ</button>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </main>




  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="../../js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="../../js/mdb.min.js"></script>

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