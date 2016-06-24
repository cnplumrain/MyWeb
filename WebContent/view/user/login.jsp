<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>  
<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Insert title here</title>
        <style type="text/css">
        	input{height: 25px;width: 200px;margin-top: 10px;}
        </style>  
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript">
        	function changeCode(){
        		document.getElementById("verification").src = 
        			document.getElementById("verification").src
    				+ "?nocache=" + new Date().getTime();
        	}
        	function userCheck(dom){
        		var username=$(dom).val();
        		 $.ajax({ 
        			   type:"POST", 
        			   url:"isUserExist", 
        			   data:{
        				   username:username
        			   }, 
        			   //dataType: "json",//此处要设置成json 
        			   success: function(result){
        				   if(result=="0"){
        					   $("#msg").html("该用户不存在!");
            				   $("#msg").css("color","red");
        				   }else{
        					   $("#msg").html("");
        				   }
        			   }
        			   
        		 });//回调函数 
        			   
        	}
        </script>
    </head>  
      
    <body>
    	<form method="post">
        <input type="text" name="UserName" placeholder="用户名" value="" onchange="userCheck(this);">
        <label id="msg"></label>
        <br>
        <input type="password" name="Password" placeholder="密码" value=""><br>
        <input type="text" name="VerificationCode" placeholder="验证码">
        <img  id="verification"  src="verification" onclick="changeCode();" style="vertical-align: middle;"><br>
        <button type="submit" style="margin-top: 10px;">登录</button>
        </form>
    </body>  
</html>  