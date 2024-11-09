<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:root_layout title="Order Items">
  <jsp:body>
    <t:account_layout>
      <jsp:body>
        <h2>Order Items</h2>
        <%--@elvariable id="error" type="java.lang.String"--%>
        <c:if test="${not empty error}">
          <span class="alert alert-danger">${error}</span>
        </c:if>

        <table class="table table-bordered">
          <tr>
            <td>ID</td>
            <td>Order Id</td>
            <td>Product</td>
            <td>Quantity</td>
            <td>Price</td>
          </tr>
            <%--@elvariable id="orderItems" type="java.util.List<com.example.fruitka.entity.OrderItem>"--%>
          <c:forEach items="${orderItems}" var="orderItem">
            <tr>
              <td>${orderItem.id}</td>
              <td>${orderItem.order.id}</td>
              <td>
                <div class="d-flex align-items-center">
                  <img src="${orderItem.product.image}" alt="${orderItem.product.name}" width="60" height="60"
                       class="mr-2">
                  <span>${orderItem.product.name}</span>
                </div>
              </td>
              <td>${orderItem.quantity}</td>
              <td>${orderItem.price}</td>
            </tr>
          </c:forEach>
        </table>

        <a href="${pageContext.request.contextPath}/account/orders" class="btn btn-primary">
          Back
        </a>

      </jsp:body>
    </t:account_layout>
  </jsp:body>
</t:root_layout>