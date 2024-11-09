<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:root_layout title="Product">
  <jsp:body>
    <!-- breadcrumb-section -->
    <div class="breadcrumb-section breadcrumb-bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 offset-lg-2 text-center">
            <div class="breadcrumb-text">
              <p>See more Details</p>
              <h1>Single Product</h1>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- end breadcrumb section -->

    <%--@elvariable id="product" type="com.example.fruitka.entity.Product"--%>
    <!-- single product -->
    <div class="single-product mt-150 mb-150">
      <div class="container">
        <div class="row">
          <div class="col-md-5">
            <div class="single-product-img">
              <img src="${product.image}" alt="${product.name}">
            </div>
          </div>
          <div class="col-md-7">
            <div class="single-product-content">
              <h3>${product.name}</h3>
              <p class="single-product-pricing"><span>Per Kg</span> $${product.salePrice}</p>
              <c:choose>
                <c:when test="${product.quantity eq 0}">
                  <p class="product-status">Out of Stock</p>
                </c:when>
                <c:otherwise>
                  <p class="product-status">In Stock</p>
                </c:otherwise>
              </c:choose>
              <p>${product.description}</p>
              <div class="single-product-form">
                <div>
                  <label for="quantity" hidden>Quantity:</label>
                  <input type="number" id="quantity" min="1" max="${product.quantity}" value="1">
                </div>
                <c:choose>
                  <c:when test="${sessionScope.user != null}">
                    <a
                        data-product_id="${product.id}"
                        data-action="add"
                        class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                  </c:when>
                  <c:otherwise>
                    <a
                        href="${pageContext.request.contextPath}/login"
                        class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                  </c:otherwise>
                </c:choose>
                <p><strong>Categories: </strong>${product.getCategory().name}</p>
              </div>
              <h4>Share:</h4>
              <ul class="product-share">
                <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
                <li><a href=""><i class="fab fa-twitter"></i></a></li>
                <li><a href=""><i class="fab fa-google-plus-g"></i></a></li>
                <li><a href=""><i class="fab fa-linkedin"></i></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- end single product -->

    <!-- more products -->
    <div class="more-products mb-150">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 offset-lg-2 text-center">
            <div class="section-title">
              <h3><span class="orange-text">Related</span> Products</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid, fuga quas itaque eveniet beatae
                optio.</p>
            </div>
          </div>
        </div>
        <div class="row">
          <%--@elvariable id="products" type="java.util.List"--%>
          <c:forEach items="${products}" var="product">
            <div class="col-lg-4 col-md-6 text-center">
              <div class="single-product-item">
                <div class="product-image">
                  <a href="single-product.html"><img src="${product.image}" alt="${product.name}"></a>
                </div>
                <h3>${product.name}</h3>
                <p class="product-price"><span>Per Kg</span> ${product.salePrice}$ </p>
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
      </div>
    </div>
    <!-- end more products -->

    <!-- logo carousel -->
    <div class="logo-carousel-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="logo-carousel-inner">
              <div class="single-logo-item">
                <img src="${pageContext.request.contextPath}/assets/img/company-logos/1.png" alt="">
              </div>
              <div class="single-logo-item">
                <img src="${pageContext.request.contextPath}/assets/img/company-logos/2.png" alt="">
              </div>
              <div class="single-logo-item">
                <img src="${pageContext.request.contextPath}/assets/img/company-logos/3.png" alt="">
              </div>
              <div class="single-logo-item">
                <img src="${pageContext.request.contextPath}/assets/img/company-logos/4.png" alt="">
              </div>
              <div class="single-logo-item">
                <img src="${pageContext.request.contextPath}/assets/img/company-logos/5.png" alt="">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- end logo carousel -->
  </jsp:body>
</t:root_layout>