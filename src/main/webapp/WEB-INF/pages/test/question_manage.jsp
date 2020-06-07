<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Grey
  Date: 04.06.2020
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Вопрос</title>
</head>
<body class="d-flex flex-column text-center">
<jsp:include page="../blocks/top.jsp">
    <jsp:param name="roles" value="${roles}"/>
</jsp:include>
<div class="container m-auto">
    <div class="w-100 text-left">
        <a href="${pageContext.request.contextPath}/courses/${question.test.course.id}/test/${question.test.id}/manage"
           class="btn btn-primary btn-lg ml-0">Назад</a>
    </div>
    <div class="mb-4">
        <h1 class="mb-3 font-weight-normal">"${question.questionName}" - Ответы</h1>
        <div>
            <ul class="list-group">
                <c:forEach var="answer" items="${question.answers}">
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <div>
                            <div class="custom-control custom-checkbox">
                                <input class="custom-control-input" type="checkbox"
                                       <c:if test="${answer.correct}">checked="checked"</c:if>
                                       id="customCheck${answer.id}" value="${answer.correct}">
                                <label class="custom-control-label"
                                       for="customCheck${answer.id}">${answer.name}</label>

                            </div>
                        </div>
                        <div>
                            <a class="fa fa-trash text-decoration-none" style="font-size:24px"
                               href="${pageContext.request.contextPath}/courses/${question.test.course.id}/test/${question.test.id}/question/${question.id}/answer/${answer.id}/delete"></a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <form:form cssClass="d-flex justify-content-center mt-5"
                   action="${pageContext.request.contextPath}/courses/${question.test.course.id}/test/${question.test.id}/question/${question.id}/answer"
                   method="post" modelAttribute="answerModel">
            <div class="col-md-4 mb-3">
                <div class="custom-control custom-control">
                    <label for="validationDefault01">
                        <h3> Новый ответ </h3>
                    </label>
                    <form:input path="name" type="text" class="form-control" id="validationDefault01"
                                placeholder="Ответ" required="required"/>
                </div>
                <div class="custom-control custom-checkbox mt-3">
                    <form:checkbox path="correct" class="custom-control-input" id="custom1"/>
                    <label class="custom-control-label" for="custom1">Правильный ответ</label>
                </div>
                <button class="btn btn-primary mt-3" type="submit">Добавить</button>
            </div>

        </form:form>
    </div>
</div>
<jsp:include page="../blocks/bottom.jsp"/>
</body>
</html>
