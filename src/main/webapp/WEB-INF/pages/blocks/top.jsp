<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=utf-8" %>
<spring:url value="/resources" var="theme"/>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Heebo&display=swap" rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${theme}/css/main.css"/>


<sec:authorize access="!isAuthenticated()">
    <header class="masthead">
        <nav class="navbar navbar-light bg-light">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                <img src="${theme}/img/logo_transparent.png" width="30" height="30" class="d-inline-block align-top"
                     alt=""/>
                ectio
            </a>
            <div class="btn-group" role="group">
                <a class="btn btn-outline-primary my-2 my-sm-0"
                   href="${pageContext.request.contextPath}/auth/registration">
                    <spring:message
                            code="top.teach"/></a>
                <a class="btn btn-outline-primary my-2 my-sm-0"
                   href="${pageContext.request.contextPath}/auth/registration">
                    <spring:message
                            code="top.study"/></a>
            </div>
        </nav>
    </header>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <header class="masthead">
        <nav class="navbar navbar-expand-lg navbar-light bg-primary">
            <a class="navbar-brand ml-auto mr-auto" href="${pageContext.request.contextPath}/">
                <b style="margin-left: 120px; font-size: 1.5rem">
                    Staff Training System
                </b>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                </ul>
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="" data-toggle="dropdown">
                            <span><b>Сотрудник</b></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="nav-link dropdown-item"
                               href="${pageContext.request.contextPath}/profile">Профиль</a>
                            <c:if test="${fn:contains(param.roles, 'STUDENT')}">
                                <a class="nav-link dropdown-item"
                                   href="${pageContext.request.contextPath}/courses/catalog">
                                    <spring:message code="top.courses"/>
                                </a>
                            </c:if>
                            <c:if test="${fn:contains(param.roles, 'CREATOR')}">
                                <a class="nav-link dropdown-item" href="${pageContext.request.contextPath}/courses">
                                    <spring:message code="top.my_course"/>
                                </a>
                                <a class="nav-link dropdown-item" href="${pageContext.request.contextPath}/courses/new">
                                    <spring:message code="top.create_course"/>
                                </a>
                            </c:if>
                            <c:if test="${(fn:contains(param.roles, 'STUDENT') || fn:contains(param.roles, 'TEACHER')) && !fn:contains(param.roles, 'CREATOR')}">
                                <a class="nav-link" href="${pageContext.request.contextPath}/courses">
                                    <spring:message code="top.my_course"/>
                                </a>
                            </c:if>
                            <a class="nav-link dropdown-item" href="<c:url value="/auth/logout" />"
                               role="button">Выйти</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
</sec:authorize>

