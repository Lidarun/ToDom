<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>ToDo</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>
<body>
<div class="panel-body">
    <table class="table table-striped">

<thead>
<tr>
    <th width="40%">Описание</th>
    <th width="40%">Действия</th>
</tr>
</thead>

<tbody>
<c:forEach var="todo" items="${todoListTrash}">
    <tr>
        <td>${todo.description}</td>
        <td><a type="button" class="btn btn-warning"
               href="/todo/delete?id=${todo.id}">Delete</a>
<%--            <a type="button" class="btn btn-warning"--%>
<%--               href="/todo/complete?id=${todo.id}">Not Completed</a>--%>
        </td>
    </tr>
</c:forEach>
</tbody>

    </table>

    <a href="/todo">Назад</a>
    <a href="/">Главная</a>

</div>
</body>
</html>