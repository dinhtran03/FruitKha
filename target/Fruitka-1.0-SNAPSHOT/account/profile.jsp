<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<t:root_layout title="Profile">
  <jsp:body>
    <%--@elvariable id="user" type="com.example.fruitka.entity.User"--%>
    <t:account_layout>
      <jsp:body>
        <h2>Profile</h2>
        Name: ${user.name}<br>
        Email: ${user.email}<br>
        Phone: ${user.phone}<br>
        Role: ${user.role.name()}<br>
        Created At: <fmt:formatDate value="${user.createdAt}" pattern="HH:mm:ss a dd-MM-yyyy"/><br>
      </jsp:body>
    </t:account_layout>
  </jsp:body>
</t:root_layout>