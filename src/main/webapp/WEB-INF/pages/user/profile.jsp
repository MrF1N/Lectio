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
<jsp:include page="../blocks/top.jsp">
    <jsp:param name="roles" value="${roles}"/>
</jsp:include>
<div class="main container user">
    <div class="full_height center_container">
        <h1 class="margin_zero">Личный кабинет</h1>
        <p class="lead">
            Личная информация и статистика
        </p>
        <h2>Краткая информация</h2>
        <sec:authorize access="isAuthenticated()">
            <p>Логин: ${login}</p>
        </sec:authorize>
        <h2>Оконченные курсы</h2>
        <h2>Сертификаты</h2>
    </div>
</div>
<jsp:include page="../blocks/bottom.jsp"/>
</body>
</html>
