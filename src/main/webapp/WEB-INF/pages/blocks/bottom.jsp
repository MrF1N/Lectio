<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html;charset=utf-8" %>
<spring:url value="/resources" var="theme"/>
<link rel="stylesheet" type="text/css" href="${theme}/css/bottom.css"/>

<div class="bottom">
    <span class="bottom_info"><spring:message code="bottom.info"/></span>
</div>