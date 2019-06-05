<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="menu.jsp"/> 
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">Image & Draw , Emotion </h1>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<a href='photoPage.jsp'>
				<h4>Image </h4>				
				<img src='oss/image.png' />
				</a>
			</div>
			<div class="col-md-5">
				<a href='drawPage.jsp'>
				<h4>Draw</h4>
				<img src='oss/draw2.png' />
				</a>
			</div>
		</div>
	</div>

</body>
</html>