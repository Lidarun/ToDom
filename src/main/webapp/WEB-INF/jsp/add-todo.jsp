<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>ToDo</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>

<body>

<header>

</header>

<div class="addTodoForm">
    <%--@elvariable id="todoForm" type="java"--%>
    <form:form method="POST" modelAttribute="todoForm">
        <h2>Add ToDo</h2>
        <form:hidden path="id" />
        <fieldset class="form-addTodo">
            <form:label path="description">Description</form:label>
            <form:input path="description" type="text" class="form-control"
                        required="required" />
            <form:errors path="description" cssClass="text-warning" />
        </fieldset>

        <fieldset class="form-addTodo">
            <form:label path="date">Target Date</form:label>
            <form:input path="date" type="text" class="form-control"
                        required="required" />
            <form:errors path="date" cssClass="text-warning" />
        </fieldset>

        <button type="submit" class="btn btn-success">Save</button>

    </form:form>

        <a href="/todo">Назад</a>
</div>
</body>
</html>