<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<t:admin_layout title="Users">
  <jsp:body>
    <%--@elvariable id="error" type="java.lang.String"--%>
    <c:if test="${not empty error}">
      <div class="alert alert-danger">
          ${error}
      </div>
    </c:if>


    <a class="btn btn-primary mb-4 float-right" data-bs-toggle="modal" data-bs-target="#createModal">
      Add new
    </a>

    <div class="modal fade" id="createModal">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Add User</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="${pageContext.request.contextPath}/admin/users?action=add" method="post">
            <div class="modal-body">
              <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name">
              </div>
              <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email">
              </div>
              <div class="mb-3">
                <label for="phone" class="form-label">Phone</label>
                <input type="text" class="form-control" id="phone" name="phone">
              </div>
              <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password">
              </div>
              <div class="mb-3">
                <label for="role" class="form-label">Role</label>
                <select class="form-select" id="role" name="role">
                  <option value="USER">USER</option>
                  <option value="ADMIN">ADMIN</option>
                </select>
              </div>
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
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Role</th>
        <th>Created At</th>
        <th>
          Actions
        </th>
      </tr>
        <%--@elvariable id="users" type="java.util.List<com.example.fruitka.entity.User>"--%>
      <c:forEach items="${users}" var="user">
        <tr>
          <td>${user.id}</td>
          <td>${user.name}</td>
          <td>${user.email}</td>
          <td>${user.phone}</td>
          <td>${user.role.name()}</td>
          <td>
            <fmt:formatDate value="${user.createdAt}" pattern="HH:mm:ss a dd-MM-yyyy"/>
          </td>
          <td>
            <button type="button" data-bs-toggle="modal" data-bs-target="#editModal-${user.id}" class="btn btn-warning">Edit
            </button>
            <div class="modal fade" id="editModal-${user.id}">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title">Edit User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <form action="${pageContext.request.contextPath}/admin/users?action=edit&id=${user.id}" method="post">
                    <div class="modal-body">
                      <div class="mb-3">
                        <label for="nameEdit" class="form-label">Name</label>
                        <input type="text" class="form-control" id="nameEdit" name="name" value="${user.name}">
                      </div>
                      <div class="mb-3">
                        <label for="emailEdit" class="form-label">Email</label>
                        <input type="email" class="form-control" id="emailEdit" name="email" value="${user.email}">
                      </div>
                      <div class="mb-3">
                        <label for="phoneEdit" class="form-label">Phone</label>
                        <input type="text" class="form-control" id="phoneEdit" name="phone" value="${user.phone}">
                      </div>
                      <div class="mb-3">
                        <label for="passwordEdit" class="form-label">Password</label>
                        <input type="password" class="form-control" id="passwordEdit" name="password">
                      </div>
                      <div class="mb-3">
                        <label for="roleEdit" class="form-label">Role</label>
                        <select class="form-select" id="roleEdit" name="role">
                          <option value="USER" ${user.role.name() == 'USER' ? 'selected' : ''}>USER</option>
                          <option value="ADMIN" ${user.role.name() == 'ADMIN' ? 'selected' : ''}>ADMIN</option>
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
            <form action="${pageContext.request.contextPath}/admin/users?action=delete&id=${user.id}" method="post"
                  class="d-inline-block">
              <button type="submit" class="btn btn-danger">Delete</button>
            </form>
          </td>
        </tr>
      </c:forEach>
    </table>
  </jsp:body>
</t:admin_layout>