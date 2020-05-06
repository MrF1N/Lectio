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
<body>
<jsp:include page="blocks/top.jsp"/>
<div class="login_container">
    <form action="${loginUrl}" method="post">
        <div class="controls">
            <h1 class="login_heading">Вход</h1>
            <label class="label_input">
                <input type="text" class="form-control" name="username" placeholder="Логин" required autofocus>
            </label>
            <label class="label_input">
                <input type="password" class="form-control" name="password" placeholder="Пароль" required>
            </label>
            <button class="button buttons" type="submit">Войти</button>
        </div>
    </form>
</div>
<jsp:include page="blocks/bottom.jsp"/>
</body>
</html>
