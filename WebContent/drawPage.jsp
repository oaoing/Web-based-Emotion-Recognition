<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src = "lib/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
	</script>
	
</head>
<body>
<jsp:include page="menu.jsp"/> 
	
<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">Draw Page</h1>
		</div>
	</div>
	<form action="execution.go">
	<input type="text" name="fileName" value="그림판" />
	<input type="submit" value="실행" />
</form>
	
	<table border="1" frame=void width = "1000" height = "700" cellspacing = 0 cellpadding=0>
		<tr height = "100">
			<td><jsp:include page="imageForm.jsp" flush="false"/></td>
			<td><jsp:include page="edited.jsp" flush="false"/></td>
		</tr>
		<tr height = "100">
			<td><jsp:include page="result_empty.jsp" flush="false"/></td>
			<td><jsp:include page="result.jsp" flush="false"/></td>
		</tr>
	</table>
</body>
</html>