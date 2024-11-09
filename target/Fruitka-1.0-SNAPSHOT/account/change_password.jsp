<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:root_layout title="Change Password">
  <jsp:body>
    <t:account_layout>
      <jsp:body>
        <h2>Change Password</h2>
        <p>Use the form below to change your password.</p>
        <%--@elvariable id="error" type="java.lang.String"--%>
        <c:if test="${not empty error}">
          <div class="alert alert-danger" role="alert">${error}</div>
        </c:if>

        <%--@elvariable id="success" type="java.lang.String"--%>
        <c:if test="${not empty success}">
          <div class="alert alert-success" role="alert">${success}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/account/change-password" method="post">
          <div class="form-group">
            <label for="currentPassword">Current Password</label>
            <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
          </div>
          <div class="form-group">
            <label for="newPassword">New Password</label>
            <input type="password" class="form-control" id="newPassword" name="newPassword" required>
          </div>
          <div class="form-group">
            <label for="confirmPassword">Confirm Password</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
          </div>
          <button type="submit" class="btn btn-primary">Update</button>
        </form>
      </jsp:body>
    </t:account_layout>
  </jsp:body>
</t:root_layout>