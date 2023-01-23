<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Log in</title>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>

<body>

<sec:authorize access="isAuthenticated()">
  <% response.sendRedirect("/"); %>
</sec:authorize>

<div class="form-form">
  <form method="POST" action="/login">
    <h1>Вход</h1>
    <div class="input-form">
      <input name="username" type="text" placeholder="Username"
             autofocus="true"/></div>

    <div class="input-form">
    <input name="password" type="password" placeholder="Password"/></div>

    <div class="input-form">
      <button type="submit">Войти</button></div>

    <div class="input-form">
    <h4><a href="/registration">Зарегистрироваться</a></h4></div>
  </form>
</div>

</body>
</html>
