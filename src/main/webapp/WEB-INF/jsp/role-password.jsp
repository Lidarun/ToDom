<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <a href="/">Главная</a>
</header>

<div class="form-login">
    <h1>Admin role password</h1>
    <%--@elvariable id="roleForm" type="java"--%>
    <form:form method="POST" modelAttribute="roleForm">

                <div class="input-form">
                    <input name="password" type="password" placeholder="Password"/></div>

<div class="input-form">
    <input type="submit" value="OK"></div>
</form:form>
</div>

</body>
</html>