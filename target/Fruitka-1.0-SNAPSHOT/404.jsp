<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:home_layout title="Not Found">
  <jsp:body>
    <!-- breadcrumb-section -->
    <div class="breadcrumb-section breadcrumb-bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 offset-lg-2 text-center">
            <div class="breadcrumb-text">
              <p>Fresh adn Organic</p>
              <h1>404 - Not Found</h1>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- end breadcrumb section -->
    <!-- error section -->
    <div class="full-height-section error-section">
      <div class="full-height-tablecell">
        <div class="container">
          <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
              <div class="error-text">
                <i class="far fa-sad-cry"></i>
                <h1>Oops! Not Found.</h1>
                <p>The page you requested for is not found.</p>
                <a href="${pageContext.request.contextPath}/" class="boxed-btn">Back to Home</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- end error section -->
  </jsp:body>
</t:home_layout>