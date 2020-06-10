<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Grey
  Date: 05.05.2020
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Курсы</title>
</head>
<body class="d-flex flex-column">
<jsp:include page="../blocks/top.jsp">
    <jsp:param name="roles" value="${roles}"/>
</jsp:include>
<div class="container mb-auto mt-5">
    <c:if test="${fn:contains(roles, 'STUDENT')}">
        <div class="container mb-auto">
            <h2>Изучаемые курсы</h2>
            <div class="row mt-4 d-flex align-items-stretch row-cols-1 row-cols-md-3">
                <c:forEach var="course" items="${study_courses}">
                    <div class="col mb-4">
                        <div class="card h-100">
                            <div class="card-header text-left h-100">
                                <h5 class="card-title">${course.name}</h5>
                            </div>
                            <div class="card-footer bg-transparent">
                                <a href="${pageContext.request.contextPath}/courses/${course.id}"
                                   class="btn btn-primary">Продолжить обучение</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </c:if>
    <c:if test="${fn:contains(roles, 'TEACHER')}">
        <div class="container mb-auto">
            <h2>Преподаваемые курсы</h2>
            <div class="row mt-4 d-flex align-items-stretch row-cols-1 row-cols-md-3">
                <c:forEach var="course" items="${teach_courses}">
                    <div class="col mb-4">
                        <div class="card h-100">
                            <div class="card-header text-left h-100">
                                <h5 class="card-title">${course.name}</h5>
                            </div>
                            <div class="card-footer bg-transparent">
                                <a href="${pageContext.request.contextPath}/courses/${course.id}"
                                   class="btn btn-primary">Преподавать</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </c:if>
    <c:if test="${fn:contains(roles, 'CREATOR')}">
        <div class="container mb-auto">
            <h1 class="text-left">Изучаемые курсы</h1>
            <div class="row mt-4 d-flex align-items-stretch row-cols-1 row-cols-md-3">
                <c:forEach var="course" items="${created_courses}">
                    <div class="col mb-4">
                        <div class="card h-100">
                            <div class="card-body">
                                <h5 class="card-title">${course.name}</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the
                                    bulk of the card's content.</p>
                                <div class="d-flex justify-content-between">
                                    <a href="${pageContext.request.contextPath}/courses/${course.id}"
                                       class="card-link">Изучать</a>
                                    <a href="${pageContext.request.contextPath}/courses/${course.id}"
                                       class="card-link">Посмотреть результаты</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </c:if>
</div>
<jsp:include page="../blocks/bottom.jsp"/>
</body>
</html>
