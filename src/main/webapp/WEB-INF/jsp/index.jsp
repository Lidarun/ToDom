<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
  <title>Главная</title>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>
<body>
<header>
    <a href="" class="logo"><i class=""></i><span>TodomTODO</span></a>
  <ul class="navbar">
    <sec:authorize access="hasRole('USER')">
        <h4><a href="/todo">ToDo</a></h4>
    </sec:authorize>

    <sec:authorize access="hasRole('ADMIN')">
        <h4><a href="/admin">User's</a></h4>
    </sec:authorize>

      <sec:authorize access="!hasRole('ADMIN') and (isAuthenticated())">
          <h4><a class="userToAdmin" href="/user">Get admin</a></h4>
      </sec:authorize>

      <li><a class="active" href="#">Hello</a></li>
      <li><a class="active" href="#">World</a></li>
  </ul>

    <div class="userbox">
        <sec:authorize access="!isAuthenticated()">
            <a class="user" href="/login"><i class="#"></i>Login  </a>
            <%--    <h4><a href="/registration">Зарегистрироваться</a></h4>--%>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <a class="user" href="/logout">Log out  </a>
        </sec:authorize>
        <div class="bx bx-userbox" id="menu-icon"></div>
    </div>
</header>

<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>