<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<t:admin_layout title="Orders">
  <jsp:body>
    <%--@elvariable id="error" type="java.lang.String"--%>
    <c:if test="${not empty error}">
      <div class="alert alert-danger">
          ${error}
      </div>
    </c:if>


    <table class="table table-bordered">
      <tr>
        <th>Id</th>
        <th>Payment Method</th>
        <th>Total Price</th>
        <th>Status</th>
        <th>Customer</th>
        <th>Shipping Address</th>
        <th>Note</th>
        <th>Created At</th>
        <th>Actions</th>
      </tr>
        <%--@elvariable id="orders" type="java.util.List<com.example.fruitka.entity.Order>"--%>
      <c:forEach items="${orders}" var="order">
        <tr>
          <td>${order.id}</td>
          <td>${order.paymentMethod}</td>
          <td>$${order.totalPrice}</td>
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
          <td>${order.customer.name}</td>
          <td>${order.shippingAddress.address}</td>
          <td>${order.note}</td>
          <td>
            <fmt:formatDate value="${order.createdAt}" pattern="HH:mm:ss a dd-MM-yyyy"/>
          </td>
          <td>
            <a href="${pageContext.request.contextPath}/admin/orders/${order.id}"
               class="btn btn-primary">
              View
            </a>

            <button type="button" data-bs-toggle="modal" data-bs-target="#editModal-${order.id}"
                    class="btn btn-warning">Edit
            </button>

            <div class="modal fade" id="editModal-${order.id}">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title">Edit Order</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <form action="${pageContext.request.contextPath}/admin/orders?action=edit&id=${order.id}"
                        method="post">
                    <div class="modal-body">
                      <div class="mb-3">
                        <label for="paymentMethod" class="form-label">Payment Method</label>
                        <input type="text" class="form-control" id="paymentMethod" value="${order.paymentMethod}"
                               readonly>
                      </div>
                      <div class="mb-3">
                        <label for="totalPrice" class="form-label">Total Price</label>
                        <input type="text" class="form-control" id="totalPrice" value="${order.totalPrice}" readonly>
                      </div>
                      <div class="mb-3">
                        <label for="customer" class="form-label">Customer</label>
                        <input type="text" id="customer" class="form-control" value="${order.customer.name}" readonly>
                      </div>
                      <div class="mb-3">
                        <label for="shippingAddress" class="form-label">Shipping Address</label>
                        <input type="text" id="shippingAddress" class="form-control"
                               value="${order.shippingAddress.address}" readonly>
                      </div>
                      <div class="mb-3">
                        <label for="status" class="form-label">Status</label>
                        <select class="form-select" id="status" name="status">
                          <option value="PENDING" ${order.status.name() == 'PENDING' ? 'selected' : ''}>PENDING</option>
                          <option value="PROCESSING" ${order.status.name() == 'PROCESSING' ? 'selected' : ''}>
                            PROCESSING
                          </option>
                          <option value="SHIPPING" ${order.status.name() == 'SHIPPING' ? 'selected' : ''}>SHIPPING
                          </option>
                          <option value="DELIVERED" ${order.status.name() == 'DELIVERED' ? 'selected' : ''}>DELIVERED
                          </option>
                          <option value="CANCELLED" ${order.status.name() == 'CANCELLED' ? 'selected' : ''}>CANCELLED
                          </option>
                        </select>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                      <button type="submit" class="btn btn-primary">Edit</button>
                    </div>
                  </form>

                </div>
              </div>
            </div>

              <%--            <form action="${pageContext.request.contextPath}/admin/orders?action=delete&id=${order.id}" method="post"--%>
              <%--                  class="d-inline-block">--%>
              <%--              <button type="submit" class="btn btn-danger">Delete</button>--%>
              <%--            </form>--%>
          </td>
        </tr>
      </c:forEach>
    </table>


  </jsp:body>
</t:admin_layout>