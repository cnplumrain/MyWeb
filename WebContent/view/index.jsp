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
		////////////////计算年龄
		var age = <%=Calendar.getInstance().get(Calendar.YEAR)-1989%>; 
		$("#age").html(age);
		///////////////////时钟
		var canvas=$("#cvs");
		var context = canvas.get(0).getContext("2d");
		var r=150;
		draw();
		function draw(){
			context.save();
			context.translate(r,r);
			var deg=Math.PI*2/12;
			//表盘		
			context.save();    
			context.beginPath();    
			for(var i=0;i<13;i++){
			var x=Math.sin(i*deg);
			var y=-Math.cos(i*deg);
			context.lineTo(x*r,y*r);    
			}
			//context.arc(0,0,r,0,Math.PI*2,false);
			var c=context.createRadialGradient(0,0,0,0,0,130);
			c.addColorStop(0,"#22f");
			c.addColorStop(1,"#0ef")
			context.fillStyle=c;
			context.fill();
			context.closePath();    
			context.restore(); 
			//数字
			context.save();
			context.beginPath();
			for(var i=1;i<13;i++){
			var x=Math.sin(i*deg);
			var y=-Math.cos(i*deg);
			context.fillStyle="#fff";
			context.font="bold 20px Calibri";
			context.textAlign='center';
			context.textBaseline='middle';
			context.fillText(i,x*5*r/7,y*5*r/7);    
			}
			context.closePath();    
			context.restore();    
			//大刻度
			context.save();
			context.beginPath();    
			for(var i=0;i<12;i++){
			var x2=Math.sin(i*deg);
			var y2=-Math.cos(i*deg);
			context.moveTo(x2*(r-2),y2*(r-2));
			context.lineTo(x2*(r-15),y2*(r-15));    
			}    
			context.strokeStyle='#fff';
			context.lineWidth=4;
			context.stroke();
			context.closePath();
			context.restore();    
			//小刻度
			context.save();
			var deg1=2*Math.PI/60;
			context.beginPath();    
			for(var i=0;i<60;i++){
			var x2=Math.sin(i*deg1);
			var y2=-Math.cos(i*deg1);
			context.moveTo(x2*(r-4),y2*(r-4));
			context.lineTo(x2*(r-10),y2*(r-10));    
			}    
			context.strokeStyle='#fff';
			context.lineWidth=2;
			context.stroke();
			context.closePath();    
			context.restore();    
			//文字
			context.save();
			context.strokeStyle="#fff";
			context.font='20px sans-serif';
			context.textAlign='center';
			context.textBaseline='middle';
			context.strokeText('Clock',0,4*r/7);    
			context.restore();    
			//new Date
			
			var time=new Date();
			var h=(time.getHours()%12)*2*Math.PI/12;
			var m=time.getMinutes()*2*Math.PI/60;
			var s=time.getSeconds()*2*Math.PI/60;

			//时针
			context.save();
			context.rotate( h + m/12 + s/720) ;
			context.beginPath();
			context.moveTo(0,6);
			context.lineTo(0,-4*r/7);
			context.strokeStyle="#fff";
			context.lineWidth=6;
			context.stroke();
			context.closePath();
			context.restore();
			//分针
			context.save();
			context.rotate( m+s/60 ) ;
			context.beginPath();
			context.moveTo(0,8);
			context.lineTo(0,-5*r/7);
			context.strokeStyle="#fff";
			context.lineWidth=4;
			context.stroke();
			context.closePath();
			context.restore();
			//秒针
			context.save();
			context.rotate( s ) ;
			context.beginPath();
			context.moveTo(0,10);
			context.lineTo(0,-6*r/7);
			context.strokeStyle="#fff";
			context.lineWidth=2;
			context.stroke();
			context.closePath();
			context.restore();    
			context.restore();/////////////////////////////栈出
			
			setTimeout(draw, 1000);/////////////////////////////计时器
	
		}
		
		$(window).mousemove(function(e){
			if(e.screenX<=1){
				//$("#cvs").hide();
				$('#menuFrame').attr("width","200px");
				$('#menuFrame').attr("class","trans");
			}
			if(e.screenX>200){
				//$("#cvs").show();
				$('#menuFrame').attr("width","0px");
				$('#menuFrame').attr("class","trans");
			}
		});
		
		
		
	});
	
</script>
</head>
<body class="background" background="../img/sky.jpg" style="color:#ffd700 ;filter:alpha(opacity=20);">
	<iframe scrolling="no" id="menuFrame" src="menu.jsp"  style="border:none;float:left;margin:0;position:relative;"></iframe>
	<canvas id="cvs"   width="300px" height="300px"  style="float:left;"></canvas>
	<iframe scrolling="no" id="contentFrame" src="me/resume.jsp"  style="border:none;width:100%;height:100%;margin:0;position:relative;"></iframe>
	
	
</body>
</html>