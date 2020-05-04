<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Grey
  Date: 04.05.2020
  Time: 00:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="blocks/top_signed.jsp">
    <jsp:param name="roles" value="${roles}"/>
</jsp:include>
<div class="container">
    <h1>Devcolibri.com</h1>
    <p class="lead">
        Devcolibri - это сервис предоставляющий всем желающим возможность обучаться программированию.
    </p>
    <sec:authorize access="!isAuthenticated()">
        <p><a class="btn btn-lg btn-success" href="<c:url value="/auth/login" />" role="button">Войти</a></p>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <p>Ваш логин: <sec:authentication property="principal.username"/></p>
        <p><a class="btn btn-lg btn-danger" href="<c:url value="/auth/logout" />" role="button">Выйти</a></p>

    </sec:authorize>
</div>
<jsp:include page="blocks/bottom.jsp"/>
</body>
</html>
