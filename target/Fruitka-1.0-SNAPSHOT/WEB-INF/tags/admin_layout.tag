<%@tag language="java" pageEncoding="UTF-8" %>
<%@attribute name="title" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=title%>
    </title>
    <!-- favicon -->
    <link
        rel="icon"
        type="image/png"
        href="${pageContext.request.contextPath}/assets/img/favicon.png"/>
    <!-- google font -->
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700"
        rel="stylesheet"/>
    <link
        href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap"
        rel="stylesheet"/>
    <!-- fontawesome -->
    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/assets/css/all.min.css"/>
    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    />
    <!-- owl carousel -->
    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/assets/css/owl.carousel.css"/>
    <!-- magnific popup -->
    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/assets/css/magnific-popup.css"/>
    <!-- animate css -->
    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/assets/css/animate.css"/>
    <!-- mean menu css -->
    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/assets/css/meanmenu.min.css"/>
    <!-- main style -->
    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/assets/css/main.css"/>
    <!-- responsive -->
    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/assets/css/responsive.css"/>

    <%--    adminlte--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/adminlte.min.css"/>
  </head>
  <body>
    <!--PreLoader-->
    <div class="loader">
      <div class="loader-inner">
        <div class="circle"></div>
      </div>
    </div>

    <div class="d-flex h-100 flex-nowrap">
      <div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;">
        <a href="${pageContext.request.contextPath}/admin"
           class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
          <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="Logo" class="mr-2" style="width: 100px;">
          <span class="fs-4">Logo</span>
        </a>
        <hr>
        <ul class="nav nav-pills flex-column mb-auto" id="admin-menu">
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/admin" class="nav-link" aria-current="page">
              <i class="fa fa-home"></i>
              Dashboard
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/admin/users" class="nav-link link-body-emphasis">
              <i class="fa fa-users"></i>
              Users
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/admin/products" class="nav-link link-body-emphasis">
              <i class="fa fa-shopping-cart"></i>
              Products
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/admin/categories" class="nav-link link-body-emphasis">
              <i class="fa fa-th-list"></i>
              Categories
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/admin/orders" class="nav-link link-body-emphasis">
              <i class="fa fa-tasks"></i>
              Orders
            </a>
          </li>
<%--          <li>--%>
<%--            <a href="${pageContext.request.contextPath}/admin/news" class="nav-link link-body-emphasis">--%>
<%--              <i class="fa fa-newspaper"></i>--%>
<%--              News--%>
<%--            </a>--%>
<%--          </li>--%>
        </ul>
        <hr>
        <div class="dropdown">
          <a class="d-flex align-items-center link-body-emphasis text-decoration-none dropdown-toggle"
             role="button"
             data-bs-toggle="dropdown" aria-expanded="false">
            <img src="https://th.bing.com/th/id/OIP.bxsskGp4OT_qyhK7OI4erAHaIi?rs=1&pid=ImgDetMain" alt="avatar" width="32" height="32" class="rounded-circle me-2">
            <strong>${sessionScope.user.name}</strong>
          </a>
          <ul class="dropdown-menu text-small shadow">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/account">Profile</a></li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Sign out</a></li>
          </ul>
        </div>
      </div>
      <div class="w-100 p-3">
        <div class="content-header">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0"><%=title%></h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right float-end">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active"><%=title%></li>
              </ol>
            </div>
          </div>
        </div>
        <jsp:doBody/>
      </div>
    </div>


    <!-- jquery -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery-1.11.3.min.js"></script>
    <!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    ></script>
    <!-- count down -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.countdown.js"></script>
    <!-- isotope -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.isotope-3.0.6.min.js"></script>
    <!-- waypoints -->
    <script src="${pageContext.request.contextPath}/assets/js/waypoints.js"></script>
    <!-- owl carousel -->
    <script src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
    <!-- magnific popup -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.magnific-popup.min.js"></script>
    <!-- mean menu -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.meanmenu.min.js"></script>
    <!-- sticker js -->
    <script src="${pageContext.request.contextPath}/assets/js/sticker.js"></script>
    <!-- main js -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

  </body>
</html>
