<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<a class="user small_view" href="${pageContext.request.contextPath}/user/${param.userId}/profile">
    <div class="circle user">
        <span>${fn:substring(param.userFirstName, 0, 1)} ${fn:substring(param.userLastName, 0, 1)}</span></div>
    <span>${param.userFirstName} ${param.userLastName}</span>
</a>