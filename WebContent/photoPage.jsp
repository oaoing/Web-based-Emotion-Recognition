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
		$(function(){
			
			$("#detect").on("click", function(){
				$("#photo").ajaxForm({
					url : "UpLoad", //서버 요청 주소
					type : "post", //get or post 요청방식
					dataType : "json", //서버가 보내오는 데이터 타입(text,html,json,xml)
					success : function(result){
						var ed_html = "";
						var or_html = "";
						$.each(result, function(index, item){
							var resizedFileList = item['resizedFileList'];
							var original = item['original'];

							or_html += "<img src = '" + original + "' style='height: 300px; width: auto;'/>";
							
							
							for(var i in resizedFileList) {
								ed_html += "<button><img id='editedImg"+i+"' src = '"+resizedFileList[i]+"' width = '48' height = '48'/></button>";
							}
							ed_html += "<input type='hidden' name='dir' id='dir'>"
							
						});
						
						$(".original").html(or_html);
						$(".editedImg").html(ed_html);
						
					},
					error : function(err){
						alert(err + "=> 예외발생!!");
					}
				});
				
				$("#photo").submit(); //전송
			});//click 끝
			
			$(document).on("click","#editedImg0",function(){
				var src = document.getElementById("editedImg0").src;
				var res_html = "";
				$('input[name=dir]').attr('value',src);
				
				$("#editedImg").ajaxForm({
					url : "Emotion", //서버 요청 주소
					type : "post", //get or post 요청방식
					dataType : "text", //서버가 보내오는 데이터 타입(text,html,json,xml)
					success : function(result){
						res_html += result + "<br>";
						res_html += "<a href='feedback.jsp?"+"src="+src+"&emotion="+result+"' onclick='window.open(this.href, \"_blank\", \"width=700px,height=300px,toolbars=no,scrollbars=no\"); return false;'>피드백하기</a>"

		  				$("#res").html(res_html);
						
					},
					error : function(err){
						alert(err + "=> 예외발생!!");
					}
				});
			});//click 끝
			
			$(document).on("click","#editedImg1",function(){
				var src = document.getElementById("editedImg1").src;
				var res_html = "";
				$('input[name=dir]').attr('value',src);
				
				$("#editedImg").ajaxForm({
					url : "Emotion", //서버 요청 주소
					type : "post", //get or post 요청방식
					dataType : "text", //서버가 보내오는 데이터 타입(text,html,json,xml)
					success : function(result){
						res_html += result + "<br>";
						res_html += "<a href='feedback.jsp?"+"src="+src+"&emotion="+result+"' onclick='window.open(this.href, \"_blank\", \"width=700px,height=300px,toolbars=no,scrollbars=no\"); return false;'>피드백하기</a>"

		  				$("#res").html(res_html);
						
					},
					error : function(err){
						alert(err + "=> 예외발생!!");
					}
				});
			});//click 끝
			
			$(document).on("click","#editedImg2",function(){
				var src = document.getElementById("editedImg2").src;
				var res_html = "";
				$('input[name=dir]').attr('value',src);
				
				$("#editedImg").ajaxForm({
					url : "Emotion", //서버 요청 주소
					type : "post", //get or post 요청방식
					dataType : "text", //서버가 보내오는 데이터 타입(text,html,json,xml)
					success : function(result){
						res_html += result + "<br>";
						res_html += "<a href='feedback.jsp?"+"src="+src+"&emotion="+result+"' onclick='window.open(this.href, \"_blank\", \"width=700px,height=300px,toolbars=no,scrollbars=no\"); return false;'>피드백하기</a>"

		  				$("#res").html(res_html);
						
					},
					error : function(err){
						alert(err + "=> 예외발생!!");
					}
				});
			});//click 끝
			
			$(document).on("click","#editedImg3",function(){
				var src = document.getElementById("editedImg3").src;
				var res_html = "";
				$('input[name=dir]').attr('value',src);
				
				$("#editedImg").ajaxForm({
					url : "Emotion", //서버 요청 주소
					type : "post", //get or post 요청방식
					dataType : "text", //서버가 보내오는 데이터 타입(text,html,json,xml)
					success : function(result){
						res_html += result + "<br>";
						res_html += "<a href='feedback.jsp?"+"src="+src+"&emotion="+result+"' onclick='window.open(this.href, \"_blank\", \"width=700px,height=300px,toolbars=no,scrollbars=no\"); return false;'>피드백하기</a>"

		  				$("#res").html(res_html);
						
					},
					error : function(err){
						alert(err + "=> 예외발생!!");
					}
				});
			});//click 끝
			
			$(document).on("click","#editedImg4",function(){
				var src = document.getElementById("editedImg4").src;
				var res_html = "";
				$('input[name=dir]').attr('value',src);
				
				$("#editedImg").ajaxForm({
					url : "Emotion", //서버 요청 주소
					type : "post", //get or post 요청방식
					dataType : "text", //서버가 보내오는 데이터 타입(text,html,json,xml)
					success : function(result){
						res_html += result + "<br>";
						res_html += "<a href='feedback.jsp?"+"src="+src+"&emotion="+result+"' onclick='window.open(this.href, \"_blank\", \"width=700px,height=300px,toolbars=no,scrollbars=no\"); return false;'>피드백하기</a>"

		  				$("#res").html(res_html);
						
					},
					error : function(err){
						alert(err + "=> 예외발생!!");
					}
				});
			});//click 끝
			
		});//ready 끝
	</script>
</head>
<body>
	<table>
		<tr>
			<td><jsp:include page="photoForm.jsp" flush="false"/></td>
			<td><jsp:include page="edited.jsp" flush="false"/></td>
		</tr>
		<tr>
			<td><jsp:include page="showPhoto.jsp" flush="false"/></td>
			<td><jsp:include page="result.jsp" flush="false"/></td>
		</tr>
	</table>
</body>
</html>