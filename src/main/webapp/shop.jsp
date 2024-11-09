<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:root_layout title="Shop">
  <jsp:body>
    <!-- breadcrumb-section -->
    <div class="breadcrumb-section breadcrumb-bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 offset-lg-2 text-center">
            <div class="breadcrumb-text">
              <p>Fresh and Organic</p>
              <h1>Shop</h1>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- end breadcrumb section -->

    <%-- Error--%>
    <%--@elvariable id="error" type="java.lang.String" --%>
    <c:if test="${not empty error}">
      <div class="alert alert-danger">
          ${error}
      </div>
    </c:if>

    <!-- products -->
    <div class="product-section mt-150 mb-150">
      <div class="container">

        <div class="row">
          <div class="col-md-12">
            <div class="product-filters">
              <ul>
                <li
                    class="${param.categoryId == null ? 'active' : ''}">
                  <a
                      href="${pageContext.request.contextPath}/shop">All</a>
                </li>
                  <%--@elvariable id="categories" type="java.util.List<com.example.fruitka.entity.Category>"--%>
                <c:forEach
                    items="${categories}"
                    var="category">
                  <li
                      class="${category.id eq param.categoryId ? 'active' : ''}">
                    <a
                        href="${pageContext.request.contextPath}/shop?categoryId=${category.id}">
                        ${category.name}
                    </a>
                  </li>
                </c:forEach>
              </ul>
            </div>
          </div>
        </div>

        <div class="row product-lists">
            <%--@elvariable id="products" type="java.util.List<com.example.fruitka.entity.Product>"--%>
          <c:forEach
              items="${products}"
              var="product">
            <div class="col-lg-4 col-md-6 text-center">
              <div class="single-product-item">
                <div class="product-image">
                  <a href="${pageContext.request.contextPath}/shop/${product.id}">
                    <img
                      src="${product.image}"
                      alt="${product.name}"
                    ></a>
                </div>
                <h3>${product.name}</h3>
                <p class="product-price">
                  <span>Per Kg</span> ${product.salePrice}$ </p>
                <c:choose>
                  <c:when test="${product.quantity eq 0}">
                    <p class="product-status">Out of Stock</p>
                  </c:when>
                  <c:otherwise>
                    <p class="product-status">In Stock</p>
                  </c:otherwise>
                </c:choose>

                <c:choose>
                  <c:when test="${sessionScope.user != null}">
                    <a
                        data-product_id="${product.id}"
                        data-quantity="1"
                        data-action="add"
                        class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                  </c:when>
                  <c:otherwise>
                    <a
                        href="${pageContext.request.contextPath}/login"
                        class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                  </c:otherwise>
                </c:choose>
              </div>
            </div>
          </c:forEach>
        </div>

          <%--Pagination--%>

        <div class="row">
          <div class="col-lg-12 text-center">
            <div class="pagination-wrap">
              <ul>
                <c:if test="${not empty param.categoryId}">
                  <c:set var="query" value="&categoryId=${param.categoryId}"/>
                </c:if>
                <c:if test="${not empty param.search}">
                  <c:set var="query" value="${query}&search=${param.search}"/>
                </c:if>
                  <%--@elvariable id="page" type="int"--%>
                <c:if test="${page > 1}">
                  <li><a href="${pageContext.request.contextPath}/shop?page=${page - 1}${query}">Prev</a></li>
                </c:if>
                  <%--@elvariable id="pages" type="int[]"--%>
                <c:forEach items="${pages}" var="pageNo">
                  <li>
                    <a href="${pageContext.request.contextPath}/shop?page=${pageNo}${query}"
                       class="${pageNo eq page ? 'active' : ''}">${pageNo}</a>
                  </li>
                </c:forEach>
                  <%--@elvariable id="totalPage" type="int"--%>
                <c:if test="${page < totalPage}">
                  <li><a href="${pageContext.request.contextPath}/shop?page=${page + 1}${query}">Next</a></li>
                </c:if>
              </ul>
            </div>
          </div>
        </div>


      </div>
    </div>
    <!-- end products -->

    <!-- logo carousel -->
    <div class="logo-carousel-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="logo-carousel-inner">
              <div class="single-logo-item">
                <img
                    src="assets/img/company-logos/1.png"
                    alt="">
              </div>
              <div class="single-logo-item">
                <img
                    src="assets/img/company-logos/2.png"
                    alt="">
              </div>
              <div class="single-logo-item">
                <img
                    src="assets/img/company-logos/3.png"
                    alt="">
              </div>
              <div class="single-logo-item">
                <img
                    src="assets/img/company-logos/4.png"
                    alt="">
              </div>
              <div class="single-logo-item">
                <img
                    src="assets/img/company-logos/5.png"
                    alt="">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- end logo carousel -->


  </jsp:body>
</t:root_layout>