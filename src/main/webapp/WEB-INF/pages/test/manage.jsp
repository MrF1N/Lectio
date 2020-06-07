<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Тестирование</title>
</head>
<body class="d-flex flex-column text-center">
<jsp:include page="../blocks/top.jsp">
    <jsp:param name="roles" value="${roles}"/>
</jsp:include>
<div class="container m-auto">
    <div class="w-100 text-left">
        <a href="${pageContext.request.contextPath}/courses/${test.course.id}/plan" class="btn btn-primary btn-lg ml-0">Назад</a>
    </div>
    <div class="mb-4">
        <form:form action="/lectio/courses/${test.course.id}/test/${test.id}" method="post" class="m-auto"
                   modelAttribute="test">
            <div class="controls">
                <h1 class="mb-3 font-weight-normal">Тестовое задание</h1>
                <div class="form-group input-group-lg">
                    <div class="form-group input-group-lg d-none">
                        <label for="id">Id</label>
                        <form:input type="text" path="id" class="form-control" placeholder="Имя" id="id"/>
                        <form:input type="number" path="sequenceNumber" class="form-control" placeholder="Имя" id="id"/>
                    </div>

                    <div class="form-group input-group-lg">
                        <label for="name">Название</label>
                        <form:input type="text" path="name" class="form-control" placeholder="Имя" id="name"
                                    required="required" autofocus="autofocus"/>
                    </div>

                    <div class="form-group input-group-lg">
                        <label for="email">Описание</label>
                        <form:input type="email" path="description" class="form-control" placeholder="Описание"
                                    id="email"/>
                    </div>
                </div>
                <button class="btn btn-outline-dark btn-lg" type="submit">Подтвердить действие</button>
            </div>
        </form:form>
    </div>
    <div>
        <h2 class="mb-3 font-weight-normal">Вопросы</h2>
        <ul class="list-group">
            <c:forEach var="question" items="${test.questions}">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <div>
                            ${question.questionName}
                        <span class="badge badge-primary badge-pill">${question.answers.size()}</span>
                    </div>
                    <div>
                        <a class="fa fa-edit text-decoration-none" style="font-size:24px"
                           href="${pageContext.request.contextPath}/courses/${test.course.id}/test/${test.id}/question/${question.id}/manage"></a>
                        <a class="fa fa-trash text-decoration-none" style="font-size:24px"
                           href="${pageContext.request.contextPath}/courses/${test.course.id}/test/${test.id}/question/${question.id}/delete"></a>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div class="mt-4 col-md-10 ml-auto mr-auto">
        <div class="ml-0 mr-0">
            <form:form
                    action="${pageContext.request.contextPath}/courses/${test.course.id}/test/${test.id}/question"
                    method="post" modelAttribute="questionModel">
                <div class="controls">
                    <div class="form-group input-group-lg">
                        <label for="validationDefault01">
                            <h3> Новый вопрос </h3>
                        </label>
                        <form:input path="questionName" type="text" class="form-control" id="validationDefault01"
                                    placeholder="Вопрос" required="required"/>
                    </div>
                    <button class="btn btn-primary mt-3" type="submit">Добавить</button>
                </div>

            </form:form>
        </div>
    </div>
</div>
<jsp:include page="../blocks/bottom.jsp"/>
</body>
</html>
