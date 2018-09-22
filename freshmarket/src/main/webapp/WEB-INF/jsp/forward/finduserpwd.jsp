<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>天天生鲜-修改密码</title>
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<style type="text/css">
.inputmsg {
	width: 306px;
	height: 36px;
	border: 1px solid #e0e0e0;
	outline: none;
	font-size: 14px;
	text-indent: 10px;
	margin-top: 15px;
}
</style>


</head>
<body>
	<div class="login_top clearfix">
		<a href="index.html" class="login_logo"><img src="images/logo02.png"></a>	
	</div>

	<div class="login_form_bg">
		<div class="login_form_wrap clearfix">
			<div class="login_banner fl"></div>
			<div class="slogan fl">日夜兼程 · 急速送达</div>
			
			<div class="login_form fr">
				<div class="login_title clearfix">
					<h1>找回密码</h1>
					<a href="login">返回登录</a>
				</div>
				<span style="color: red;width: 306px;height: 15px;margin-left:150px; text-align: center;" id="msg"></span>
				<div class="form_input">
					<form action="updatePwd.do" method="post" onsubmit="return check()">
						<input style="float:left;width:222px;margin-top: 5px;" type="text" name="phone" class="inputmsg" id="btn1" 
							placeholder="请输入手机号"> 
						<input style="height: 36px;margin-top:6px;margin-left:4px;" type="button" value="发送验证码" onclick="checkNum1(this)"/>
						<input type="text" name="checkNum" class="inputmsg" id="btn" 
							placeholder="请输入验证码"> 
						<input type="password" name="pwd" class="inputmsg" id="pwd"
							placeholder="请输入密码"> 
						<input type="password" name="cpwd" class="inputmsg" id="cpwd"
							placeholder="请确认密码" onblur="check_cpwd()">
						<input style="margin-top:35px;" type="submit" name="" value="确认修改" class="input_submit">
					</form>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
var flag=true;
var countdown = 30;
function setTime(val) {
	if (countdown == 0) {
		val.removeAttribute("disabled");
		val.value = "发送验证码";
		countdown = 30;
		return;
	} else {
		val.setAttribute("disabled", true);
		val.value = "重新发送(" + countdown + ")";
		countdown--;
	}
	setTimeout(function() {
		setTime(val)
	}, 1000)
}

 function checkNum1(val){  /* 发送验证码 */
	 setTime(val);
	 var phone = $('#btn1').val();
	$.post("checkNum.do?phone="+phone,null,function(data){
		if(data=='手机号不能为空!!!'||data=='当前号码未注册，请先注册'){
			$('#msg').text(data);
			flag=false;
		}else{
			flag=true;
		}
	});
}
 
 function check_cpwd(){
		var pass = $('#pwd').val();
		var cpass = $('#cpwd').val();

		if(pass!=cpass)
		{
			$('#msg').html('两次输入的密码不一致')
			flag=false;
		}
		else
		{
			$('#msg').html('')
			flag=true;
		}		
		
	}

 function check(){
	 return flag;
 }
</script>
<!-- 脚部 -->
<%@ include file="footer.jsp"%>