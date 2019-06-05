<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
</head>
<body>
	<h1> 사진으로 표정 분석하기 </h1>
	<!-- <form method="post"  action="UpLoad" enctype="multipart/form-data" id="photoForm">
	  파일첨부 : <input type="file" name="file"/><p>
	  <div align="right">
	  	<input type="submit" value="얼굴 탐지" />
	  </div>
	</form> -->
	
		<form method="post" enctype="multipart/form-data" id="photo">
		  파일첨부 : <input type="file" name="file"/><p>
		  <div align="right">
		  	<input type="button" value="얼굴 탐지" id="detect"/>
		  </div>
		</form>
	
	<!-- <hr> -->
	<!-- <iframe src = "edited.jsp" width = "100%" height = "100%" frameborder = 0 name = "b"></iframe> -->
</body>
</html>