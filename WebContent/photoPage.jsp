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
                  res_html += "<a href='feedback.jsp?"+"src="+src+"&emotion="+result+"' onclick='window.open(this.href, \"_blank\", \"width=700px,height=500px,toolbars=no,scrollbars=no\"); return false;'>피드백하기</a>"

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
                  res_html += "<a href='feedback.jsp?"+"src="+src+"&emotion="+result+"' onclick='window.open(this.href, \"_blank\", \"width=700px,height=500px,toolbars=no,scrollbars=no\"); return false;'>피드백하기</a>"

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
                  res_html += "<a href='feedback.jsp?"+"src="+src+"&emotion="+result+"' onclick='window.open(this.href, \"_blank\", \"width=700px,height=500px,toolbars=no,scrollbars=no\"); return false;'>피드백하기</a>"

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
                  res_html += "<a href='feedback.jsp?"+"src="+src+"&emotion="+result+"' onclick='window.open(this.href, \"_blank\", \"width=700px,height=500px,toolbars=no,scrollbars=no\"); return false;'>피드백하기</a>"

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
                  res_html += "<a href='feedback.jsp?"+"src="+src+"&emotion="+result+"' onclick='window.open(this.href, \"_blank\", \"width=700px,height=500px,toolbars=no,scrollbars=no\"); return false;'>피드백하기</a>"

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
<jsp:include page="menu.jsp"/> 
	
<div class="jumbotron" style="background-image: url('https://amp.businessinsider.com/images/55fd7873dd089513618b45c1-1920-960.jpg');
			background-size: cover;
			background-position: center;
			text-shadow: black 0.2em 0.2em 0.2em;
			color: white;">
		<div class="container">
			<h1 class="display-3">Image Form</h1>
			<p>사진에 있는 표정의 감정을 판별해 줍니다.</p>
		</div>
	</div>
	
	<div class="container" >
		<div class="row">
			<div class="col-md-4">
				<h4>Image </h4>		
						<jsp:include page="photoForm.jsp" flush="false"/>
			<br>
			</div>
			<div class="col-md-1">
			<br>
			<br>
			<br>
			<br>
			<br>
			<img src='https://t1.daumcdn.net/cfile/tistory/18718E3D5083FDF705' width="100px;" height="50px;" />
			</div>
			<div class="col-md-3">
				<br>
				<br>
				<br>
				<br>
				<br>
				<jsp:include page="edited.jsp" flush="false"/>
			</div>
			<div class="col-md-1">
			<br>
			<br>
			<br>
			<br>
			<br>
			<img src='https://t1.daumcdn.net/cfile/tistory/18718E3D5083FDF705' width="100px;" height="50px;" />
			</div>
			<div class="col-md-1">
			</div>	
			<div class="col-md-2" >
			<br>
			<br>
			<br>
			<br>
			<br>
			<jsp:include page="result.jsp" flush="false"/>
			</div>
		</div>
	</div>
	
	
	<%-- 
	<div class="container" style="padding-left :100px;">
	<table border="1" frame=void width = "1000" height = "500" cellspacing = 0 cellpadding=0>
		<tr height = "100">
			<td><jsp:include page="photoForm.jsp" flush="false"/></td>
			<td><jsp:include page="edited.jsp" flush="false"/></td>
		</tr>
		<tr height = "50">
			<td><jsp:include page="result_empty.jsp" flush="false"/></td>
			<td><jsp:include page="result.jsp" flush="false"/></td>
		</tr>
	</table>
	</div>
	--%>
	<%-- 
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
	--%>
	
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