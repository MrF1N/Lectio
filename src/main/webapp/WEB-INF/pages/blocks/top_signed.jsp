<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html;charset=utf-8" %>
<spring:url value="/resources" var="theme"/>
<link rel="stylesheet" type="text/css" href="${theme}/css/top.css"/>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">

<div class="top">
    <a class="logo" href="${pageContext.request.contextPath}/">
        <img class="logo_img" src="${theme}/img/logo_transparent.png" alt=""/>
        <span class="logo_name">ectio</span>
    </a>
    <c:if test="${fn:contains(param.roles, 'STUDENT')}">
        <div class="buttons top_buttons">
            <a class="button top_button" href="${pageContext.request.contextPath}/create/profile"><spring:message code="top.teach"/></a>
            <a class="button top_button" href="${pageContext.request.contextPath}/study/profile"><spring:message code="top.study"/></a>
        </div>
    </c:if>
    <c:if test="${fn:contains(param.roles, 'CREATOR')}">
        <div class="buttons top_buttons">
            <a class="button top_button" href="${pageContext.request.contextPath}/create/profile"><spring:message code="top.teach"/></a>
            <a class="button top_button" href="${pageContext.request.contextPath}/study/profile"><spring:message code="top.study"/></a>
        </div>
    </c:if>
    <c:if test="${fn:contains(param.roles, 'TEACHER')}">
        <div class="buttons top_buttons">
            <a class="button top_button" href="${pageContext.request.contextPath}/create/profile"><spring:message code="top.teach"/></a>
            <a class="button top_button" href="${pageContext.request.contextPath}/study/profile"><spring:message code="top.study"/></a>
        </div>
    </c:if>
    <c:if test="${fn:contains(param.roles, 'ADMIN')}">
        <div class="buttons top_buttons">
            <a class="button top_button" href="${pageContext.request.contextPath}/create/profile"><spring:message code="top.teach"/></a>
            <a class="button top_button" href="${pageContext.request.contextPath}/study/profile"><spring:message code="top.study"/></a>
        </div>
    </c:if>

</div>
