<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
</head>
<body>
	result.jsp
	<div align="center">
		<h3>${requestScope.map['dir'] }</h3>
		<c:if test="${not empty requestScope.map['dir'] }">
			
			<a href="feedback.jsp?${requestScope.map['fileSystemName'] }" onclick="window.open(this.href, '_blank', 'width=400px,height=300px,toolbars=no,scrollbars=no'); return false;">피드백하기</a>
		</c:if>
	</div>
</body>
</html>