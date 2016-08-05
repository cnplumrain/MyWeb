<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<!-- 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet"type="text/css" href="../css/main.css"/>
<title>Insert title here</title>
<style type="text/css">
	.background{
		background-repeat: no-repeat;
		background-size:cover;
	}
	
	.trans{
	
		-webkit-transition: width 0.5s ease-in-out 0s;
		-o-transition: width 0.5s ease-in-out 0s;
		transition: width 0.5s ease-in-out 0s;
	}
	
	
</style>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/three.js"></script>
<script type="text/javascript" src="../js/ocean.js"></script>
<script type="text/javascript">
	$(document).ready(function(){	
		function init(){
			$('body').attr("height",$(window).height());
			$("#menuFrame").attr("width","0");
			$("#menuFrame").attr("height",$(window).height());
			$("#contentFrame").attr("width",$(window).width());
			$("#contentFrame").attr("height",$(window).height());
		}
		init();
		$(window).resize(function(){
			init();
		});
		function showMenu(){
			$("#menuFrame").attr("width","200");
			$("#menuFrame").attr("class","trans");
			$("#contentFrame").attr("width",$(document.body).width()-200);
			$("#contentFrame").attr("class","trans");
		}
		function hideMenu(){
			$("#menuFrame").attr("width","0");
			$("#menuFrame").attr("class","trans");
			$("#contentFrame").attr("width",$(document.body).width());
			$("#contentFrame").attr("class","trans");
		}
		if(IsPc()){
			$(window).mousemove(function(e){
				if(e.screenX<=2 && e.screenY<=200){		
					showMenu();
					var link = $("#menuFrame").contents().find("head").append("<link>").children(":last");;
					link.attr(
					{	rel: "stylesheet",
				    	type: "text/css",
				        href: "../css/main.css"
				    });
				}
			});
			$("#menuFrame").mouseout(function(){
				hideMenu();
			});	
		}else{
			$("#menuBt").show();
			var isShow=false;
			$("#menuBt").click(function(){
				if(isShow){
					hideMenu();
					isShow=false;
				}else{
					showMenu();
					isShow=true;
					var link = $("#menuFrame").contents().find("head").append("<link>").children(":last");;
					link.attr(
					{	rel: "stylesheet",
				    	type: "text/css",
				        href: "../css/phonemain.css"
				    });
				}	
			});
		}
	});
	
</script>
</head>
<body class="background" background="../img/sky.jpg"  style="color:#ffd700;">
	<div  style="white-space: nowrap;">
	<button id="menuBt" style="display:none;float:left;">菜单</button>
	<div style="float: right;">${sessionScope.displayName}</div>
	<iframe scrolling="no" id="menuFrame" src="menu.jsp"  style="border:0;margin:0;"></iframe>
	<iframe scrolling="no" id="contentFrame" name="contentFrame" src="three/clock.html"  style="border:0;margin:0;"></iframe>
	</div>
</body>
</html>