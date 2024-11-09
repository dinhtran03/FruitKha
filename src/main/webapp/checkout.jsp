<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:root_layout title="Checkout">
  <jsp:body>
    <!-- breadcrumb-section -->
    <div class="breadcrumb-section breadcrumb-bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 offset-lg-2 text-center">
            <div class="breadcrumb-text">
              <p>Fresh and Organic</p>
              <h1>Check Out Product</h1>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- end breadcrumb section -->

    <!-- check out section -->
    <div class="checkout-section mt-150 mb-150">
      <div class="container">
        <form class="row" action="${pageContext.request.contextPath}/checkout" method="post">
          <div class="col-lg-12">
              <%--@elvariable id="error" type="java.lang.String"--%>
            <c:if test="${not empty error}">
              <div class="alert alert-danger">${error}</div>
            </c:if>
          </div>
          <div class="col-lg-8">
            <div class="checkout-accordion-wrap">
              <div class="accordion">
                <div class="card single-accordion">
                  <div class="card-header" id="headingOne">
                    <h5 class="mb-0">
                      <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#shippingAddress"
                              aria-expanded="true" aria-controls="shippingAddress">
                        Shipping Address
                      </button>
                    </h5>
                  </div>

                  <div id="shippingAddress" class="collapse show" aria-labelledby="headingOne">
                    <div class="card-body">
                      <div class="billing-address-form">
                        <div class="form-group">
                          <label for="shippingAddressId">
                            Select Shipping Address
                          </label>
                          <select id="shippingAddressId" name="shippingAddressId" class="custom-select">
                              <%--@elvariable id="addresses" type="java.util.List<com.example.fruitka.entity.ShippingAddress>"--%>
                            <c:forEach items="${addresses}" var="address">
                              <option
                                  value="${address.id}"
                                  data-name="${address.name}"
                                  data-phone="${address.phone}"
                                ${address.isDefault ? "seleted" : ""}>
                                  ${address.address}
                              </option>
                            </c:forEach>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="name">Name</label>
                          <input type="text" id="name" placeholder="Name" class="form-control" readonly>
                        </div>
                        <div class="form-group">
                          <label for="phone">Phone</label>
                          <input type="text" id="phone" placeholder="Phone" class="form-control" readonly>
                        </div>
                        <div class="form-group">
                          <label for="address">Address</label>
                          <input type="text" id="address" placeholder="Address" class="form-control" readonly>
                        </div>
                        <div class="form-group">
                          <label for="note">Note</label>
                          <textarea name="note" id="note" cols="30" rows="10" placeholder="Note"
                                    class="form-control"></textarea>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="card single-accordion">
                  <div class="card-header" id="headingPaymentMethod">
                    <h5 class="mb-0">
                      <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#PaymentMethodCollapse" aria-expanded="false" aria-controls="PaymentMethodCollapse">
                        Payment Method
                      </button>
                    </h5>
                  </div>
                  <div id="PaymentMethodCollapse" class="collapse show" aria-labelledby="headingPaymentMethod">
                    <div class="card-body">
                      <div class="card-details">
                        <div class="form-check">
                          <input type="radio" class="form-check-inline" id="paymentMethod" name="paymentMethod" value="Cash" checked >
                          <label for="paymentMethod" class="form-check-label">
                            Cash
                          </label>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>


              </div>

            </div>
          </div>

          <div class="col-lg-4">
            <div class="order-details-wrap">
              <table class="order-details">
                <thead>
                  <tr>
                    <th>Your order Details</th>
                    <th>Price</th>
                  </tr>
                </thead>
                <tbody class="order-details-body">
                  <tr>
                    <td>Product</td>
                    <td>Total</td>
                  </tr>
                    <%--@elvariable id="cart" type="com.example.fruitka.entity.Cart"--%>
                  <c:forEach items="${cart.cartItems}" var="cartItem">
                    <tr>
                      <td>${cartItem.product.name} x ${cartItem.quantity}</td>
                      <td>$${cartItem.product.salePrice * cartItem.quantity}</td>
                    </tr>
                  </c:forEach>
                </tbody>
                <tbody class="checkout-details">
                  <tr>
                    <td>Subtotal</td>
                    <td>$${cart.subTotal}</td>
                  </tr>
                  <tr>
                    <td>Shipping</td>
                    <td>$45</td>
                  </tr>
                  <tr>
                    <td>Total</td>
                    <c:set var="totalPrice" value="${cart.subTotal + 45}"/>
                    <td>$${totalPrice}</td>
                    <input type="number" id="totalPrice" name="totalPrice" value="${totalPrice}" hidden>
                  </tr>
                </tbody>
              </table>
              <button type="submit" class="boxed-btn">Place Order</button>
            </div>
          </div>
        </form>
      </div>
    </div>
    <!-- end check out section -->
  </jsp:body>
</t:root_layout>