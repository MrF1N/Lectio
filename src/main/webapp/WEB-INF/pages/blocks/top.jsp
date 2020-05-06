<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=utf-8" %>
<spring:url value="/resources" var="theme"/>
<link rel="stylesheet" type="text/css" href="${theme}/css/main.css"/>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">


<sec:authorize access="!isAuthenticated()">
    <div class="top">
        <a class="logo" href="${pageContext.request.contextPath}/">
            <img class="logo_img" src="${theme}/img/logo_transparent.png" alt=""/>
            <span class="logo_name">ectio</span>
        </a>
        <div class="buttons top_buttons">
            <a class="button top_button" href="${pageContext.request.contextPath}/profile"><spring:message
                    code="top.teach"/></a>
            <a class="button top_button" href="${pageContext.request.contextPath}/profile"><spring:message
                    code="top.study"/></a>
        </div>
    </div>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <div class="top signed">
        <a class="logo" href="${pageContext.request.contextPath}/">
            <img class="logo_img" src="${theme}/img/logo_transparent.png" alt=""/>
            <span class="logo_name">ectio</span>
        </a>

        <div class="buttons top_buttons signed">
            <c:if test="${fn:contains(param.roles, 'STUDENT')}">
                <a class="button top_button" href="${pageContext.request.contextPath}/courses/catalog">
                    <spring:message code="top.courses"/>
                </a>
                <a class="button top_button" href="${pageContext.request.contextPath}/courses">
                    <spring:message code="top.my_course"/>
                </a>
            </c:if>
            <c:if test="${fn:contains(param.roles, 'CREATOR')}">
                <a class="button top_button" href="${pageContext.request.contextPath}/courses/new">
                    <spring:message code="top.create_course"/>
                </a>
            </c:if>
                <%--            <c:if test="${fn:contains(param.roles, 'TEACHER')}">--%>
                <%--                <a class="button top_button" href="${pageContext.request.contextPath}/creator/manage_courses">--%>
                <%--                    <spring:message code="top.manage_my_courses"/>--%>
                <%--                </a>--%>
                <%--            </c:if>--%>
            <c:if test="${fn:contains(param.roles, 'ADMIN')}">
                <a class="button top_button" href="${pageContext.request.contextPath}/admin/manage">
                    <spring:message code="top.manage_users"/>
                </a>
            </c:if>
        </div>

        <div class="user_container signed">
            <a class="user signed" href="${pageContext.request.contextPath}/profile">
                <div class="circle user"></div>
                <span><sec:authentication property="principal.username"/></span>
            </a>
            <a class="button top_button exit" href="<c:url value="/auth/logout" />" role="button">Выйти</a>
        </div>
    </div>
</sec:authorize>

