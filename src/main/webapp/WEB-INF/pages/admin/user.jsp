<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Grey
  Date: 03.06.2020
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Пользователь</title>
</head>
<body class="d-flex flex-column text-center">
<jsp:include page="../blocks/top.jsp"/>
<div class="container m-auto">
    <div class="w-100 text-left">
        <a href="${pageContext.request.contextPath}/admin/manage" class="btn btn-primary btn-lg ml-0">Назад</a>
    </div>
    <form:form action="/lectio/admin/user" method="post" class="m-auto" modelAttribute="userModel">
        <div class="controls">
            <h1 class="mb-3 font-weight-normal">Пользователь</h1>
            <div class="form-group input-group-lg">
                <div class="row">
                    <div class="col form-group input-group-lg d-none">
                        <label for="id">Id</label>
                        <form:input type="text" path="user.id" class="form-control" placeholder="Имя" id="id"/>
                    </div>

                    <div class="col form-group input-group-lg">
                        <label for="name">Имя</label>
                        <form:input type="text" path="user.firstName" class="form-control" placeholder="Имя" id="name"
                                    required="required" autofocus="autofocus"/>
                    </div>

                    <div class="col form-group input-group-lg">
                        <label for="last_name">Фамилия</label>
                        <form:input type="text" path="user.lastName" class="form-control" placeholder="Фамилия"
                                    id="last_name"
                                    required="required"/>
                    </div>
                </div>

                <div class="form-group input-group-lg">
                    <label for="email">E-mail</label>
                    <form:input type="email" path="user.email" class="form-control" placeholder="E-mail" id="email"
                                required="required"/>
                </div>
            </div>

            <div class="form-group input-group-lg">
                <div class="form-group input-group-lg">
                    <label for="login">Логин</label>
                    <form:input type="text" path="user.login" class="form-control" placeholder="Логин" id="login"
                                required="required"/>
                </div>

                <div class="form-group input-group-lg">
                    <label for="pass">Пароль</label>
                    <form:input type="text" path="user.password" class="form-control" placeholder="Пароль" id="pass"
                                required="required"/>
                </div>

                <div class="form-check form-control-lg">
                    <div class="float-lg-left">
                        <div class="custom-control custom-switch">
                            <form:checkbox class="custom-control-input" id="switchActive" path="user.active"/>
                            <label class="custom-control-label" for="switchActive">Активен</label>
                        </div>
                    </div>
                </div>

            </div>
            <h3 class="mb-3 font-weight-normal">Цель использования ресурса</h3>
            <div class="form-group input-group-lg">

                <div class="form-check form-control-lg">
                    <div class="float-lg-left">
                        <div class="custom-control custom-switch">
                            <form:checkbox class="custom-control-input" id="switchStud" path="student"/>
                            <label class="custom-control-label" for="switchStud">Студент</label>
                        </div>
                    </div>
                </div>

                <div class="form-check form-control-lg">
                    <div class="float-lg-left">
                        <div class="custom-control custom-switch">
                            <form:checkbox class="custom-control-input" id="switchTeach" path="teacher"/>
                            <label class="custom-control-label" for="switchTeach">Преподаватель</label>
                        </div>
                    </div>
                </div>

                <div class="form-check form-control-lg">
                    <div class="float-lg-left">
                        <div class="custom-control custom-switch">
                            <form:checkbox class="custom-control-input" id="switchCreate" path="creator"/>
                            <label class="custom-control-label" for="switchCreate">Создатель</label>
                        </div>
                    </div>
                </div>

                <div class="form-check form-control-lg">
                    <div class="float-lg-left">
                        <div class="custom-control custom-switch">
                            <form:checkbox class="custom-control-input" id="switchAdmin" path="admin"/>
                            <label class="custom-control-label" for="switchAdmin">Администратор</label>
                        </div>
                    </div>
                </div>
            </div>

            <button class="btn btn-outline-dark btn-lg" type="submit">Подтвердить действие</button>
        </div>
    </form:form>
</div>
<jsp:include page="../blocks/bottom.jsp"/>
</body>
</html>
