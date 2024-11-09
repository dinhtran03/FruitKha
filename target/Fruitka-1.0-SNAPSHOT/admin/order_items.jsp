<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:admin_layout title="Order Items">
  <jsp:body>
    <%--@elvariable id="error" type="java.lang.String"--%>
    <c:if test="${not empty error}">
      <div class="alert alert-danger">${error}</div>
    </c:if>

    <table class="table table-bordered">
      <tr>
        <th>Id</th>
        <th>Order Id</th>
        <th>Product</th>
        <th>Quantity</th>
        <th>Price</th>
      </tr>
        <%--@elvariable id="orderItems" type="java.util.List<com.example.fruitka.entity.OrderItem>"--%>
      <c:forEach items="${orderItems}" var="orderItem">
        <tr>
          <td>${orderItem.id}</td>
          <td>${orderItem.order.id}</td>
          <td>${orderItem.product.name}</td>
          <td>${orderItem.quantity}</td>
          <td>${orderItem.price}</td>
        </tr>
      </c:forEach>
    </table>
    <a href="${pageContext.request.contextPath}/admin/orders" class="btn btn-primary">Back</a>

  </jsp:body>
</t:admin_layout>