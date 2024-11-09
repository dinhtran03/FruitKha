<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<t:admin_layout title="Products">
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
            <h5 class="modal-title">Add Product</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="${pageContext.request.contextPath}/admin/products?action=add" method="post">
            <div class="modal-body">
              <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name">
              </div>
              <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="number" class="form-control" id="price" name="price" min="1" style="width: 100%">
              </div>
              <div class="mb-3">
                <label for="salePrice" class="form-label">Sale Price</label>
                <input type="number" class="form-control" id="salePrice" name="salePrice" min="1"
                       style="width: 100%">
              </div>
              <div class="mb-3">
                <label for="quantity" class="form-label">Quantity</label>
                <input type="number" class="form-control" id="quantity" name="quantity" min="1"
                       style="width: 100%">
              </div>
              <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea type="text" class="form-control" id="description" name="description" rows="3"></textarea>
              </div>
              <div class="mb-3">
                <label for="image" class="form-label">Image</label>
                <input type="text" class="form-control" id="image" name="image">
              </div>
              <div class="mb-3">
                <label for="category" class="form-label">Category</label>
                <select class="form-select" id="category" name="categoryId">
                    <%--@elvariable id="categories" type="java.util.List<com.example.fruitka.entity.Category>"--%>
                  <c:forEach items="${categories}" var="category">
                    <option value="${category.id}">${category.name}</option>
                  </c:forEach>
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
        <th>Slug</th>
        <th>Price</th>
        <th>Sale Price</th>
        <th>Quantity</th>
        <th>Image</th>
        <th>Description</th>
        <th>Category</th>
        <th>Created At</th>
        <th>
          Actions
        </th>
      </tr>
        <%--@elvariable id="products" type="java.util.List<com.example.fruitka.entity.Product>"--%>
      <c:forEach items="${products}" var="product">
        <tr>
          <td>${product.id}</td>
          <td>${product.name}</td>
          <td>${product.slug}</td>
          <td>${product.price}</td>
          <td>${product.salePrice}</td>
          <td>${product.quantity}</td>
          <td>
            <div class="w-100 d-flex justify-content-center">
              <img width="60" height="60" src="${product.image}" alt="${product.name}" style="object-fit: cover">
            </div>
          </td>
          <td class="text-truncate" style="max-width: 400px">

              ${product.description}
          </td>
          <td>${product.category.name}</td>
          <td>
            <fmt:formatDate value="${product.createdAt}" pattern="HH:mm:ss a dd-MM-yyyy"/>
          </td>
          <td>
            <button type="button" data-bs-toggle="modal" data-bs-target="#editModal-${product.id}"
                    class="btn btn-warning">Edit
            </button>
            <div class="modal fade" id="editModal-${product.id}">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title">Edit Product</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <form action="${pageContext.request.contextPath}/admin/products?action=edit&id=${product.id}" method="post">
                    <div class="modal-body">
                      <div class="mb-3">
                        <label for="nameEdit" class="form-label">Name</label>
                        <input type="text" class="form-control" id="nameEdit" name="name" value="${product.name}">
                      </div>
                      <div class="mb-3">
                        <label for="priceEdit" class="form-label">Price</label>
                        <input type="number" class="form-control" id="priceEdit" name="price" min="1"
                               value="${product.price}" style="width: 100%">
                      </div>
                      <div class="mb-3">
                        <label for="salePriceEdit" class="form-label">Sale Price</label>
                        <input type="number" class="form-control" id="salePriceEdit" name="salePrice" min="1"
                               value="${product.salePrice}" style="width: 100%">
                      </div>
                      <div class="mb-3">
                        <label for="quantityEdit" class="form-label">Quantity</label>
                        <input type="number" class="form-control" id="quantityEdit" name="quantity" min="1"
                               max="${product.quantity}" value="${product.quantity}" style="width: 100%">
                      </div>
                      <div class="mb-3">
                        <label for="descriptionEdit" class="form-label">Description</label>
                        <textarea type="text" class="form-control" id="descriptionEdit"
                                  name="description" rows="3">${product.description}</textarea>
                      </div>
                      <div class="mb-3">
                        <label for="imageEdit" class="form-label">Image</label>
                        <input type="text" class="form-control" id="imageEdit" name="image" value="${product.image}">
                      </div>
                      <div class="mb-3">
                        <label for="categoryEdit" class="form-label">Category</label>
                        <select class="form-select" id="categoryEdit" name="categoryId">
                            <%--@elvariable id="categories" type="java.util.List<com.example.fruitka.entity.Category>"--%>
                          <c:forEach items="${categories}" var="category">
                            <option
                                value="${category.id}" ${product.category.id == category.id ? "selected" : ""}>${category.name}</option>
                          </c:forEach>
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
            <form action="${pageContext.request.contextPath}/admin/products?action=delete&id=${product.id}" method="post"
                  class="d-inline-block">
              <button type="submit" class="btn btn-danger">Delete</button>
            </form>
          </td>
        </tr>
      </c:forEach>
    </table>
  </jsp:body>
</t:admin_layout>