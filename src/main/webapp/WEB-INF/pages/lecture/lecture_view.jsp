<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:url value="/files" var="files"/>
<%@page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Лекция</title>
</head>
<body class="d-flex flex-column text-center">
<jsp:include page="../blocks/top.jsp">
    <jsp:param name="roles" value="${roles}"/>
</jsp:include>
<div class="container m-auto">
    <div class="row">
        <div class="col align-middle mt-auto mb-auto ml-0 nav-pills">
            <div class="nav-item">
                <a class="nav-link active" href="${pageContext.request.contextPath}/courses/${lecture.course.id}/plan">Назад</a>
            </div>
        </div>
        <div class="col-10">
            <h1>
                Лекция ${lecture.sequenceNumber} - ${lecture.name}
            </h1>
        </div>
    </div>
    <div class="embed-responsive embed-responsive-9by16">
        <iframe class="embed-responsive-item" src="https://docs.google.com/viewer?url=${lecture.fileUrl}&embedded=true">
            Ваш браузер не поддерживает фреймы
        </iframe>
    </div>
</div>
</body>
</html>
