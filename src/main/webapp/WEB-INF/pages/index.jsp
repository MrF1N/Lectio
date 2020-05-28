<%--
  Created by IntelliJ IDEA.
  User: Grey
  Date: 03.05.2020
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Lectio - обучение online</title>
</head>
<body class="d-flex flex-column h-100 text-right">
<jsp:include page="blocks/top.jsp">
    <jsp:param name="roles" value="${roles}"/>
</jsp:include>
<div class="bg">
    <div class="container h-100 d-flex mr-4">
        <div class="m-auto align-middle">
            <h1>Образовательный сервис Lectio</h1>
            <sec:authorize access="!isAuthenticated()">
                <span>Чтобы начать обучаться или преподавать, пожалуйста войдите в систему</span>
                <div>
                    <a class="btn btn-outline-primary mt-3"
                       href="${pageContext.request.contextPath}/auth/login"><spring:message code="index.enter"/></a>
                </div>
            </sec:authorize>
        </div>
    </div>
</div>
<jsp:include page="blocks/bottom.jsp"/>
</body>
</html>
