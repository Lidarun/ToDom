<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <title>Регистрация</title>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/styleLogin.css">
</head>

<body>
<header>
  <a href="/">Главная</a>
</header>
<div class="form-login">
  <h1>Регистрация</h1>
<%--@elvariable id="userForm" type="java"--%>
  <form:form method="POST" modelAttribute="userForm">

    <div class="input-form">
      <form:input type="text" path="username" placeholder="Username"
                  autofocus="true"></form:input></div>

      <div class="form-errors"
      <form:errors path="username"></form:errors>
        ${usernameError}</div>

    <div class="input-form">
    <form:input type="password" path="password" placeholder="Password"></form:input></div>

    <div class="input-form">
    <form:input type="password" path="passwordConfirm"
                placeholder="Confirm your password"></form:input></div>
    <div class="form-errors"
      <form:errors path="password"></form:errors>
    ${passwordError}</div>

    <div class="input-form">
      <input type="submit" value="Зарегистрироваться "></div>
  </form:form>
</div>

</body>
</html>