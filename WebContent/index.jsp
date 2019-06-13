<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>home</title>
</head>
<body>

	<jsp:include page="menu.jsp"/> 
	
	<div class="jumbotron" style="background-image: url('https://amp.businessinsider.com/images/55fd7873dd089513618b45c1-1920-960.jpg');
			background-size: cover;
			background-position: center;
			text-shadow: black 0.2em 0.2em 0.2em;
			color: white;">
		<div class="container">
			<h1 class="display-3">Photo & Draw , Emotion </h1>
			<p>당신의 사진과 그림에 있는 표정의 감정을 판별해 줍니다.</p>
		</div>
	</div>

	<div class="container"  style="padding-left :150px;">
		<div class="row">
			<div class="col-md-5">
				<a class="" href='photoPage.jsp'>
				<h4>Photo </h4>				
				<img src='oss/take-a-picture.jpg' style="width:300px; height:300px;" />
				</a>
			</div>
			<div class="col-md-1">
			</div>
			<div class="col-md-5">
				<a href='drawPage.jsp'>
				<h4>Draw</h4>
				<img src='oss/draw2.jpg'  style="width:300px; height:300px;" />
				</a>
			</div>
		</div>
	</div>
	<br>
	<br>
<footer style="background-color: #000000; color: #ffffff">
	<div class="container" >
		<br>
		<div class="row">
			<div class="col-sm-3" style="text-align: center"><h5>Copyright &copy; 2019</h5><p>OpenSource Team 6</p></div>
			<div class="col-sm-4" style="text-align: center"><h5>Team</h5><p>김정훈 이수현 안소진 전소연</p></div>
			<div class="col-sm-2" style="text-align: center"><h5>Professor</h5><p>송인식</p></div>
		</div>
	</div>
</footer>
</body>
</html>