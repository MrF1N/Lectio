<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Grey
  Date: 04.05.2020
  Time: 00:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${course.name} - Предпросмотр</title>
</head>
<body class="d-flex flex-column text-center">
<jsp:include page="../blocks/top.jsp">
    <jsp:param name="roles" value="${roles}"/>
</jsp:include>
<div class="mt-lg-4">
    <div class="container">
        <div class="d-flex flex-column">
            <div class="d-inline-flex w-100">
                <div class="circle course big">
                        <span>
                            ${fn:substring(course.name, 0, 1)}
                        </span>
                </div>
                <div class="align-middle m-auto">
                    <h2 class="m-auto ml-lg-4">${course.name}</h2>
                </div>
            </div>
            <%--            <c:if test="${fn:contains(roles, 'CREATOR')}">--%>
            <%--                <div class="d-flex mt-auto mb-auto ml-auto">--%>
            <%--                    <div class="mt-auto mb-auto">--%>
            <%--                        <c:choose>--%>
            <%--                            <c:when test="${course.active}">--%>
            <%--                        <span class="mr-4 green">--%>
            <%--                            Активен--%>
            <%--                        </span>--%>
            <%--                            </c:when>--%>
            <%--                            <c:otherwise>--%>
            <%--                        <span class="mr-4 red">--%>
            <%--                            Не активен--%>
            <%--                        </span>--%>
            <%--                            </c:otherwise>--%>
            <%--                        </c:choose>--%>
            <%--                    </div>--%>
            <%--                    <div class="mt-auto mb-auto">--%>
            <%--                        <a class=" btn btn-outline-warning float-right" href="#">Изменить данные</a>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--            </c:if>--%>
            <c:if test="${fn:contains(roles, 'STUDENT')}">
                <div class="d-flex mt-auto mb-auto ml-auto">
                    <div class="mt-auto mb-auto">
                        <c:choose>
                            <c:when test="${fn:contains(course.students, user)}">
                            </c:when>
                            <c:otherwise>
                                <div class="mt-auto mb-auto">
                                    <a class=" btn btn-outline-success float-right"
                                       href="${pageContext.request.contextPath}/courses/${course.id}/join">Изучать</a>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                </div>
            </c:if>
        </div>
    </div>
</div>
<div class="container m-auto">
    <div class="row">
        <div class="col align-middle mt-auto mb-auto">
            <ul class="list-group text-decoration-none">
                <li class="list-group-item"><a class="text-decoration-none active_course_tab">О курсе</a></li>
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/courses/${course.id}/plan">План
                    учёбы</a>
                </li>
            </ul>
        </div>
        <div class="col-8">
            <div class="course_info">
                <h3>О курсе</h3>
                <span>${course.description}</span>
            </div>
            <div class="d-flex flex-column">
                <div class="mt-4">
                    <h3>Создатель</h3>
                    <div class="ml-0 float-left">
                        <jsp:include page="../user/small_user.jsp">
                            <jsp:param name="userId" value="${course.creator.id}"/>
                            <jsp:param name="userFirstName" value="${course.creator.firstName}"/>
                            <jsp:param name="userLastName" value="${course.creator.lastName}"/>
                        </jsp:include>
                    </div>
                </div>
                <div class="mt-4">
                    <h3>Преподаватели</h3>
                    <div class="ml-0 float-left">
                        <c:forEach var="teacher" items="${course.teachers}">
                            <jsp:include page="../user/small_user.jsp">
                                <jsp:param name="userId" value="${teacher.id}"/>
                                <jsp:param name="userFirstName" value="${teacher.firstName}"/>
                                <jsp:param name="userLastName" value="${teacher.lastName}"/>
                            </jsp:include>
                        </c:forEach>
                    </div>
                </div>
                <div class="mt-4">
                    <h3>Студенты</h3>
                    <div class="ml-0 float-left">
                        <c:forEach var="student" items="${course.students}">
                            <jsp:include page="../user/small_user.jsp">
                                <jsp:param name="userId" value="${student.id}"/>
                                <jsp:param name="userFirstName" value="${student.firstName}"/>
                                <jsp:param name="userLastName" value="${student.lastName}"/>
                            </jsp:include>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../blocks/bottom.jsp"/>
</body>
</html>