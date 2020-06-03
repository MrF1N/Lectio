<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Grey
  Date: 05.05.2020
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Управление системой</title>
</head>
<body class="d-flex flex-column text-center">
<jsp:include page="../blocks/top.jsp">
    <jsp:param name="roles" value="${roles}"/>
</jsp:include>
<div class="container m-auto">
    <div>
        <div class="d-flex justify-content-between">
            <h2 class="text-left">Пользователи</h2>
            <a class="btn btn-outline-primary h-auto mt-auto mb-auto"
               href="${pageContext.request.contextPath}/admin/user/0">
                Добавить
            </a>
        </div>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th scope="col">id</th>
                <th scope="col">Имя</th>
                <th scope="col">Фамилия</th>
                <th scope="col">Логин</th>
                <th scope="col">Email</th>
                <th scope="col">Активен</th>
                <th scope="col">Операции</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <th scope="row">${user.id}</th>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>${user.login}</td>
                    <td>${user.email}</td>
                    <td>${user.active}</td>
                    <td class="text-center">
                        <div class="btn-group" role="group">
                            <a class="btn btn-outline-primary my-2 my-sm-0"
                               href="${pageContext.request.contextPath}/admin/user/${user.id}">
                                Измененить
                            </a>
                            <a class="btn btn-outline-primary my-2 my-sm-0"
                               href="${pageContext.request.contextPath}/admin/user/${user.id}/delete">
                                Удалить
                            </a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div>
        <div class="d-flex justify-content-between">
            <h2 class="text-left">Курсы</h2>
            <a class="btn btn-outline-primary h-auto mt-auto mb-auto"
               href="${pageContext.request.contextPath}/auth/registration">
                Добавить
            </a>
        </div>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th scope="col">id</th>
                <th scope="col">Имя</th>
                <th scope="col">Описание</th>
                <th scope="col">Создатель</th>
                <th scope="col">Акивен</th>
                <th scope="col">Операции</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="course" items="${courses}">
                <tr>
                    <th scope="row">${course.id}</th>
                    <td>${course.name}</td>
                    <td>${course.description}</td>
                    <td>${course.creator.login} (${course.creator.id})</td>
                    <td>${course.active}</td>
                    <td class="text-center">
                        <div class="btn-group" role="group">
                            <a class="btn btn-outline-primary my-2 my-sm-0"
                               href="${pageContext.request.contextPath}/auth/registration">
                                Измененить
                            </a>
                            <a class="btn btn-outline-primary my-2 my-sm-0"
                               href="${pageContext.request.contextPath}/auth/registration">
                                Удалить
                            </a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div>
        <div class="d-flex justify-content-between">
            <h2 class="text-left">Лекции</h2>
            <a class="btn btn-outline-primary h-auto mt-auto mb-auto"
               href="${pageContext.request.contextPath}/auth/registration">
                Добавить
            </a>
        </div>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th scope="col">id</th>
                <th scope="col">Имя</th>
                <th scope="col">Порядковый номер</th>
                <th scope="col">Тип</th>
                <th scope="col">Курс</th>
                <th scope="col">URL документа</th>
                <th scope="col">Операции</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="lecture" items="${lectures}">
                <tr style="max-width: 100%">
                    <th scope="row">${lecture.id}</th>
                    <td>${lecture.name}</td>
                    <td>${lecture.sequenceNumber}</td>
                    <td>${lecture.type}</td>
                    <td>${lecture.course.name} (${lecture.course.id})</td>
                    <td class="text-break">${lecture.fileUrl}</td>
                    <td class="text-center">
                        <div class="btn-group" role="group">
                            <a class="btn btn-outline-primary my-2 my-sm-0"
                               href="${pageContext.request.contextPath}/auth/registration">
                                Измененить
                            </a>
                            <a class="btn btn-outline-primary my-2 my-sm-0"
                               href="${pageContext.request.contextPath}/auth/registration">
                                Удалить
                            </a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div>
        <div class="d-flex justify-content-between">
            <h2 class="text-left">Задания</h2>
            <a class="btn btn-outline-primary h-auto mt-auto mb-auto"
               href="${pageContext.request.contextPath}/auth/registration">
                Добавить
            </a>
        </div>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th scope="col">id</th>
                <th scope="col">Имя</th>
                <th scope="col">Порядковый номер</th>
                <th scope="col">Курс</th>
                <th scope="col">Описание</th>
                <th scope="col">Операции</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="task" items="${tasks}">
                <tr>
                    <th scope="row">${task.id}</th>
                    <td>${task.name}</td>
                    <td>${task.sequenceNumber}</td>
                    <td>${task.course.name} (${task.course.id})</td>
                    <td>${task.description}</td>
                    <td class="text-center">
                        <div class="btn-group" role="group">
                            <a class="btn btn-outline-primary my-2 my-sm-0"
                               href="${pageContext.request.contextPath}/auth/registration">
                                Измененить
                            </a>
                            <a class="btn btn-outline-primary my-2 my-sm-0"
                               href="${pageContext.request.contextPath}/auth/registration">
                                Удалить
                            </a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div>
        <div class="d-flex justify-content-between">
            <h2 class="text-left">Тесты</h2>
            <a class="btn btn-outline-primary h-auto mt-auto mb-auto"
               href="${pageContext.request.contextPath}/auth/registration">
                Добавить
            </a>
        </div>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th scope="col">id</th>
                <th scope="col">Имя</th>
                <th scope="col">Порядковый номер</th>
                <th scope="col">Курс</th>
                <th scope="col">Описание</th>
                <th scope="col">Операции</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="test" items="${tests}">
                <tr>
                    <th scope="row">${test.id}</th>
                    <td>${test.name}</td>
                    <td>${test.sequenceNumber}</td>
                    <td>${test.course.name} (${test.course.id})</td>
                    <td>${test.description}</td>
                    <td class="text-center">
                        <div class="btn-group" role="group">
                            <a class="btn btn-outline-primary my-2 my-sm-0"
                               href="${pageContext.request.contextPath}/auth/registration">
                                Измененить
                            </a>
                            <a class="btn btn-outline-primary my-2 my-sm-0"
                               href="${pageContext.request.contextPath}/auth/registration">
                                Удалить
                            </a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div>
        <div class="d-flex justify-content-between">
            <h2 class="text-left">Вопросы</h2>
            <a class="btn btn-outline-primary h-auto mt-auto mb-auto"
               href="${pageContext.request.contextPath}/auth/registration">
                Добавить
            </a>
        </div>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th scope="col">id</th>
                <th scope="col">Имя</th>
                <th scope="col">Порядковый номер</th>
                <th scope="col">Тест</th>
                <th scope="col">Описание</th>
                <th scope="col">Номер правильного ответа</th>
                <th scope="col">Операции</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="question" items="${questions}">
                <tr>
                    <th scope="row">${question.id}</th>
                    <td>${question.name}</td>
                    <td>${question.sequenceNumber}</td>
                    <td>${question.test.name} (${question.test.id})</td>
                    <td>${question.description}</td>
                    <td>${question.correctAnswersNumber}</td>
                    <td class="text-center">
                        <div class="btn-group" role="group">
                            <a class="btn btn-outline-primary my-2 my-sm-0"
                               href="${pageContext.request.contextPath}/auth/registration">
                                Измененить
                            </a>
                            <a class="btn btn-outline-primary my-2 my-sm-0"
                               href="${pageContext.request.contextPath}/auth/registration">
                                Удалить
                            </a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div>
        <div class="d-flex justify-content-between">
            <h2 class="text-left">Ответы</h2>
            <a class="btn btn-outline-primary h-auto mt-auto mb-auto"
               href="${pageContext.request.contextPath}/auth/registration">
                Добавить
            </a>
        </div>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th scope="col">id</th>
                <th scope="col">Имя</th>
                <th scope="col">Вопрос</th>
                <th scope="col">Правильный</th>
                <th scope="col">Операции</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="answer" items="${answers}">
                <tr>
                    <th scope="row">${answer.id}</th>
                    <td>${answer.name}</td>
                    <td>${answer.question.name} (${answer.question.id})</td>
                    <td>${answer.correct}</td>
                    <td class="text-center">
                        <div class="btn-group" role="group">
                            <a class="btn btn-outline-primary my-2 my-sm-0"
                               href="${pageContext.request.contextPath}/auth/registration">
                                Измененить
                            </a>
                            <a class="btn btn-outline-primary my-2 my-sm-0"
                               href="${pageContext.request.contextPath}/auth/registration">
                                Удалить
                            </a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div>
        <div class="d-flex justify-content-between">
            <h2 class="text-left">Сертификаты</h2>
            <a class="btn btn-outline-primary h-auto mt-auto mb-auto"
               href="${pageContext.request.contextPath}/auth/registration">
                Добавить
            </a>
        </div>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th scope="col">id</th>
                <th scope="col">Имя</th>
                <th scope="col">Студент</th>
                <th scope="col">Результат курса</th>
                <th scope="col">Операции</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="certificate" items="${certificates}">
                <tr>
                    <th scope="row">${certificate.id}</th>
                    <td>${certificate.name}</td>
                    <td>${certificate.student.login} (${certificate.student.id})</td>
                    <td>${certificate.courseResult.name} (${certificate.courseResult.id})</td>
                    <td class="text-center">
                        <div class="btn-group" role="group">
                            <a class="btn btn-outline-primary my-2 my-sm-0"
                               href="${pageContext.request.contextPath}/auth/registration">
                                Измененить
                            </a>
                            <a class="btn btn-outline-primary my-2 my-sm-0"
                               href="${pageContext.request.contextPath}/auth/registration">
                                Удалить
                            </a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div>
        <div class="d-flex justify-content-between">
            <h2 class="text-left">Роли пользователей</h2>
            <a class="btn btn-outline-primary h-auto mt-auto mb-auto"
               href="${pageContext.request.contextPath}/auth/registration">
                Добавить
            </a>
        </div>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th scope="col">id Пользователя</th>
                <th scope="col">Роль</th>
                <th scope="col">Операции</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${users}">
                <c:forEach var="role" items="${user.roles}">
                    <tr>
                        <th scope="row">${user.id}</th>
                        <td>${role}</td>
                        <td class="text-center">
                            <div class="btn-group" role="group">
                                <a class="btn btn-outline-primary my-2 my-sm-0"
                                   href="${pageContext.request.contextPath}/auth/registration">
                                    Удалить
                                </a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div>
        <div class="d-flex justify-content-between">
            <h2 class="text-left">Студенты курсов</h2>
            <a class="btn btn-outline-primary h-auto mt-auto mb-auto"
               href="${pageContext.request.contextPath}/auth/registration">
                Добавить
            </a>
        </div>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Id Студента</th>
                <th scope="col">Id Курса</th>
                <th scope="col">Операции</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="course" items="${courses}">
                <c:forEach var="student" items="${course.students}">
                    <tr>
                        <th scope="row">${course.name} (${course.id})</th>
                        <td>${student.login} (${student.id})</td>
                        <td class="text-center">
                            <div class="btn-group" role="group">
                                <a class="btn btn-outline-primary my-2 my-sm-0"
                                   href="${pageContext.request.contextPath}/auth/registration">
                                    Измененить
                                </a>
                                <a class="btn btn-outline-primary my-2 my-sm-0"
                                   href="${pageContext.request.contextPath}/auth/registration">
                                    Удалить
                                </a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div>
        <div class="d-flex justify-content-between">
            <h2 class="text-left">Преподаватели курсов</h2>
            <a class="btn btn-outline-primary h-auto mt-auto mb-auto"
               href="${pageContext.request.contextPath}/auth/registration">
                Добавить
            </a>
        </div>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Id Преподавателя</th>
                <th scope="col">Id Курса</th>
                <th scope="col">Операции</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="course" items="${courses}">
                <c:forEach var="teacher" items="${course.teachers}">
                    <tr>
                        <th scope="row">${course.name} (${course.id})</th>
                        <td>${teacher.login} (${teacher.id})</td>
                        <td class="text-center">
                            <div class="btn-group" role="group">
                                <a class="btn btn-outline-primary my-2 my-sm-0"
                                   href="${pageContext.request.contextPath}/auth/registration">
                                    Измененить
                                </a>
                                <a class="btn btn-outline-primary my-2 my-sm-0"
                                   href="${pageContext.request.contextPath}/auth/registration">
                                    Удалить
                                </a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="../blocks/bottom.jsp"/>
</body>
</html>
