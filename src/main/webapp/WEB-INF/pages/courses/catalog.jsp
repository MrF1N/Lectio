<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Grey
  Date: 04.05.2020
  Time: 00:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Каталог курсов</title>
</head>
<body class="d-flex flex-column text-center">
<jsp:include page="../blocks/top.jsp">
    <jsp:param name="roles" value="${roles}"/>
</jsp:include>
<div class="container md-form m-4 mr-auto ml-auto ">
    <form class="form-inline justify-content-center" method="get"
          action="${pageContext.request.contextPath}/courses/catalog">
        <input class="form-control form-control-lg mr-sm-2 w-75" type="search" placeholder="Поиск по курсам"
               name="filter" minlength="3" value="${filter}">
        <input class="btn btn-light mr-0" type="submit" value="Поиск">
    </form>
</div>
<div class="container">
    <div class="row mt-4 d-flex align-items-stretch row-cols-1 row-cols-md-3">
        <c:forEach var="course" items="${courses}">
            <div class="col mb-4">
                <div class="card h-100">
                    <div class="card-header text-left">
                        <h5 class="card-title">${course.name}</h5>
                    </div>
                    <div class="card-body text-left">
                        <span class="card-text">${course.description}</span>
                    </div>
                    <div class="card-footer bg-transparent">
                        <c:choose>
                            <c:when test="${fn:contains(course.students, user)}">
                                <a href="${pageContext.request.contextPath}/courses/${course.id}"
                                   class="btn btn-primary">Продолжить обучение</a>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/courses/${course.id}/preview"
                                   class="btn btn-primary">Изучить</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<nav class="mb-0 mt-auto bottomNav">
    <ul class="pagination justify-content-center">
        <li class="page-item disabled">
            <a class="page-link" href="#">
                Первая
            </a>
        </li>
        <li class="page-item">
            <a class="page-link" href="#" aria-label="Предыдущая">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item">
            <a class="page-link" href="#" aria-label="Следующая">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
        <li class="page-item">
            <a class="page-link" href="#">
                Последняя
            </a>
        </li>
    </ul>
</nav>
<jsp:include page="../blocks/bottom.jsp"/>
</body>
</html>
