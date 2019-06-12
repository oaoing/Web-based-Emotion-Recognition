<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<script type="text/javascript" src="lib/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="lib/jquery.form.min.js"></script>
	<style type="text/css">
		table {
			width: 1000px;
			height: 800px;
		}
		
		td {
			vertical-align: top;
			width: 500px;
			height: 400px;
			align-content: center;
		}
	</style>
	<script type="text/javascript">
	if (window.addEventListener) {
		window.addEventListener('load', InitEvent, false);
	}
	var canvas, context, tool;
	function InitEvent() {
		canvas = document.getElementById('drawCanvas');
		if (!canvas) {
			alert("캔버스 객체를 찾을 수 없음");
			return;
		}
		if (!canvas.getContext) {
			alert("Drawing Contextf를 찾을 수 없음");
			return;
		}
		context = canvas.getContext('2d');
		context.lineWidth = 3;
		
		context.fillStyle = '#fff';  // 흰색으로 채우기
		context.fillRect(0, 0, canvas.width, canvas.height);
		
		if (!context) {
			alert("getContext() 함수를 호출 할 수 없음");
			return;
		}
		// Pencil tool 객체를 생성 한다.
		tool = new tool_pencil();
		canvas.addEventListener('mousedown', ev_canvas, false);
		canvas.addEventListener('mousemove', ev_canvas, false);
		canvas.addEventListener('mouseup', ev_canvas, false);
	}
	function tool_pencil() {
		var tool = this;
		this.started = false;
		// 마우스를 누르는 순간 그리기 작업을 시작 한다. 
		this.mousedown = function(ev) {
			context.beginPath();
			context.moveTo(ev._x, ev._y);
			tool.started = true;
		};
		// 마우스가 이동하는 동안 계속 호출하여 Canvas에 Line을 그려 나간다
		this.mousemove = function(ev) {
			if (tool.started) {
				context.lineTo(ev._x, ev._y);
				context.stroke();
			}
		};
		// 마우스 떼면 그리기 작업을 중단한다
		this.mouseup = function(ev) {
			if (tool.started) {
				tool.mousemove(ev);
				tool.started = false;
			}
		};
	}
	// Canvas요소 내의 좌표를 결정 한다.
	function ev_canvas(ev) {
		if (ev.layerX || ev.layerX == 0) { // Firefox 브라우저
			ev._x = ev.layerX;
			ev._y = ev.layerY;
		} else if (ev.offsetX || ev.offsetX == 0) { // Opera 브라우저
			ev._x = ev.offsetX;
			ev._y = ev.offsetY;
		}
		// tool의 이벤트 핸들러를 호출한다.
		var func = tool[ev.type];
		if (func) {
			func(ev);
		}
	}
	function clearCanvas() {
		// canvas
		var cnvs = document.getElementById('drawCanvas');
		// context
		var ctx = canvas.getContext('2d');
		// 픽셀 정리
		ctx.clearRect(0, 0, cnvs.width, cnvs.height);
		// 컨텍스트 리셋
		ctx.beginPath();
	}
	function uploadCanvas() { //이미지를 서버에 전송
		var canvas = document.getElementById('drawCanvas');
		var canvImgStr = canvas.toDataURL('image/jpeg', 1.0); // canvas.toDataURL()을 이용하여 base64 img string 으로 변경
		var paint_html = "";
		var res_html = "";
		$.ajax({
			url : 'Paint',
			data : {strImg : canvImgStr},
			type : 'post',
			dataType : "text",
			success : function(src) {
				paint_html += "<button><img id='editedImg' src = '" + src + "'/></button>";
				$("#paintImg").html(paint_html);
				
			},
			error : function(err) {
				alert(err + "=> 예외발생!!");
			}
		});
		return;
	}
	
	$(document).on("click","#editedImg",function(){
		var src = document.getElementById("editedImg").src;
		var res_html = "";
		$.ajax({
			url : "Emotion", //서버 요청 주소
			type : "post", //get or post 요청방식
			data : {dir : src.replace('\\','/')},
			dataType : "text", //서버가 보내오는 데이터 타입(text,html,json,xml)
			success : function(emotion){
				res_html += emotion + "<br>";
				res_html += "<a href='feedback.jsp?"+"src="+src.replace('\\','/')+"&emotion="+emotion+"' onclick='window.open(this.href, \"_blank\", \"width=700px,height=500px,toolbars=no,scrollbars=no\"); return false;'>피드백하기</a>"
	
					$("#res").html(res_html);
				
			},
			error : function(err){
				alert(err + "=> 예외발생!!");
			}
		});
	});
</script>
	
</head>
<body>
<jsp:include page="menu.jsp"/> 
	
<div class="jumbotron" style="background-image: url('https://amp.businessinsider.com/images/55fd7873dd089513618b45c1-1920-960.jpg');
			background-size: cover;
			background-position: center;
			text-shadow: black 0.2em 0.2em 0.2em;
			color: white;">
		<div class="container">
			<h1 class="display-3">Draw Form</h1>
			<p>그림에 있는 표정의 감정을 판별해 줍니다.</p>
		</div>
	</div>
	
	
	<div class="container" >
		<div class="row">
			<div class="col-md-4">
<%--
			<form action="execution.go">
	<input type="text" name="fileName" value="그림판" />
	<input type="submit" class="btn btn-primary"  value="실행" />
	</form>
--%>
		
				<h4>Draw </h4>		
						<jsp:include page="drawingForm.jsp" flush="false"/>
			<br>
			</div>
			<div class="col-md-2">
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<img src='https://t1.daumcdn.net/cfile/tistory/18718E3D5083FDF705' width="100px;" height="50px;" />
			</div>
			<%-- 
			<div class="col-md-4">
				<br>
				<br>
				<br>
				<br>
				<br>
				<jsp:include page="edited.jsp" flush="false"/>
			</div>
			--%>
			<div class="col-md-2">
			<br>
			<br>
			<br>
			<br>
			<jsp:include page="result.jsp" flush="false"/>
			</div>
		</div>
	</div>
	
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