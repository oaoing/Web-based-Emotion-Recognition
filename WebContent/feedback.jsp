<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src = "lib/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src = "lib/jquery.form.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#yes").on("click", function(){	
				$('.radioButtons').hide();
			});
			
			$('#no').click(function(){
				$('.radioButtons').show();
			});
			
			$(document).on("click","#radioButton",function(){
				var yesOrNo = $('input[name="yesOrNo"]:checked').val();
				$('input[name=feedback]').attr('value',yesOrNo);
				if(yesOrNo == 'no'){
					var radioVal = $('input[name="radioTxt"]:checked').val();
					$('input[name=emotion]').attr('value',radioVal);
				}
				
				$("#feedbackForm").ajaxForm({
					url : "Insert", //서버 요청 주소
					type : "post", //get or post 요청방식
					dataType : "text", //서버가 보내오는 데이터 타입(text,html,json,xml)
					success : function(result){
						alert(result);
						window.close();
					},
					error : function(err){
						alert(err + "=> 예외발생!!");
					}
				});
				$("#feedbackForm").submit(); //전송
			});//click 끝
		});
	</script>
	<!-- <style type="text/css">
		input[type="radio"].toggle {
		  display: none;
		}
		
		input[type="radio"].toggle:checked + label {
		  /* Do something special with the selected state */
		}
	</style> -->
</head>
	<% String emotion = request.getParameter("emotion"); %>
	<% String src = request.getParameter("src"); %>
	
<body>
	<h1>사진의 감정이 '<%=emotion %>'과 일치 합니까?</h1>
	
	<p>
	
	<form id="feedbackForm">
		<input type="radio" name='yesOrNo' id="yes" value="yes">yes
		<input type="radio" name='yesOrNo' id="no" value="no">no
		<p>
		<input type="hidden" name="src" id="src" value="<%=src%>">
		<input type="hidden" name="emotion" id="emotion" value="<%=emotion%>">
		<input type="hidden" name="feedback" id="feedback">
		
		<div class = "radioButtons" style="display: none;">
			<input type='radio' name='radioTxt' value ='Angry'>Angry
			<input type='radio' name='radioTxt' value ='Disgust'>Disgust
			<input type='radio' name='radioTxt' value ='Fear'>Fear
			<input type='radio' name='radioTxt' value ='Happy'>Happy
			<input type='radio' name='radioTxt' value ='Sad'>Sad
			<input type='radio' name='radioTxt' value ='Surprise'>Surprise
			<input type='radio' name='radioTxt' value ='Neutral'>Neutral
		</div>
		<input type="button" id="radioButton" name="button" value="확인">
	</form>
	
</body>
</html>