<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Log in with your account</title>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>

<body>
<header>
  <a href="/" class="logo"><i class=""></i><span>TodomTODO</span></a>
</header>

<div class="admin-panel">
  <table class="table">
    <thead>
    <th width="4%">ID</th>
    <th width="20">UserName</th>
    <th width="46%">Password</th>
    <th width="20%">Roles</th>
    <th width="10%">Action</th>
    </thead>
    <c:forEach items="${allUsers}" var="user">
      <tr>
        <td width="4%">${user.id}</td>
        <td width="20%">${user.username}</td>
        <td width="46%">${user.password}</td>
        <td width="30%">
          <c:forEach items="${user.roles}" var="role">${role.name}; </c:forEach>
        </td>

        <td><a type="button" class="btn btn-warning"
           href="/admin/delete?id=${user.id}">Delete</a></td>

      </tr>
    </c:forEach>
  </table>
</div>
</body>
</html>