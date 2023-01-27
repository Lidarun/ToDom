<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>TodomToDo</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
    <link rel="stylesheet" href="https://kit.fontawesome.com/31bc700251.css" crossorigin="anonymous">
</head>
<body>
<header>
    <a href="/" class="logo"><i class=""></i><span>TodomTODO</span></a>
    <ul class="navbar">
        <a href="/todo">ToDo</a>
        <a href="/todo/add">New ToDo</a>
    </ul>

    <div class="userbox">
        <sec:authorize access="isAuthenticated()">
            <a class="user" href="/logout">Log out  </a>
        </sec:authorize>
        <a class="bx bx-userbox" id="menu-icon"></a>
    </div>
</header>


<div class="todo-panel">
    <table class="table table-striped">

    <thead>
        <tr>
            <th width="40%">Description</th>
            <th width="5%">Completed</th>
            <th width="15%">Action</th>
        </tr>
    </thead>

        <tbody>
        <c:forEach var="todo" items="${todoListTrash}">
            <tr>
                <td>${todo.description}</td>
                <td><fmt:formatDate value="${todo.date}"
                            pattern="dd/MM/yyyy" /></td>
                <td><a type="button" class="btn btn-success"
                    href="/todo/delete?id=${todo.id}">Delete</a>
                <a type="button" class="btn btn-warning"
                    href="/todo/cancelComplete?id=${todo.id}">Not Completed</a></td>
            </tr>
        </c:forEach>
        </tbody>

    </table>
</div>

<a class="trash" href="/todo/deleteAll">Delete All</a>
</body>
</html>