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
			<h1>总满意度</h1>
			<ul>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
			<div class="order-textbox">
				<textarea id="testarea0" placeholder="在此输入商品评价"></textarea>
			</div>
		</div>
		<div class="order-button">
			<a href="#" id="a1" onclick="pingjia(${order.getOrderId()})">发表评论</a>
		</div>
	</div>
<script type="text/javascript">
var num = 0;
$(".order-list-Below ul li").click(function() {
	num = $(this).index() + 1;
	var len = $(this).index();
	var thats = $(this).parent(".order-list-Below ul").find("li");
	if ($(thats).eq(len).attr("class") == "on") {
		if ($(thats).eq(num).attr("class") == "on") {
			$(thats).removeClass();
			for (var i = 0; i < num; i++) {
				$(thats).eq(i).addClass("on");
			}
		} else {
			$(thats).removeClass();
			for (var k = 0; k < len; k++) {
				$(thats).eq(k).addClass("on");
			}
		}
	} else {
		$(thats).removeClass();
		for (var j = 0; j < num; j++) {
			$(thats).eq(j).addClass("on");
		}
	}
});
	function pingjia(orderId){
		var testarea0 = $('#testarea0').val();
		$('#a1').attr("href","updateOrderTag1.do?orderId="+orderId+"&pingjianeirong="+testarea0+"&pingjiamanyidu="+num);
	}
</script>
</body>
</html>