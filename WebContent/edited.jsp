<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
</head>
<body>
	<!-- 감정을 알고 싶은 사진 선택하기 -->
	<c:forEach var = "item" items="${requestScope.map['resizedFileList']}">
		<img src = "${item}" width = "48" height = "48"/>
		
	</c:forEach>
		
</body>
</html>