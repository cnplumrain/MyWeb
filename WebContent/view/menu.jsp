<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
#menu
{
width:200px;
position:relative;
}
.start{
	width:200px;
	left:0px;
	top:0px;
}
.animate{
animation:myfirst 2s;
-moz-animation:myfirst 2s; /* Firefox */
-webkit-animation:myfirst 2s; /* Safari and Chrome */
-o-animation:myfirst 2s; /* Opera */
animation-fill-mode:forwards;
}

@keyframes myfirst
{
0%	 {left:0px;top:0px}
100% {left:-200px; top:0px;}
}

@-moz-keyframes myfirst /* Firefox */
{
0%	 {left:0px;top:0px}
100% {left:-200px; top:0px;}
}

@-webkit-keyframes myfirst /* Safari and Chrome */
{
0%	 {left:0px;top:0px}
100% {left:-200px; top:0px;}
}

@-o-keyframes myfirst /* Opera */
{
0%	 {left:0px;top:0px}
100% {left:-200px; top:0px;}
}
</style>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$('li').click(function(){
			//alert($("#contentFrame",window.parent.document).html());
			//alert($(this).data('src'));
			$("#contentFrame",window.parent.document).attr("src",$(this).data('src'));
		});
		
		
	});
</script>
</head>
<body>
	<nav id="menu">
		<ul>
			<li data-src="three/clock.html"><a href="javascript:void(0)">首页</a>
				<ul>
					<li><a href="javascript:void(0)">二级</a></li>
					<li><a href="javascript:void(0)">二级</a></li>
				</ul>
			</li>
			<li><a href="javascript:void(0)">一级</a></li>
			<li data-src="me/resume.jsp"><a href="javascript:void(0)">关于我</a></li>
		</ul>
	</nav>
</body>
</html>