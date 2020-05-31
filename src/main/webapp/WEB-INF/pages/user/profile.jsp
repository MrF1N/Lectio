<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Grey
  Date: 04.05.2020
  Time: 00:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<spring:url value="/resources" var="theme"/>
<html>
<head>
    <title>Пользователь ${login}</title>
</head>
<body class="d-flex flex-column text-center">
<jsp:include page="../blocks/top.jsp">
    <jsp:param name="roles" value="${roles}"/>
</jsp:include>
<div class="mt-lg-4">
    <div class="container">
        <h1>Личный кабинет</h1>
        <div class="float-left d-flex w-100">
            <div class="d-flex">
                <div class="circle user big">
                    <span>${fn:substring(user.firstName, 0, 1)} ${fn:substring(user.lastName, 0, 1)}</span>
                </div>
                <h2 class="m-auto ml-lg-4">${user.firstName} ${user.lastName}</h2>
            </div>

            <div class="m-auto ml-auto w-50">
                <button type="button" class="btn btn-outline-warning float-right">Редактировать</button>
            </div>
        </div>

    </div>
</div>
<%--<div class="container m-auto">--%>
<%--    <h3>Краткая информация</h3>--%>
<%--    <sec:authorize access="isAuthenticated()">--%>
<%--        <p>Логин: ${user.login}</p>--%>
<%--    </sec:authorize>--%>
<%--</div>--%>
<div class="container m-auto">
    <h3>Текущие курсы</h3>
    <div class="row mt-3 d-flex justify-content-center row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-3">
        <c:forEach var="course" items="${courses}">
            <div class="col mb-3">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="card-title">${course.name}</h5>
                        <div class="col mb-2">
                            <a href="${pageContext.request.contextPath}/courses/${course.id}"
                               class="card-link btn btn-outline-dark">Продолжить обучение</a>
                        </div>
                        <div class="col">
                            <a href="#" class="card-link">Статистика</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<div class="container m-auto">
    <h3>Сертификаты</h3>
    <div class="row mt-3 d-flex justify-content-center row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-3">
        <c:forEach var="certificate" items="${certificates}">
            <div class="col mb-3">
                <div class="card h-100">
                    <img src="${theme}/img/certificate.jpg" class="card-img-top" alt="">
                    <div class="card-body">
                        <p class="card-text">${certificate.name}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<jsp:include page="../blocks/bottom.jsp"/>
</body>
</html>
