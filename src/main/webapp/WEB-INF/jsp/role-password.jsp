<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Role Admin</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/styleLogin.css">
</head>

<body>
<header>
    <a href="/" class="logo"><span>TodomTODO</span></a>
</header>

<div class="form-login">
    <h1>Role password</h1>
    <%--@elvariable id="roleForm" type="java"--%>
    <form:form method="POST" modelAttribute="roleForm">

                <div class="input-form">
                    <input name="password" type="password" placeholder="Password"/></div>

                <div class="form-errors"
                     <form:errors path="password"></form:errors>
                <p>${passwordRoleError}</p></div>

<div class="input-form">
    <input type="submit" value="Confirm"></div>
</form:form>
</div>

</body>
</html>