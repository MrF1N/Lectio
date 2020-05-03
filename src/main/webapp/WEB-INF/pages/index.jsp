<%--
  Created by IntelliJ IDEA.
  User: Grey
  Date: 03.05.2020
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:url value="/resources" var="theme"/>
<html>
<head>
    <title>Lectio - обучение online</title>
    <link rel="stylesheet" type="text/css" href="${theme}/css/main.css"/>
</head>
<body>
<jsp:include page="blocks/top.jsp"/>
<div class="join_block">
    <div>
            <h1>Образовательный сервис Lectio</h1>
            <span>Чтобы начать обучаться или преподавать, пожалуйста войдите в систему</span>
            <div class="buttons">
                <a class="button" href="#"><spring:message code="index.enter"/></a>
            </div>
    </div>
</div>
<jsp:include page="blocks/bottom.jsp"/>
</body>
</html>
