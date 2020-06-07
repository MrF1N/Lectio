<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Лекция</title>
</head>
<body class="d-flex flex-column text-center">
<jsp:include page="../blocks/top.jsp">
    <jsp:param name="roles" value="${roles}"/>
</jsp:include>
<div class="container m-auto">
    <div class="w-100 text-left">
        <a href="${pageContext.request.contextPath}/courses/${lecture.course.id}/plan"
           class="btn btn-primary btn-lg ml-0">Назад</a>
    </div>
    <form:form action="/lectio/courses/${lecture.course.id}/lecture/${lecture.id}" method="post" class="m-auto"
               modelAttribute="lecture">
        <div class="controls">
            <h1 class="mb-3 font-weight-normal">Лекция</h1>
            <div class="form-group input-group-lg">
                <div class="col form-group input-group-lg d-none">
                    <label for="id">Id</label>
                    <form:input type="text" path="id" class="form-control" id="id"/>
                    <form:input type="number" path="sequenceNumber" class="form-control" id="sequenceNumber"/>
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
                    <label for="last_name">URL к файлу</label>
                    <form:input type="text" path="fileUrl" class="form-control" placeholder="URL"
                                id="last_name"
                                required="required"/>
                </div>
            </div>
            <button class="btn btn-outline-dark btn-lg" type="submit">Подтвердить действие</button>
        </div>
    </form:form>
</div>
<jsp:include page="../blocks/bottom.jsp"/>
</body>
</html>
