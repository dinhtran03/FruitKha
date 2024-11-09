<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:root_layout title="Login">
  <jsp:body>
    <div class="container py-5">
      <h2>
        Log In
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
          action="${pageContext.request.contextPath}/login">
        <div class="mb-3">
          <label
              for="emailLogin"
              class="form-label">Email address</label>
          <input
              type="email"
              class="form-control"
              id="emailLogin"
              name="email">
        </div>
        <div class="mb-3">
          <label
              for="passwordLogin"
              class="form-label">Password</label>
          <input
              type="password"
              class="form-control"
              id="passwordLogin"
              name="password">
        </div>
        <div class="mb-3 form-check">
          <input
              type="checkbox"
              class="form-check-input"
              id="remember"
              checked
          >
          <label
              class="form-check-label"
              for="remember">Remember me</label>
        </div>

        <button
            type="submit"
            class="btn btn-primary">Submit
        </button>
      </form>

      <div class="mt-3">
        Don't have an account?
        <a href="${pageContext.request.contextPath}/signup">Sign up and get started!</a>
      </div>

    </div>
  </jsp:body>
</t:root_layout>
