<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Grey
  Date: 04.06.2020
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Задание</title>
</head>
<body class="d-flex flex-column text-center">
<jsp:include page="../blocks/top.jsp">
    <jsp:param name="roles" value="${roles}"/>
</jsp:include>
<div class="container m-auto">
    <div class="w-100 text-left">
        <a href="${pageContext.request.contextPath}/courses/${task.course.id}/plan" class="btn btn-primary btn-lg ml-0">Назад</a>
    </div>
    <form:form action="/lectio/courses/${task.course.id}/task/${task.id}" method="post" class="m-auto"
               modelAttribute="task">
        <div class="controls">
            <h1 class="mb-3 font-weight-normal">Задание</h1>
            <div class="form-group input-group-lg">
                <div class="col form-group input-group-lg d-none">
                    <label for="id">Id</label>
                    <form:input type="text" path="id" class="form-control" placeholder="Имя" id="id"/>
                    <form:input type="number" path="sequenceNumber" class="form-control" placeholder="Имя" id="id"/>
                </div>

                <div class="col form-group input-group-lg">
                    <label for="name">Название</label>
                    <form:input type="text" path="name" class="form-control" placeholder="Название" id="name"
                                required="required" autofocus="autofocus"/>
                </div>

                <div class="col form-group input-group-lg">
                    <label for="email">Описание</label>
                    <form:input type="text" path="description" class="form-control" placeholder="Описание"
                                id="email"/>
                </div>

                <div class="col form-group input-group-lg">
                    <label for="last_name">Текст задания</label>
                    <form:input type="text" path="comment" class="form-control" placeholder="Комментарий к заданию"
                                id="last_name"/>
                </div>
            </div>
            <button class="btn btn-outline-dark btn-lg" type="submit">Подтвердить действие</button>
        </div>
    </form:form>
</div>
<jsp:include page="../blocks/bottom.jsp"/>
</body>
</html>
