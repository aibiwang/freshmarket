<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>天天生鲜-登录</title>
	<link rel="stylesheet" type="text/css" href="css/reset.css" />
	<link rel="stylesheet" type="text/css" href="css/main.css" />
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
					<h1>用户登录</h1>
					<a href="register">立即注册</a>
				</div>
				<div class="form_input">
					<form action="login.do" method="post">
						<input type="text" name="username" class="name_input"
							placeholder="请输入用户名"> <span style="color: red;">${param.msg }</span>
						<input type="password" name="pwd" class="pass_input"
							placeholder="请输入密码">
						<div class="pwd_error">输入错误</div>
						<div class="more_input clearfix">
							<input type="checkbox" name=""> <label>记住用户名</label> <a
								href="finduserpwd">忘记密码</a>
						</div>
						<input type="submit" name="" value="登录" class="input_submit">
					</form>
				</div>
			</div>
		</div>
	</div>

<!-- 脚部 -->
<%@ include file="footer.jsp"%>