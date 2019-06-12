<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div id="container">
		<canvas id="drawCanvas" width="300" height="300"
			style="position: relative; border: 1px solid #000;"></canvas>
		<br>
		<button class="btn btn-primary" onclick="clearCanvas();">초기화</button>
		<button class="btn btn-primary" onclick="uploadCanvas();">이미지로 변환</button>
		<img id="myImage">

	</div>

</body>
</html>