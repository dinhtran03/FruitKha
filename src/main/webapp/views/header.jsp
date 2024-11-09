<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%-- header --%>
<div
    class="top-header-area"
    id="sticker"
    style="position: relative; background-color: #051922; padding: 15px 0;">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-sm-12 text-center">
        <div class="main-menu-wrap">
          <!-- logo -->
          <div class="site-logo">
            <a href="${pageContext.request.contextPath}/"> <img
                src="${pageContext.request.contextPath}/assets/img/logo.png"
                alt="Logo">
            </a>
          </div>
          <!-- logo -->
          <!-- menu start -->
          <nav class="main-menu">
            <ul>
              <li><a href="${pageContext.request.contextPath}/">Home</a></li>
              <li><a href="${pageContext.request.contextPath}/about">About</a></li>
              <li><a href="${pageContext.request.contextPath}/shop">Shop</a>
              </li>
              <li><a href="${pageContext.request.contextPath}/news">News</a>
              </li>
              <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
              <li>
                <div class="header-icons">
                  <a
                      class="shopping-cart"
                      href="${pageContext.request.contextPath}/cart"><i
                      class="fas fa-shopping-cart"></i></a>
                  <a class="mobile-hide search-bar-icon">
                    <i class="fas fa-search"></i>
                  </a>
                  <c:choose>
                    <c:when test="${sessionScope.user != null}">
                      <a class="account-icon" href="${pageContext.request.contextPath}/account">
                        <i class="fas fa-user"></i>
                      </a>
                    </c:when>
                    <c:otherwise>
                      <a class="login-icon" href="${pageContext.request.contextPath}/login">
                        <i class="fas fa-sign-in-alt"></i>
                      </a>
                    </c:otherwise>
                  </c:choose>
                </div>
              </li>
            </ul>
          </nav>
          <a
              class="mobile-show search-bar-icon"
              href="#"><i class="fas fa-search"></i></a>
          <div class="mobile-menu"></div>
          <!-- menu end -->
        </div>
      </div>
    </div>
  </div>
</div>
<%-- end header --%>

<!-- search area -->
<div class="search-area">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <span class="close-btn"><i class="fas fa-window-close"></i></span>
        <div class="search-bar">
          <form action="${pageContext.request.contextPath}/shop" method="get" class="search-bar-tablecell">
            <h3>Search For:</h3>
            <label for="keywords" hidden></label>
            <input
                type="text"
                id="keywords"
                placeholder="Keywords"
                name="search">
            <button type="submit">
              Search <i class="fas fa-search"></i>
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- end search area -->