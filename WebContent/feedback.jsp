<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src = "lib/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".yes").on("click", function(){	
				var value = $(this).val();
				console.log(value);
				/* if (val == 'yes'){
					$("#radioButtons").append("<input type='radio' name='기쁨' value ='기쁨'>");
					$("#radioButtons").append("<input type='radio' name='슬픔' value ='슬픔'>");
				} */
			});
			
			$('#no').click(function(){
				$('.radioButtons').show();
			});
		});
	</script>
</head>

<body>
	<h1>사진의 감정과 일치 합니까?</h1>
	<input type="button" id="yes"  value="yes" >
	<input type="button" id="no"  value="no">
	<p>
	<div class = "radioButtons" style="display: none;">
		<input type='radio' name='기쁨' value ='기쁨'>기쁨
		<input type='radio' name='기쁨' value ='기쁨'>슬픔
		<input type='radio' name='기쁨' value ='기쁨'>분노
		<input type='radio' name='기쁨' value ='기쁨'>놀람
	</div>
	<input type="button" value="확인" onClick="window.close()">
	
</body>
</html>