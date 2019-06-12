<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		/* $(function(){
			$("#editedImg1").on("click", function(){
				var src = document.getElementById("editedImg1").src;
				$('#dir').val(src);
			});
			$("#editedImg2").on("click", function(){
				var src = document.getElementById("editedImg2").src;
				$('#dir').val(src);
			});
			$("#editedImg3").on("click", function(){
				var src = document.getElementById("editedImg3").src;
				$('#dir').val(src);
			});
			$("#editedImg4").on("click", function(){
				var src = document.getElementById("editedImg4").src;
				$('#dir').val(src);
			});
			$("#editedImg5").on("click", function(){
				var src = document.getElementById("editedImg5").src;
				$('#dir').val(src);
			});
			
		}); */
		
		
	</script>
</head>
<body>
	<!-- 감정을 알고 싶은 사진 선택하기 -->
	<div align="center">
		<%-- <form method="post" action="Emotion"class="editedImg">
			<c:forEach var = "item" items="${requestScope.map['resizedFileList']}" varStatus="status">
					
					<button><img id="editedImg${status.count}" src = "${item}" width = "48" height = "48"/></button>
				
			</c:forEach>
			<input type="hidden" name="dir" id="dir">
			<input type="hidden" name="resizedFileList" id="resizedFileList" value="${requestScope.map['resizedFileList']}">
		</form> --%>
		
		
		<h4>-판별할 얼굴-</h4>
		<!-- <form method="post" action="Emotion" class="editedImg">
			<input type="hidden" name="dir" id="dir">
		</form> -->
		
		<form class="editedImg" id="editedImg">
		</form>
	</div>
</body>
</html>