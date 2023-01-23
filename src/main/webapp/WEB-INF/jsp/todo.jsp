<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>ToDo</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>

<body>

<div>
    <h2>ToDom</h2>

    <div class="addTodo">
        <button><a href="/todo/add">Add ToDo</a></button>
    </div>




    <div class="panel-body">
        <table class="table table-striped">

            <thead>
            <tr>
                <th width="70%">Описание</th>
                <th width="10%">Срок</th>
                <th width="40%">Действия</th>
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
                           href="/todo/delete?id=${todo.id}">Delete</a>
                        <a type="button" class="btn btn-warning"
                           href="/todo/complete?id=${todo.id}">Completed</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


    <a href="/">Главная</a>
    <a href="/todo/trash">Выполнено</a>

</div>

</body>
</html>