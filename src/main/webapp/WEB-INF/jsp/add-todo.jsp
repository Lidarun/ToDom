<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>ToDo</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>

<body>
<header>
    <a href="/" class="logo"><i class=""></i><span>TodomTODO</span></a>
    <ul class="navbar">
        <a href="/todo">ToDo</a>
        <a href="/todo/trash">Completed</a>
    </ul>

    <div class="userbox">
        <sec:authorize access="isAuthenticated()">
            <a class="user" href="/logout">Log out  </a>
        </sec:authorize>
        <div class="bx bx-userbox" id="menu-icon"></div>
    </div>
</header>

<div class="content">
    <%--@elvariable id="todoForm" type="java"--%>
    <form:form method="POST" modelAttribute="todoForm">
        <form:hidden path="id" />
        <fieldset class="form-addTodo">
            <form:label path="description">..Description|</form:label>
            <form:input path="description" type="text" class="form-control"
                        required="required" />
            <form:errors path="description" cssClass="text-warning" />
        </fieldset>

        <fieldset class="form-addTodo">
            <form:label path="date">.........Date|</form:label>
            <form:input path="date" type="text" class="form-date"
                        required="required" />
            <form:errors path="date" cssClass="text-warning" />
        </fieldset>

        <button type="submit" class="btn btn-success">Save</button>

    </form:form>
</div>
<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>