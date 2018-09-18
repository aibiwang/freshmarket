<%@ page language="java" contentType="text/html charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<!--允许全屏-->
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="yes" name="apple-touch-fullscreen" />
<meta content="telephone=no,email=no" name="format-detection" />
<meta name="viewport"
	content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" />
<title>demo</title>
<link href="/css/EvaluationOrder.debug.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="/js/jquery1.js"></script>

</head>
<body>

	<div class="order-list">
		<h1 class="order-list-Below"
			style="font-family: myFirstFont; color: #333; line-height: 20px;">
			<span>订单号：${order.getOrderId()}</span>&nbsp;&nbsp;&nbsp;&nbsp; <span>总价格：￥${order.getOrderTotalprice()}</span>&nbsp;&nbsp;&nbsp;
			<span>下单时间：${order.getOrderDate()}</span>&nbsp;&nbsp;&nbsp;
		</h1>
		<c:forEach items="${order.getItems()}" var="f">
			<div class="order-list-top">
				<p class="order-list-top-img">
					<img src="${goodsDetail[f].getGoodsPic()}" />
				</p>
				<div class="order-list-top-info">
					<h1>${goodsDetail[f].getGoodsDesc()}</h1>
					<h2>
						<span>${goodsDetail[f].getSaleprice()}元/500g</span>&nbsp;&nbsp;${f.getGoodscount()}kg
						<span>共 ￥</span>${f.getGoodscount()* goodsDetail[f].getSaleprice()}
					</h2>
				</div>
			</div>
		</c:forEach>
		<div class="order-list-Below">
			<h1>我的满意度：</h1>
			<c:if test="${order.getOrderPingjiamanyidu()==1}">
				<h1>20%</h1>
			</c:if>
			<c:if test="${order.getOrderPingjiamanyidu()==2}
			">
				<h1>40%</h1>
			</c:if>
			<c:if test="${order.getOrderPingjiamanyidu()==3}">
				<h1>60%</h1>
			</c:if>
			<c:if test="${order.getOrderPingjiamanyidu()==4}">
				<h1>80%</h1>
			</c:if>
			<c:if test="${order.getOrderPingjiamanyidu()==5}">
				<h1>100%</h1>
			</c:if>
			<div class="order-textbox">
				<textarea id="testarea0" readonly="readonly">我的评价内容：${order.getOrderPingjianeirong()}</textarea>
				<h1 style="float:right;">评价时间：${order.getOrderPingjiashijian()}</h1>
			</div>
		</div>
		<div class="order-button">
			<a href="find_allorder.do?op=全部订单"><span>返回我的订单</span></a>
		</div>
	</div>
</body>
</html>