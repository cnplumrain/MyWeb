<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(document).keypress(function(e){
			if(e.ctrlKey && (e.which == 13 || e.which == 10)) {    
				//要执行的操作
				var msg = $("#msg").html();
				$.ajax({
			           type: "POST",
			           url: "chat",
			           //contentType:"application/json",
			           data:{msg:msg},  //参数列表
			           //dataType:"json",		//加了json则返回数据必须为json格式
			           success: function(result){
			           
			           },
			           error: function(result){
			              //请求失败之后的操作
			        	   alert(result);
			           }
			    });	
			}
		});
		//setInterval(getMsg,1000);
		function getMsg(){
			$.ajax({
		           type: "POST",
		           url: "getMsg",
		           //contentType:"application/json",
		           data:null,  //参数列表
		           //dataType:"json",		//加了json则返回数据必须为json格式
		           success: function(result){
  
		           },
		           error: function(result){
		              //请求失败之后的操作
		        	   alert(result);
		           }
		    });	
		}
	});
</script>
<title>Insert title here</title>
</head>
<body style="">

<div style="border: 1px solid #63B8FF">
	<div id="history" style="height: 500px">
		
	</div>
	<hr style="border:0.5px solid #63B8FF">
	<div id="tool" style="height: 50px"></div>
	<div id="msgBox" style="height: 200px">
		<textarea id="msg" name="msg" rows="" cols="" style="width:100%;height:99%;border:none">
		</textarea>
	</div>
</div>

</body>
</html>