<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%--
  Created by IntelliJ IDEA.
  User: Grey
  Date: 04.05.2020
  Time: 00:45
  To change this template use File | Settings | File Templates.
--%>

<spring:url value="/spring_security_check" var="loginUrl"/>
<html>
<head>
    <title>Вход</title>
</head>
<body class="d-flex flex-column text-center">
<jsp:include page="../blocks/top.jsp"/>
<div class="container m-auto">
    <form action="${loginUrl}" method="post" class="form-signing m-auto">
        <div class="controls">
            <h1 class="mb-3 font-weight-normal">Вход</h1>
            <div class="form-group input-group-lg">
                <input type="text" class="form-control" name="username" placeholder="Логин" required autofocus>
            </div>
            <div class="form-group input-group-lg">
                <input type="password" class="form-control" name="password" placeholder="Пароль" required>
            </div>
            <button class="btn btn-outline-dark btn-lg" type="submit">Войти</button>
        </div>
    </form>
</div>
<jsp:include page="../blocks/bottom.jsp"/>
</body>
</html>
