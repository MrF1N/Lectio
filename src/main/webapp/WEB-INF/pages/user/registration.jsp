<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<spring:url value="/auth/register" var="registrationUrl"/>
<html>
<head>
    <title>Регистрация</title>
</head>
<body class="d-flex flex-column text-center">
<jsp:include page="../blocks/top.jsp"/>
<div class="container m-auto">
    <form:form action="${registrationUrl}" method="post" class="form-signing m-auto" modelAttribute="userModel">
        <div class="controls">
            <h1 class="mb-3 font-weight-normal">Регистрация</h1>
            <div class="form-group input-group-lg">
                <div class="row">
                    <div class="col form-group input-group-lg">
                        <form:input type="text" path="user.firstName" class="form-control" placeholder="Имя"
                                    required="required" autofocus="autofocus"/>
                    </div>

                    <div class="col form-group input-group-lg">
                        <form:input type="text" path="user.lastName" class="form-control" placeholder="Фамилия"
                                    required="required"/>
                    </div>
                </div>

                <div class="form-group input-group-lg">
                    <form:input type="email" path="user.email" class="form-control" placeholder="E-mail"
                                required="required"/>
                </div>
            </div>

            <div class="form-group input-group-lg">
                <div class="form-group input-group-lg">
                    <form:input type="text" path="user.login" class="form-control" placeholder="Логин"
                                required="required"/>
                </div>

                <div class="form-group input-group-lg">
                    <form:input type="password" path="user.password" class="form-control" placeholder="Пароль"
                                required="required"/>
                </div>

                <div class="form-group input-group-lg">
                    <input type="password" class="form-control" placeholder="Повторить пароль" required="required"/>
                </div>
            </div>
            <h3 class="mb-3 font-weight-normal">Цель использования ресурса</h3>
            <div class="form-group input-group-lg">

                <div class="form-check form-control-lg">
                    <div class="float-lg-left">
                        <div class="custom-control custom-switch">
                            <form:checkbox class="custom-control-input" id="switchStud" path="student"/>
                            <label class="custom-control-label" for="switchStud">Обучение</label>
                        </div>
                    </div>
                </div>

                <div class="form-check form-control-lg">
                    <div class="float-lg-left">
                        <div class="custom-control custom-switch">
                            <form:checkbox class="custom-control-input" id="switchTeach" path="teacher"/>
                            <label class="custom-control-label" for="switchTeach">Преподавание</label>
                        </div>
                    </div>
                </div>

                <div class="form-check form-control-lg">
                    <div class="float-lg-left">
                        <div class="custom-control custom-switch">
                            <form:checkbox class="custom-control-input" id="switchCreate" path="creator"/>
                            <label class="custom-control-label" for="switchCreate">Создание курсов</label>
                        </div>
                    </div>
                </div>
            </div>

            <button class="btn btn-outline-dark btn-lg" type="submit">Зарегистрироваться</button>
        </div>
    </form:form>
</div>
<jsp:include page="../blocks/bottom.jsp"/>
</body>
</html>
