<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${course.name}</title>
</head>
<body class="d-flex flex-column text-center">
<jsp:include page="../blocks/top.jsp">
    <jsp:param name="roles" value="${roles}"/>
</jsp:include>
<div class="mt-lg-4">
    <div class="container">
        <div class="d-flex flex-column">
            <div class="d-inline-flex w-100">
                <div class="circle course big">
                        <span>
                            ${fn:substring(course.name, 0, 1)}
                        </span>
                </div>
                <div class="align-middle m-auto">
                    <h2 class="m-auto ml-lg-4">${course.name}</h2>
                </div>
            </div>
            <c:if test="${fn:contains(roles, 'CREATOR')}">
                <div class="d-flex mt-auto mb-auto ml-auto">
                    <div class="mt-auto mb-auto">
                        <c:choose>
                            <c:when test="${course.active}">
                                        <span class="mr-4 green">
                                            Активен
                                        </span>
                            </c:when>
                            <c:otherwise>
                                        <span class="mr-4 red">
                                            Не активен
                                        </span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="mt-auto mb-auto">
                        <a class=" btn btn-outline-warning float-right" href="#">Изменить данные</a>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</div>
<div class="container m-auto">
    <c:choose>
        <c:when test="${course_page == 'plan'}">
            <div class="row">
                <div class="col align-middle mt-auto mb-auto">
                    <ul class="list-group text-decoration-none">
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/courses/${course.id}">О
                            курсе</a></li>
                        <li class="list-group-item"><a class="active_course_tab">План учёбы</a></li>
                    </ul>
                </div>
                <div class="col-8">
                    <c:if test="${fn:contains(course.students, user)}">
                        <div class="d-flex flex-column">
                            <div class="mt-4">
                                <h3>Лекции</h3>
                                <div class="ml-0">
                                    <table class="table table-borderless">
                                        <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Название</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="lecture" items="${course.lectures}">
                                            <tr>
                                                <th scope="row">${lecture.sequenceNumber}</th>
                                                <td><a class="btn-link"
                                                       href="${pageContext.request.contextPath}/courses/${course.id}/lecture/${lecture.id}">${lecture.name}</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                            <div class="mt-4">
                                <h3>Практические задание</h3>
                                <div class="ml-0">
                                    <table class="table table-borderless">
                                        <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Название</th>
                                            <th scope="col"></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="task" items="${course.tasks}">
                                            <tr>
                                                <th scope="row">${task.sequenceNumber}</th>
                                                <td><a class="btn-link"
                                                       href="${pageContext.request.contextPath}/courses/${course.id}/task/${task.id}">${task.name}</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="mt-4">
                                <h3>Проверка знаний</h3>
                                <div class="ml-0">
                                    <table class="table table-borderless">
                                        <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Название</th>
                                            <c:if test="${course.isTestResultsExists(user.id)}">
                                                <th scope="col">Результат</th>
                                            </c:if>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="test" items="${course.tests}">
                                            <tr>
                                                <th scope="row">${test.sequenceNumber}</th>
                                                <c:choose>
                                                    <c:when test="${test.isExistsResultByStudentId(user.id)}">
                                                        <td>
                                                            <span>${test.name}</span>
                                                        </td>
                                                        <td>
                                                            <span>${test.getRatingByStudentId(user.id)}</span>
                                                        </td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>
                                                            <a class="btn-link"
                                                               href="${pageContext.request.contextPath}/courses/${course.id}/task/${test.id}">${test.name}</a>
                                                        </td>
                                                    </c:otherwise>
                                                </c:choose>

                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${fn:contains(course.teachers, user)}">
                        <div class="d-flex flex-column">
                            <div class="mt-4">
                                <h3>Проверка практических заданий</h3>
                                <div class="ml-0">
                                    <table class="table table-bordered">
                                        <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Текстовый ответ</th>
                                            <th scope="col">Файлы ответа</th>
                                            <th scope="col">Отметка</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="task_result" items="${task_results}">
                                            <spring:url value="/files" var="files"/>
                                            <spring:url
                                                    value="/courses/${task_result.task.course.id}/task/${task_result.task.id}/answer"
                                                    var="taskUrl"/>
                                            <tr>
                                                <th scope="row">${task_result.id}</th>
                                                <td scope="row">${task_result.comment}</td>
                                                <td scope="row align-items-center">
                                                    <ul class="mb-0 list-group">
                                                        <c:forEach var="file" items="${task_result.filePaths}">
                                                            <li class="list-inline">
                                                                <a href="${files}/user_${task_result.student.id}/task_${task_result.task.id}/${file}">${file}</a>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>

                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${task_result.rating == null}">
                                                            <form:form class="form-inline"
                                                                       action="${pageContext.request.contextPath}/courses/${course.id}/taskResult/${task_result.id}/teacher/${user.id}/rate"
                                                                       method="post">
                                                                <div class="form-group mb-2">
                                                                    <label for="rating"
                                                                           class="sr-only">Отметка</label>
                                                                    <input name="rating" type="number"
                                                                           class="form-control" min="1" max="10"
                                                                           id="rating"/>
                                                                </div>
                                                                <button type="submit" class="btn btn-primary mb-2">
                                                                    Оценить
                                                                </button>
                                                            </form:form>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="font-weight-bold">${task_result.rating}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${course.creator.id == user.id}">
                        <div class="d-flex flex-column">
                            <div class="mt-4">
                                <h2>Редактирование курса</h2>
                                <div class="mb-0 d-flex justify-content-between">
                                    <h3 class="text-left">Лекции</h3>
                                    <a class="btn btn-outline-primary h-auto mt-auto mb-auto"
                                       href="${pageContext.request.contextPath}/auth/registration">
                                        Добавить
                                    </a>
                                </div>
                                <div class="ml-0">
                                    <table class="table table-bordered">
                                        <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Название</th>
                                            <th scope="col">Операции</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="lecture" items="${course.lectures}">
                                            <tr>
                                                <th scope="row">${lecture.sequenceNumber}</th>
                                                <td class="col-1">
                                                    <a class="btn-link"
                                                       href="${pageContext.request.contextPath}/courses/${course.id}/lecture/${lecture.id}">${lecture.name}
                                                    </a>
                                                </td>
                                                <td class="text-right">
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
                            </div>
                            <div class="mt-4">
                                <div class="mb-0 d-flex justify-content-between">
                                    <h3 class="text-left">Практические задания</h3>
                                    <a class="btn btn-outline-primary h-auto mt-auto mb-auto"
                                       href="${pageContext.request.contextPath}/auth/registration">
                                        Добавить
                                    </a>
                                </div>
                                <div class="ml-0">
                                    <table class="table table-bordered">
                                        <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Название</th>
                                            <th scope="col">Операции</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="task" items="${course.tasks}">
                                            <tr>
                                                <th scope="row">${task.sequenceNumber}</th>
                                                <td class="col-1">
                                                    <a class="btn-link"
                                                       href="${pageContext.request.contextPath}/courses/${course.id}/task/${task.id}">${task.name}
                                                    </a>
                                                </td>
                                                <td class="text-right">
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
                            </div>
                            <div class="mt-4">
                                <div class="mb-0 d-flex justify-content-between">
                                    <h3 class="text-left">Проверка знаний</h3>
                                    <a class="btn btn-outline-primary h-auto mt-auto mb-auto"
                                       href="${pageContext.request.contextPath}/auth/registration">
                                        Добавить
                                    </a>
                                </div>
                                <div class="ml-0">
                                    <table class="table table-bordered">
                                        <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Название</th>
                                            <th scope="col">Операции</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="test" items="${course.tests}">
                                            <tr>
                                                <th scope="row">${test.sequenceNumber}</th>
                                                <td class="col-1">
                                                    <span>${test.name}</span>
                                                </td>
                                                <td class="text-right">
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
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="row">
                <div class="col align-middle mt-auto mb-auto">
                    <ul class="list-group text-decoration-none">
                        <li class="list-group-item"><a class="text-decoration-none active_course_tab">О курсе</a></li>
                        <li class="list-group-item"><a
                                href="${pageContext.request.contextPath}/courses/${course.id}/plan">План
                            учёбы</a>
                        </li>
                    </ul>
                </div>
                <div class="col-8">
                    <div class="course_info">
                        <h3>О курсе</h3>
                        <span>${course.description}</span>
                    </div>
                    <div class="d-flex flex-column">
                        <div class="mt-4">
                            <h3>Создатель</h3>
                            <div class="ml-0 float-left">
                                <jsp:include page="../user/small_user.jsp">
                                    <jsp:param name="userId" value="${course.creator.id}"/>
                                    <jsp:param name="userFirstName" value="${course.creator.firstName}"/>
                                    <jsp:param name="userLastName" value="${course.creator.lastName}"/>
                                </jsp:include>
                            </div>
                        </div>
                        <div class="mt-4">
                            <h3>Преподаватели</h3>
                            <div class="ml-0 float-left">
                                <c:forEach var="teacher" items="${course.teachers}">
                                    <jsp:include page="../user/small_user.jsp">
                                        <jsp:param name="userId" value="${teacher.id}"/>
                                        <jsp:param name="userFirstName" value="${teacher.firstName}"/>
                                        <jsp:param name="userLastName" value="${teacher.lastName}"/>
                                    </jsp:include>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="mt-4">
                            <h3>Студенты</h3>
                            <div class="ml-0 float-left">
                                <c:forEach var="student" items="${course.students}">
                                    <jsp:include page="../user/small_user.jsp">
                                        <jsp:param name="userId" value="${student.id}"/>
                                        <jsp:param name="userFirstName" value="${student.firstName}"/>
                                        <jsp:param name="userLastName" value="${student.lastName}"/>
                                    </jsp:include>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>
<jsp:include page="../blocks/bottom.jsp"/>
</body>
</html>
