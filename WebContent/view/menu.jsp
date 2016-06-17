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
.trans{
	-webkit-transition: height 1s ease-in-out 0s;
	-o-transition: height 1s ease-in-out 0s;
	transition: height 1s ease-in-out 0s;
}

</style>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$('li').click(function(e){
			//alert($("#contentFrame",window.parent.document).html());
			//alert($(this).data('src'));
			$("#contentFrame",window.parent.document).attr("src",$(this).data('src'));
			//alert($("#contentFrame").html());
			//$("#contentFrame").load($(this).data('src'));
			e.stopPropagation();    //  阻止事件冒泡

		});
		$("#menu>ul>li").click(function(e){	//取第一层li
			
			$(this).children("ul").children("li").toggle();
			//$(this).children("ul").children("li").attr("class","trans");
			e.stopPropagation();    //  阻止事件冒泡
		});
		
	});
</script>
</head>
<body>
	<nav id="menu">
		<ul>
			<li data-src="three/clock.html"><a href="javascript:void(0)">首页</a></li>
			<li data-src="three/clock.html"><a href="javascript:void(0)">文章</a>
				<ul>
					<li data-src="article/index.html"><a href="javascript:void(0)">开心一刻</a></li>
					<li><a href="javascript:void(0)">二级</a></li>
				</ul>
			</li>
			<li data-src="audio/audio.html"><a href="javascript:void(0)">音乐</a></li>
			<li data-src="me/resume.jsp"><a href="javascript:void(0)">关于我</a></li>
		</ul>
	</nav>
</body>
</html>