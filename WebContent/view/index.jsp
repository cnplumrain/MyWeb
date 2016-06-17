<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
	.background{
		background-repeat: no-repeat;
		background-size:cover;
	}
	
	.trans{
	
		-webkit-transition: width 1s ease-in-out 0s;
		-o-transition: width 1s ease-in-out 0s;
		transition: width 1s ease-in-out 0s;
	}
	
	
</style>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/three.js"></script>
<script type="text/javascript">
	$(document).ready(function(){

		$("#menuFrame").attr("width","0");
		$("#menuFrame").attr("height",$("#contentFrame").height());
		$("#contentFrame").attr("width",$(document.body).width());
		$(window).mousemove(function(e){
			if(e.screenX<=2){		
				$("#menuFrame").attr("width","200");
				$("#menuFrame").attr("class","trans");
				$("#contentFrame").attr("width",$(document.body).width()-200);
				$("#contentFrame").attr("class","trans");
			}
		});
		$("#menuFrame").mouseout(function(){
			$("#menuFrame").attr("width","0");
			$("#menuFrame").attr("class","trans");
			$("#contentFrame").attr("width",$(document.body).width());
			$("#contentFrame").attr("class","trans");
		});	
	});
	
</script>
</head>
<body class="background" background="../img/sky.jpg" style="color:#ffd700 ;">
	<div  style="white-space: nowrap;">
	
	<iframe scrolling="no" id="menuFrame" src="menu.jsp"  style="border:0;margin:0;"></iframe>
	<iframe scrolling="no" id="contentFrame" src="three/clock.html"  style="border:0;height:1000px;margin:0;"></iframe>
	

	</div>
</body>
</html>