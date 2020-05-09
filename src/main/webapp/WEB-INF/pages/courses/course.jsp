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
    <title>${course.name}</title>
</head>
<body>
<jsp:include page="../blocks/top.jsp">
    <jsp:param name="roles" value="${roles}"/>
</jsp:include>
<div class="main container">
    <div class="center_container">
        <div class="course_header">
            <div class="content_center">
                <div>
                    <div class="circle course">
                <span>
                    ${fn:substring(course.name, 0, 1)}
                </span>
                    </div>
                    <h2 class="course name">${course.name}</h2>
                </div>
                <div>
                    <c:choose>
                        <c:when test="${course.active}">
                        <span class="course is_active active">
                            Активен
                        </span>
                        </c:when>
                        <c:otherwise>
                        <span class="course is_active passive">
                            Не активен
                        </span>
                        </c:otherwise>
                    </c:choose>
                    <a class="button course" href="#">Изменить данные</a>
                </div>
            </div>
        </div>
        <c:choose>
            <c:when test="${course_page == 'plan'}">
                <div class="course_main">
                    <div class="course_container_main small">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/courses/${course.id}">О курсе</a></li>
                            <li><a class="active_course_tab">План учёбы</a></li>
                        </ul>
                    </div>
                    <div class="course_container_main big">

                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="course_main">
                    <div class="course_container_main small">
                        <ul>
                            <li><a class="active_course_tab">О курсе</a></li>
                            <li><a href="${pageContext.request.contextPath}/courses/${course.id}/plan">План учёбы</a>
                            </li>
                        </ul>
                    </div>
                    <div class="course_container_main big">
                        <div>
                            <div class="course_info">
                                <h3>О курсе</h3>
                                <span>${course.description}</span>
                            </div>
                            <div class="course_info users">
                                <div>
                                    <h3>Создатель</h3>
                                    <jsp:include page="../user/small_user.jsp">
                                        <jsp:param name="userId" value="${course.creator.id}"/>
                                        <jsp:param name="userFirstName" value="${course.creator.firstName}"/>
                                        <jsp:param name="userLastName" value="${course.creator.lastName}"/>
                                    </jsp:include>
                                </div>
                                <div>
                                    <h3>Преподаватели</h3>
                                    <c:forEach var="teacher" items="${course.teachers}">
                                        <jsp:include page="../user/small_user.jsp">
                                            <jsp:param name="userId" value="${teacher.id}"/>
                                            <jsp:param name="userFirstName" value="${teacher.firstName}"/>
                                            <jsp:param name="userLastName" value="${teacher.lastName}"/>
                                        </jsp:include>
                                    </c:forEach>
                                </div>
                                <div>
                                    <h3>Студенты</h3>
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
            </c:otherwise>
        </c:choose>
    </div>
</div>
<jsp:include page="../blocks/bottom.jsp"/>
</body>
</html>
