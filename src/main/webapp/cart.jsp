<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:root_layout title="Cart">
  <jsp:body>
    <!-- breadcrumb-section -->
    <div class="breadcrumb-section breadcrumb-bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 offset-lg-2 text-center">
            <div class="breadcrumb-text">
              <p>Fresh and Organic</p>
              <h1>Cart</h1>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- end breadcrumb section -->

    <!-- cart -->
    <div class="cart-section mt-150 mb-150">
      <div class="container">

        <div class="row">
          <div class="col-lg-12">
            <h3 class="cart-title mb-4">Shopping Cart</h3>
              <%-- Error --%>
              <%--@elvariable id="error" type="java.lang.String"--%>
            <c:if test="${not empty error}">
              <div class="alert alert-danger" role="alert">
                  ${error}
              </div>
            </c:if>
          </div>
          <div class="col-lg-8 col-md-12">
            <div class="cart-table-wrap">
              <table class="cart-table">
                <thead class="cart-table-head">
                  <tr class="table-head-row">
                    <th class="product-remove"></th>
                    <th class="product-image">Product Image</th>
                    <th class="product-name">Name</th>
                    <th class="product-price">Price</th>
                    <th class="product-quantity">Quantity</th>
                    <th class="product-total">Total</th>
                  </tr>
                </thead>
                <tbody>
                    <%--@elvariable id="cart" type="com.example.fruitka.entity.Cart"--%>
                  <c:forEach items="${cart.cartItems}" var="cartItem">
                    <tr class="table-body-row" id="${cartItem.id}">
                      <td class="product-remove">
                        <a data-id="${cartItem.id}"><i class="far fa-window-close"></i></a>
                      </td>
                      <td class="product-image">
                        <a href="${pageContext.request.contextPath}/shop/${cartItem.product.id}">
                          <img src="${cartItem.product.image}" alt="${cartItem.product.name}">
                        </a>
                      </td>
                      <td class="product-name">${cartItem.product.name}</td>
                      <td class="product-price">$${cartItem.product.salePrice}</td>
                      <td class="product-quantity">
                        <label for="quantity" hidden>Quantity</label>
                        <input type="number" id="quantity" min="1" max="${cartItem.product.quantity}"
                               value="${cartItem.quantity}" data-id="${cartItem.id}"
                               data-stock="${cartItem.product.quantity}"
                               data-price="${cartItem.product.salePrice}" data-quantity="${cartItem.quantity}"></td>
                      <td class="product-total">$${cartItem.product.salePrice * cartItem.quantity}</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>

          <div class="col-lg-4">
            <div class="total-section">
              <table class="total-table">
                <thead class="total-table-head">
                  <tr class="table-total-row">
                    <th>Total</th>
                    <th>Price</th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="total-data">
                    <td><strong>Subtotal: </strong></td>
                    <td class="sub-total">$${cart.subTotal}</td>
                  </tr>
                  <tr class="total-data">
                    <td><strong>Shipping: </strong></td>
                    <td>$45</td>
                  </tr>
                  <tr class="total-data">
                    <td><strong>Total: </strong></td>
                    <td class="total">$${cart.subTotal == 0 ? 0 : cart.subTotal + 45}</td>
                  </tr>
                </tbody>
              </table>
              <div class="cart-buttons">
                  <%--                <a class="boxed-btn">Update Cart</a>--%>
                <a href="${pageContext.request.contextPath}/checkout" class="boxed-btn black">Check Out</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- end cart -->
    <!-- logo carousel -->
    <div class="logo-carousel-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="logo-carousel-inner">
              <div class="single-logo-item">
                <img src="assets/img/company-logos/1.png" alt="">
              </div>
              <div class="single-logo-item">
                <img src="assets/img/company-logos/2.png" alt="">
              </div>
              <div class="single-logo-item">
                <img src="assets/img/company-logos/3.png" alt="">
              </div>
              <div class="single-logo-item">
                <img src="assets/img/company-logos/4.png" alt="">
              </div>
              <div class="single-logo-item">
                <img src="assets/img/company-logos/5.png" alt="">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- end logo carousel -->
  </jsp:body>
</t:root_layout>
