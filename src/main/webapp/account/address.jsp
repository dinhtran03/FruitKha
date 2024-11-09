<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:root_layout title="Address">
  <jsp:body>
    <t:account_layout>
      <jsp:body>
        <h2>Shipping Address</h2>

        <%--@elvariable id="error" type="java.lang.String"--%>
        <c:if test="${not empty error}">
          <div class="alert alert-danger">${error}</div>
        </c:if>

        <a class="btn btn-primary mb-4 float-right text-white" data-bs-toggle="modal" data-bs-target="#createModal">
          Add new
        </a>

        <div class="modal fade" id="createModal">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Add Address</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <form action="${pageContext.request.contextPath}/account/address?action=add" method="post">
                <div class="modal-body">
                  <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name">
                  </div>
                  <div class="mb-3">
                    <label for="phone" class="form-label">Phone</label>
                    <input type="text" class="form-control" id="phone" name="phone">
                  </div>
                  <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <textarea class="form-control" id="address" name="address"></textarea>
                  </div>
                  <c:choose>
                    <c:when test="${addresses.size() > 0}">
                      <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="isDefault"
                               name="isDefault">
                        <label class="form-check" for="isDefault">Is Default</label>
                      </div>
                    </c:when>
                    <c:otherwise>
                      <input type="checkbox" name="isDefault" checked hidden>
                    </c:otherwise>
                  </c:choose>



                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                  <button type="submit" class="btn btn-primary">Add</button>
                </div>
              </form>
            </div>
          </div>
        </div>

        <table class="table table-bordered">
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Address</th>
            <th>Is Default</th>
            <th>Actions</th>
          </tr>
            <%--@elvariable id="addresses" type="java.util.List<com.example.fruitka.entity.ShippingAddress>"--%>
          <c:forEach items="${addresses}" var="address">
            <tr>
              <td>${address.id}</td>
              <td>${address.name}</td>
              <td>${address.phone}</td>
              <td>${address.address}</td>
              <td>
                <c:choose>
                  <c:when test="${address.isDefault}">
                    <span class="badge badge-success">Yes</span>
                  </c:when>
                  <c:otherwise>
                    <span class="badge badge-danger">No</span>
                  </c:otherwise>
                </c:choose>
              </td>
              <td>
                <button type="button" class="btn btn-warning" data-bs-toggle="modal"
                        data-bs-target="#editModal-${address.id}">
                  Edit
                </button>

                <div class="modal fade" id="editModal-${address.id}">
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title">Edit Address</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <form action="${pageContext.request.contextPath}/account/address?action=edit&id=${address.id}"
                            method="post">
                        <div class="modal-body">
                          <div class="mb-3">
                            <label for="nameEdit" class="form-label">Name</label>
                            <input type="text" class="form-control" id="nameEdit" name="name" value="${address.name}">
                          </div>
                          <div class="mb-3">
                            <label for="phoneEdit" class="form-label">Phone</label>
                            <input type="text" class="form-control" id="phoneEdit" name="phone"
                                   value="${address.phone}">
                          </div>
                          <div class="mb-3">
                            <label for="addressEdit" class="form-label">Address</label>
                            <textarea class="form-control" id="addressEdit" name="address">${address.address}</textarea>
                          </div>
                          <c:if test="${addresses.size() > 1}">
                            <div class="mb-3 form-check">
                              <input type="checkbox" class="form-check-input" id="isDefaultEdit"
                                     name="isDefault" ${address.isDefault ? "checked" : ""}>
                              <label class="form-check" for="isDefaultEdit">Is Default</label>
                            </div>
                          </c:if>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                          <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>

                <form class="d-inline-block"
                      action="${pageContext.request.contextPath}/account/address?action=delete&id=${address.id}"
                      method="post">
                  <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </tr>
          </c:forEach>
        </table>
      </jsp:body>
    </t:account_layout>
  </jsp:body>
</t:root_layout>