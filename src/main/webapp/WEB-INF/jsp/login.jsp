<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Log in</title>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/styleLogin.css">
</head>

<body>
<header>
  <a href="/" class="logo"><span>TodomTODO</span></a>
</header>

<div class="form-login">
  <form method="POST" action="/login">
    <h1>Login</h1>
    <div class="input-form">
      <input name="username" type="text" placeholder="Username"
             autofocus="true"/></div>

    <div class="input-form">
    <input name="password" type="password" placeholder="Password"/></div>

    <div class="input-form">
      <input type="submit" value="Sign in"></div>

    <h5><a href="/registration">Sign up?</a></h5>
  </form>
</div>

</body>
</html>
