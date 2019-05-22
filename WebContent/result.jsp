<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
</head>
<body>
	<h1>${requestScope.map['dir'] }</h1>
	<a href="feedback.jsp?${requestScope.map['fileSystemName'] }" onclick="window.open(this.href, '_blank', 'width=400px,height=300px,toolbars=no,scrollbars=no'); return false;">피드백하기</a>
	
</body>
</html>