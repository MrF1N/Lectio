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
<body>
<jsp:include page="../blocks/top.jsp">
    <jsp:param name="roles" value="${roles}"/>
</jsp:include>
<div class="main container">
    <div class="search">
        <form action="/action_page.php">
            <input type="text" placeholder="Search.." name="search">
            <button type="submit"><i class="fa fa-search"></i></button>
        </form>
    </div>

</div>
<jsp:include page="../blocks/bottom.jsp"/>
</body>
</html>
