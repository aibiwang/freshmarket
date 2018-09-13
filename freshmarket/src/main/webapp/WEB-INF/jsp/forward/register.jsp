<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-注册</title>
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/register.js"></script>

<script type="text/javascript">

$(function(){
	var flag=true;
});
function checkName(){/* 检验用户名是否存在 */
	 var username = document.getElementById('user_name').value;
	$.post("checkName.do?username="+username,null,function(data){
		document.getElementById("checkName").innerText=data;
		if(data=='username is exist!!!'){
			flag=false;
		}else{
			flag=true;
		}
	});
}

function check_phone() {
	var re = /^1[3|4|5|7|8|9][0-9]\d{8}$/;
	if (re.test($('#phone').val())) {
	} else {
		alert('你输入的手机格式不正确')
	}
}

function check(){
	
		var pass = $('#pwd').val();
		var cpass = $('#cpwd').val();
		if(flag==false){
			alert('用户名不可用!!!');
			return false;
		}
		if(pass!=cpass)
		{
			$('#cpwd').next().html('两次输入的密码不一致')
			$('#cpwd').next().show();
			alert('两次输入的密码不一致');
			return false;
		}
		else
		{
			$('#cpwd').next().hide();
			return true;
		}		
}
</script>
</head>
<body>
	<div class="register_con">
		<div class="l_con fl">
			<a class="reg_logo"><img src="images/logo02.png"></a>
			<div class="reg_slogan">足不出户 · 新鲜每一天</div>
			<div class="reg_banner"></div>
		</div>

		<div class="r_con fr">
			<div class="reg_title clearfix">
				<h1>用户注册</h1>
				<a href="login">登录</a>
			</div>
			<div class="reg_form clearfix">
				<form action="register.do" method="post" onsubmit="return check()">
					<ul>
						<li>
							<label>用户名:</label> 
							<input type="text" name="username"
							id="user_name" onblur="checkName()" /> <span id="checkName"
							class="error_tip">提示信息</span>
						</li>
						<li>
							<label>手机号码:</label> 
							<input type="text" name="phone"
							id="phone" onblur="check_phone()"> 
							<span class="error_tip">提示信息</span>
						</li>
						<li>
							<label>密码:</label> 
							<input type="password" name="pwd"
							id="pwd"> 
							<span class="error_tip">提示信息</span>
						</li>
						<li>
							<label>确认密码:</label> 
							<input type="password" name="cpwd"
							id="cpwd"> 
							<span class="error_tip">提示信息</span>
						</li>
						<li class="agreement">
							<input type="checkbox" name="allow"
							id="allow" checked="checked"> 
							<label>同意”天天生鲜用户使用协议“</label>
							<span class="error_tip2">提示信息</span>
						</li>
						<li class="reg_sub"><input type="submit" value="注 册" name=""></li>
					</ul>
				</form>
			</div>

		</div>

	</div>
	<div class="footer">
		<div class="foot_link">
			<a href="#">关于我们</a> <span>|</span> <a href="#">联系我们</a> <span>|</span>
			<a href="#">招聘人才</a> <span>|</span> <a href="#">友情链接</a>
		</div>
		<p>CopyRight © 2016 北京天天生鲜信息技术有限公司 All Rights Reserved</p>
		<p>电话：010-****888 京ICP备*******8号</p>
	</div>

</body>
</html>