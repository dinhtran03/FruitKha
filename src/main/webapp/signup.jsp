<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:root_layout title="Sign Up">
  <jsp:body>
    <div class="container py-5">
      <h2>
        Sign Up
      </h2>


        <%--@elvariable id="error" type="java.lang.String"--%>
      <c:if test="${not empty error}">
        <div
            class="alert alert-danger"
            role="alert">
            ${error}
        </div>
      </c:if>

      <form
          method="post"
          action="${pageContext.request.contextPath}/signup">
        <div class="mb-3">
          <label
              for="nameSignup"
              class="form-label">Name</label>
          <input
              type="text"
              class="form-control"
              id="nameSignup"
              name="name">
        </div>
        <div class="mb-3">
          <label
              for="emailSignup"
              class="form-label">Email address</label>
          <input
              type="email"
              class="form-control"
              id="emailSignup"
              name="email">
        </div>
        <div class="mb-3">
          <label
              for="phoneSignup"
              class="form-label">Phone</label>
          <input
              type="text"
              class="form-control"
              id="phoneSignup"
              name="phone">
        </div>
        <div class="mb-3">
          <label
              for="passwordSignup"
              class="form-label">Password</label>
          <input
              type="password"
              class="form-control"
              id="passwordSignup"
              name="password">
        </div>
        <button
            type="submit"
            class="btn btn-primary">Submit
        </button>
      </form>

      <div class="mt-3">
        Already have an account? <a
          href="${pageContext.request.contextPath}/login">Log in now</a>
      </div>

    </div>
  </jsp:body>
</t:root_layout>