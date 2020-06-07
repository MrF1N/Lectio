<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<spring:url value="/courses/${task.course.id}/task/${task.id}/answer" var="taskUrl"/>
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
    <form:form action="${taskUrl}" method="post" class="m-auto" modelAttribute="taskResult">
        <div class="mb-4">
            <h1>Задание "${task.name}"</h1>
            <span>${task.description}</span>
            <div>
                <form:hidden path="id"/>
            </div>

        </div>

        <div class="mb-3">
            <label class="float-left" for="validationTextarea">Ответ на задание</label>
            <form:input type="textarea" path="comment" class="form-control" placeholder="Введите текст ответа"
                        id="validationTextarea" autofocus="autofocus"/>
        </div>

        <div class="input-group mb-3">
            <form:input type="file" path="files" class="form-control-file" id="inputFile" multiple="multiple"/>
            <label for="inputFile">Выберите файл</label>
        </div>

        <button class="btn btn-outline-dark btn-lg" type="submit">Отправить ответ</button>
    </form:form>

</div>
<jsp:include page="../blocks/bottom.jsp"/>
</body>
</html>
