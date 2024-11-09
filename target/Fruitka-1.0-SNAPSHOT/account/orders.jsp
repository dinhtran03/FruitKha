<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<t:root_layout title="Orders">
  <jsp:body>
    <t:account_layout>
      <jsp:body>
        <h2>Orders</h2>


        <%--@elvariable id="error" type="java.lang.String"--%>
        <c:if test="${not empty error}">
          <div class="alert alert-danger">${error}</div>
        </c:if>

        <table class="table table-bordered">
          <tr>
            <th>ID</th>
            <th>Total</th>
            <th>Shipping Address</th>
            <th>Note</th>
            <th>Status</th>
            <th>Date</th>
            <th>Actions</th>
          </tr>
            <%--@elvariable id="orders" type="java.util.List<com.example.fruitka.entity.Order>"--%>
          <c:forEach items="${orders}" var="order">
            <tr>
              <td>${order.id}</td>
              <td>$${order.totalPrice}</td>
              <td>${order.shippingAddress.address}</td>
              <td>${order.note}</td>
              <td>
                <c:choose>
                  <c:when test="${order.status.name().equals('PENDING')}">
                    <span class="badge badge-warning">
                        ${order.status.name()}
                    </span>
                  </c:when>
                  <c:when test="${order.status.name().equals('PROCESSING')}">
                    <span class="badge badge-info">
                        ${order.status.name()}
                    </span>
                  </c:when>
                  <c:when test="${order.status.name().equals('SHIPPING')}">
                    <span class="badge badge-primary">
                        ${order.status.name()}
                    </span>
                  </c:when>
                  <c:when test="${order.status.name().equals('DELIVERED')}">
                    <span class="badge badge-success">
                        ${order.status.name()}
                    </span>
                  </c:when>
                  <c:otherwise>
                    <span class="badge badge-danger">
                        ${order.status.name()}
                    </span>
                  </c:otherwise>
                </c:choose>
              </td>
              <td>
                <fmt:formatDate value="${order.createdAt}" pattern="HH:mm:ss a yyyy-MM-dd"/>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/account/orders/${order.id}"
                   class="btn btn-primary">View</a>
                <c:if test="${order.status.name().equals('PENDING') || order.status.name().equals('PROCESSING')}">
                  <form action="${pageContext.request.contextPath}/account/orders?action=edit&id=${order.id}"
                        class="d-inline-block" method="post">
                    <button type="submit" class="btn btn-danger">Cancel</button>
                  </form>
                </c:if>
              </td>
            </tr>
          </c:forEach>
        </table>
      </jsp:body>
    </t:account_layout>
  </jsp:body>
</t:root_layout>