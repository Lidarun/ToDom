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
<div>
  <sec:authorize access="!isAuthenticated()">
    <h4><a href="/login">Войти</a></h4>
    <h4><a href="/registration">Зарегистрироваться</a></h4>
  </sec:authorize>

  <sec:authorize access="isAuthenticated()" >
    <h3>WELCOME in ToDom, dear ${pageContext.request.userPrincipal.name.toUpperCase()}</h3>

    <sec:authorize access="hasRole('USER')">
      <h4><a href="/todo">ToDo</a></h4>
    </sec:authorize>

    <sec:authorize access="hasRole('ADMIN')">
      <h4><a href="/admin">Пользователи</a></h4>
    </sec:authorize>

    <h4><a href="/logout">Выход</a></h4>

  </sec:authorize>
</div>
</body>
</html>