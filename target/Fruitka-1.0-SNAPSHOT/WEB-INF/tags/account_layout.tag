<%@tag language="java" pageEncoding="UTF-8" %>
<div class="container py-5">
  <div class="row">
    <div class="col-3">
      <div class="list-group" id="account-menu">
        <a class="list-group-item list-group-item-action" href="<%=request.getContextPath()%>/account">Profile</a>
        <a class="list-group-item list-group-item-action" href="<%=request.getContextPath()%>/account/address">Address</a>
        <a class="list-group-item list-group-item-action" href="<%=request.getContextPath()%>/account/orders">Orders</a>
        <a class="list-group-item list-group-item-action" href="<%=request.getContextPath()%>/account/change-password">Change Password</a>
        <a class="list-group-item list-group-item-action" href="<%=request.getContextPath()%>/logout">Log out</a>
      </div>
    </div>
    <div class="col-9">
      <jsp:doBody/>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
></script>