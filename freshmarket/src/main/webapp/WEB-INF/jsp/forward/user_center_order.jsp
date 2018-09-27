<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 头部 -->
<%@ include file="header.jsp"%>
<script type="text/javascript">
	/* 确认收货 */
	function Conf(orderId) {
		var value = document.getElementById("conf_"+orderId).innerText;
		if('确认收货'==value){
			if (confirm("是否已收到货？")) {
				ConfofRej(orderId);
			} else {
				$("conf_"+orderId).attr("href", "#");//确认收货的按钮
			}
		}else if('去评价'==value){
			ConfofRej1(orderId);//评价
		}
	}
	
	function ConfofRej(orderId) {/* 确认收货，修改订单状态 */
		$.post("updateOrderTag.do?tag=待评价&orderId=" + orderId, null, function(data) {
			if (data == '订单状态出现异常！！！') {
				alert(data);
			} else {
				document.getElementById("chakanwuliu_"+orderId).innerText = null;//隐藏查看物流
				document.getElementById("tag_"+orderId).innerText = '待评价';//订单栏状态修改  
				document.getElementById("tag1_"+orderId).innerText = '待评价';//状态修改  
				document.getElementById("conf_"+orderId).innerText = data;//确认收货的
				document.getElementById("daipingjia").innerText = 1+parseInt(document.getElementById("daipingjia").innerText);//待评价数量加1
				document.getElementById("daishouhuo").innerText = parseInt(document.getElementById("daishouhuo").innerText)-1;
			}
		});
	}
	
	/* 1.评价订单 */
	function Conf1(orderId) {
		var value = document.getElementById("confA_"+orderId).innerText;
		if('去评价'==value){
			//if (confirm("是否评价订单？")) {
				ConfofRej1(orderId);
			/* } else {
				$("confA_"+orderId).attr("href", "#");//去评价的按钮
			} */
		}
	}
	
	function ConfofRej1(orderId) {
		$.post("selectPingjia.do?op=0&orderId=" + orderId, null, function(data) {
			window.location.href="pingjia";
		});
	}
	
	/* 2.支付订单 */
	function Conf2(orderId) {
		var value = document.getElementById("confB_"+orderId).innerText;
		if('付款'==value){
			if (confirm("确认付款？")) {
				ConfofRej2(orderId);
			} else {
				$("confB_"+orderId).attr("href", "#");//确认收货的按钮
			}
		}
	}
	
	function ConfofRej2(orderId) {
		$.post("updateOrderTag.do?tag=待发货&orderId=" + orderId, null, function(data) {
			if (data == '订单状态出现异常！！！') {
				alert(data);
			} else {
				window.location.href="find_allorder.do?op=待发货"
				document.getElementById("chakanwuliu_"+orderId).innerText = null;//隐藏查看物流
				document.getElementById("tag_"+orderId).innerText = '待评价';//订单栏状态修改  
				document.getElementById("tag1_"+orderId).innerText = '待评价';//状态修改  
				document.getElementById("conf_"+orderId).innerText = data;//确认收货的
				document.getElementById("daipingjia").innerText = 1+parseInt(document.getElementById("daipingjia").innerText);//待评价数量加1
				document.getElementById("daishouhuo").innerText = parseInt(document.getElementById("daishouhuo").innerText)-1;
			}
		});
	}
	
	/* 3.提醒商家发货 */
	function Conf3(orderId) {
		var value = document.getElementById("confC_"+orderId).innerText;
		if('提醒发货'==value){
			alert('提醒发货成功!')
			$("confC_"+orderId).attr("href", "#");//确认收货的按钮
		}
	}
	
	/* 4.查看评价详情 */
	function Conf4(orderId) {
		var value = document.getElementById("confD_"+orderId).innerText;
		if('查看评价'==value){
			ConfofRej4(orderId);
		}
	}
	
	function ConfofRej4(orderId) {
		$.post("selectPingjia.do?op=1&orderId=" + orderId, null, function(data) {
			window.location.href="pingjia_xiangqing";					
		});
	}
</script>
<div class="search_bar clearfix">
	<a href="index.html" class="logo fl"><img
		src="images/logoforward.png"></a>
	<div class="sub_page_name fl">
		|&nbsp;&nbsp;&nbsp;&nbsp;<a href="find_allorder.do?op=全部订单">全部订单<span
			style="color: red;">&nbsp;&nbsp;${ordercount}</span></a>
	</div>
	<div class="sub_page_name fl">
		|&nbsp;&nbsp;&nbsp;&nbsp;<a href="find_allorder.do?op=待支付">待支付<span
			style="color: red;" id="daizhifu">&nbsp;&nbsp;${waitpaycount}</span></a>
	</div>
	<div class="sub_page_name fl">
		|&nbsp;&nbsp;&nbsp;&nbsp;<a href="find_allorder.do?op=待发货">待发货<span
			style="color: red;" id="daifahuo">&nbsp;&nbsp;${waitfahuocount}</span></a>
	</div>
	<div class="sub_page_name fl">
		|&nbsp;&nbsp;&nbsp;&nbsp;<a href="find_allorder.do?op=已发货">待收货 <span
			style="color: red;" id="daishouhuo">&nbsp;&nbsp;${waitshouhuo}</span></a>
	</div>
	<div class="sub_page_name fl">
		|&nbsp;&nbsp;&nbsp;&nbsp;<a href="find_allorder.do?op=待评价">待评价<span
			style="color: red;" id="daipingjia">&nbsp;&nbsp;${waitdaipingjia}</span></a>
	</div>
	<div class="sub_page_name fl">
		|&nbsp;&nbsp;&nbsp;&nbsp;<a href="find_allorder.do?op=已评价">已评价<span
			style="color: red;" id="yipingjia">&nbsp;&nbsp;${yipingjia}</span></a>
	</div>
</div>

<div class="main_con clearfix">
	<div class="left_menu_con clearfix">
		<h3>用户中心</h3>
		<ul>
			<li><a href="user_center_info">· 个人信息</a></li>
			<li><a href="user_center_order" class="active">· 全部订单</a></li>
			<li><a href="user_center_site">· 收货地址</a></li>
		</ul>
	</div>
	<div class="right_content clearfix">
		<c:forEach items="${orders}" var="order">
			<ul class="order_list_th w978 clearfix">
				<li class="col01">${order.getOrderDate()}</li>
				<li class="col02">订单号：${order.getOrderId()}</li>
				<li class="col02 stress" id="tag_${order.getOrderId()}">${order.getTag()}</li>
			</ul>
			<table class="order_list_table w980">
				<tbody>
					<tr>
						<td width="55%"><c:forEach items="${order.getItems()}"
								var="f">
								<ul class="order_goods_list clearfix">
									<li class="col01"><img
										src="${goodsDetail[f].getGoodsPic()}"></li>
									<li class="col02">${goodsDetail[f].getGoodsDesc()}<em>${goodsDetail[f].getSaleprice()}元/500g</em>
									</li>
									<li class="col03">${f.getGoodscount()}</li>
									<li class="col04">${f.getGoodscount()* goodsDetail[f].getSaleprice()}元</li>
								</ul>
							</c:forEach></td>
						<td width="15%">${order.getOrderTotalprice()}元</td>
						<td width="15%" id="tag1_${order.getOrderId()}">${order.getTag()}</td>
						<c:if test="${order.getTag()=='待支付'}">
							<td width="15%"><a id="confB_${order.getOrderId()}" href="#"
								class="oper_btn" onclick="Conf2(${order.getOrderId()})">付款</a></td>
						</c:if>
						<c:if test="${order.getTag()=='待发货'}">
							<td width="15%"><a id="confC_${order.getOrderId()}" href="#"
								class="oper_btn" onclick="Conf3(${order.getOrderId()})">提醒发货</a></td>
						</c:if>
						<c:if test="${order.getTag()=='已发货'}">
							<td width="15%"><a id="conf_${order.getOrderId()}" href="#"
								class="oper_btn" onclick="Conf(${order.getOrderId()})">确认收货</a><br>
								<a href="logistics" id="chakanwuliu_${order.getOrderId()}">查看物流</a></td>
						</c:if>
						<c:if test="${order.getTag()=='待评价'}">
							<td width="15%"><a id="confA_${order.getOrderId()}" href="#"
								class="oper_btn" onclick="Conf1(${order.getOrderId()})">去评价</a></td>
						</c:if>
						<c:if test="${order.getTag()=='已评价'}">
							<td width="15%"><a id="confD_${order.getOrderId()}" href="#"
								class="oper_btn" onclick="Conf4(${order.getOrderId()})">查看评价</a></td>
						</c:if>
					</tr>
				</tbody>
			</table>
		</c:forEach>

		<div class="pagenation">
			<a href="#">上一页</a> <a href="#" class="active">1</a> <a href="#">2</a>
			<a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">下一页</a>
		</div>
	</div>
</div>

<!-- 脚部 -->
<%@ include file="footer.jsp"%>