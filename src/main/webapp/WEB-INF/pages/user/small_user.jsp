<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<a class="d-inline-flex text-decoration-none small_user"
   href="${pageContext.request.contextPath}/user/${param.userId}/profile">
    <div class="circle user small">
        <span>${fn:substring(param.userFirstName, 0, 1)} ${fn:substring(param.userLastName, 0, 1)}</span>
    </div>
    <span class="ml-4 mt-auto mb-auto">${param.userFirstName} ${param.userLastName}</span>
</a>