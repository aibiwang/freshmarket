<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜</title>
	<link rel="stylesheet" type="text/css" href="css/reset.css" />
	<link rel="stylesheet" type="text/css" href="css/main.css" />
	<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<link href="css/page.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="js/page.js"></script>
	<script type="text/javascript">
		function loginedOut(){
			<%if (session.getAttribute("loginedUser") == null) {%>
				alert("您尚未登陆,请先登录");
				$('#out').attr("href","#");
			<%}else{%>
				if (confirm("你确定退出登录吗？")) { 
					$('#out').attr("href","loginout.do");
			    }else { 
			    	$('#out').attr("href","#");
			    } 
			<%}%>
			 
		}
	</script>
</head>
<body>
	<div class="header_con">
		<div class="header">
			<div class="welcome fl">欢迎来到天天生鲜!</div>
			<div class="fr">
				<c:if test="${loginedUser!=null }">
				<div class="login_info1 fl" style="line-height: 29px;">
					欢迎：<span style="color:green;font-weight:bold;">${loginedUser.getUserName()}</span>&nbsp;大驾光临&nbsp;&nbsp;
				</div>
				</c:if>
				<div class="login_btn fl">
					<span>|</span>
					<a href="index">首页</a>
					<span>|</span>
					<a href="login">登录</a>
					<span>|</span>
					<a href="register">注册</a>
				</div>
				<c:if test="${loginedUser!=null }">
				<div class="user_link fl">
					<span>|</span>
					<a href="user_center_info">用户中心</a>
					<span>|</span>
					<a href="myCart.do">我的购物车</a>
					<span>|</span>
					<a href="find_allorder.do?op=全部订单">我的订单</a>
					<span>|</span>
					<a href="#" id="out" onclick="loginedOut()">退出</a>
				</div>
				</c:if>
			</div>
		</div>		
	</div>

