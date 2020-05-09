<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
            <div class="circle course"></div>
            <h2 class="course name">${course.name}</h2>
            <span class="course is_active">
                <c:choose>
                    <c:when test="${course.active}">
                        Активен
                    </c:when>
                    <c:otherwise>
                        Не активен
                    </c:otherwise>
                </c:choose>
            </span>
            <a></a>
        </div>
        <div class="course_main">
            <div class="course_container_main small">
                <ul>
                    <li>О курсе</li>
                    <li>План учёбы</li>
                </ul>
            </div>
            <div class="course_container_main big">
                <c:choose>
                    <c:when test="${param.course_page == 'plan'}">

                    </c:when>
                    <c:otherwise>
                        <div>
                            <div>
                                <h3>О курсе</h3>
                                <span>${course.description}</span>
                            </div>
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
                        </div>
                        <div>
                            <a href=""></a>
                        </div>


                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../blocks/bottom.jsp"/>
</body>
</html>
