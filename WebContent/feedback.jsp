<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
    font-family: Arial, sans-serif;
    position:relative;
    background:#40464b;
    height:100%;
    padding:40px 30%;
    margin:0;
}

input[type="checkbox"] {
    display:none;
}

input[type="checkbox"] + label {
    color:#f2f2f2;
}

input[type="checkbox"] + label span {
    display:inline-block;
    width:19px;
    height:19px;
    margin:-2px 10px 0 0;
    vertical-align:middle;
    background:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) left top no-repeat;
    cursor:pointer;
}

input[type="checkbox"]:checked + label span {
    background:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) -19px top no-repeat;
}

input[type="radio"] {
    display:none;
}

input[type="radio"] + label {
    color:#f2f2f2;
    font-family:Arial, sans-serif;
}

input[type="radio"] + label span {
    display:inline-block;
    width:19px;
    height:19px;
    margin:-2px 10px 0 0;
    vertical-align:middle;
    background:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) -38px top no-repeat;
    cursor:pointer;
}

input[type="radio"]:checked + label span {
    background:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) -57px top no-repeat;
}
</style>
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
				window.close();
				$("#feedbackForm").ajaxForm({
					url : "Insert", //서버 요청 주소
					type : "post", //get or post 요청방식
					dataType : "text", //서버가 보내오는 데이터 타입(text,html,json,xml)
					success : function(result){
						
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
	<h2 style="color:white;">사진의 감정이  '<%= "  " + emotion + "   "%>'과 일치 합니까?</h2>
	
	<p>
	
	<form id="feedbackForm">
		<input type="radio" name='yesOrNo' id="yes" value="yes" />
		<label for="yes"><span></span>YES</label>
    	<p>
		<input type="radio" name='yesOrNo' id="no" value="no"/>
		<label for="no"><span></span>No</label>
		<p>
		<input type="hidden" name="src" id="src" value="<%=src%>">
		<input type="hidden" name="emotion" id="emotion" value="<%=emotion%>">
		<input type="hidden" name="feedback" id="feedback">
		
		<div class = "radioButtons" style="display: none;">
			<h5 style="color:white;">알맞은 감정을 선택해 주세요.</h5>
			<input type='radio' id="angry" name='radioTxt' value ='Angry'>
			<label for="angry"><span></span>Angry</label>
		<p>
			<input type='radio'  id="disgust"name='radioTxt' value ='Disgust'>
			<label for="disgust"><span></span>Disgust</label>
		<p>
			<input type='radio' id="fear" name='radioTxt' value ='Fear'>
			<label for="fear"><span></span>Fear</label>
		<p>
			<input type='radio' id="happy" name='radioTxt' value ='Happy'>
			<label for="happy"><span></span>Happy</label>
		<p>
			<input type='radio'  id="sad" name='radioTxt' value ='Sad'>
			<label for="sad"><span></span>Sad</label>
		<p>
			<input type='radio' id="surprise" name='radioTxt' value ='Surprise'>
			<label for="surprise"><span></span>Surprise</label>
		<p>
			<input type='radio' id="neurtral" name='radioTxt' value ='Neutral'>
			<label for="neutral"><span></span>Neutral</label>
		<p>
		</div>
		<input type="button" id="radioButton" name="button" value="확인"  >
	</form>
	
	
    
	
	
</body>
</html>