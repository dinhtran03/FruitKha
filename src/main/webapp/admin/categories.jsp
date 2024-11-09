<%@ page import="java.util.Date" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<t:admin_layout title="Categories">
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
            <h5 class="modal-title">Add Category</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="${pageContext.request.contextPath}/admin/categories?action=add" method="post">
            <div class="modal-body">
              <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name">
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
        <th>Created At</th>
        <th>Actions</th>
      </tr>
        <%--@elvariable id="categories" type="java.util.List<com.example.fruitka.entity.Category>"--%>
      <c:forEach items="${categories}" var="category">
        <tr>
          <td>${category.id}</td>
          <td>${category.name}</td>
          <td>
            <fmt:formatDate value="${category.createdAt}" pattern="HH:mm:ss a dd-MM-yyyy" />
          </td>
          <td>
            <button type="button" data-bs-toggle="modal" data-bs-target="#editModal-${category.id}"
                    class="btn btn-warning">Edit
            </button>

            <div class="modal fade" id="editModal-${category.id}">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title">Edit Category</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <form action="${pageContext.request.contextPath}/admin/categories?action=edit&id=${category.id}"
                        method="post">
                    <div class="modal-body">
                      <div class="mb-3">
                        <label for="nameEdit" class="form-label">Name</label>
                        <input type="text" class="form-control" id="nameEdit" name="name" value="${category.name}">
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

            <form action="${pageContext.request.contextPath}/admin/categories?action=delete&id=${category.id}" method="post"
                  class="d-inline-block">
              <button type="submit" class="btn btn-danger">Delete</button>
            </form>
          </td>
        </tr>
      </c:forEach>
    </table>
  </jsp:body>
</t:admin_layout>