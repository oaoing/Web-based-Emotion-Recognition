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
	<table frame=void width = "1000" height = "800" cellspacing = 0 cellpadding=0>
		<tr height = "100">
			<td><jsp:include page="photoForm.jsp" flush="false"/></td>
			<td><jsp:include page="edited.jsp" flush="false"/></td>
		</tr>
		<tr height = "100">
			<td><jsp:include page="showPhoto.jsp" flush="false"/></td>
			<td><jsp:include page="result.jsp" flush="false"/></td>
		</tr>
	</table>
</body>
</html>