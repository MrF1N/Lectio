<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Grey
  Date: 05.05.2020
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Новый курс</title>
</head>
<body>
<jsp:include page="../blocks/top.jsp">
    <jsp:param name="roles" value="${roles}"/>
</jsp:include>
<div class="container">
    <div class="center_container">
        <form:form action="add" method="post" modelAttribute="course">
            <label class="label_input">
                <form:input type="text" class="form-control" placeholder="Название курса" path="name"
                            required="required"/>
                <form:errors path="name" cssClass="error"/>
            </label>
            <button class="button buttons" type="submit">Создать</button>
        </form:form>
    </div>
</div>
<jsp:include page="../blocks/bottom.jsp"/>
</body>
</html>
