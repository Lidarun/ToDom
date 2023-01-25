<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <a href="/todo/add">New ToDo</a>
        <a href="/todo/trash">Completed</a>
    </ul>

    <div class="userbox">
        <sec:authorize access="!isAuthenticated()">
            <a class="user" href="/login"><i class="#"></i>Log in  </a>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <a class="user" href="/logout">Log out  </a>
        </sec:authorize>
        <div class="bx bx-userbox" id="menu-icon"></div>
    </div>
</header>

 <div class="todo-panel">
        <table class="table table-striped">

            <thead>
                <tr>
                    <th width="49%">Description</th>
                    <th width="16%">Date</th>
                    <th width="35%">Action</th>
                </tr>
            </thead>

            <tbody>
            <c:forEach var="todo" items="${todoList}">
                <tr>
                    <td>${todo.description}</td>
                    <td><fmt:formatDate value="${todo.date}"
                                        pattern="dd/MM/yyyy" /></td>
                    <td><a type="button" class="btn btn-success"
                           href="/todo/update?id=${todo.id}">Update</a>
                        <a type="button" class="btn btn-warning"
                           href="/todo/complete?id=${todo.id}">Completed</a>
                        <a type="button" class="btn btn-warning"
                           href="/todo/delete?id=${todo.id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
 </div>

</body>
</html>