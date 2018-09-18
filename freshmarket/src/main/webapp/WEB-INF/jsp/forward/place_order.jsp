<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 头部 -->
<%@ include file="header.jsp"%>


	<div class="search_bar clearfix">
		<a href="index.html" class="logo fl"><img src="images/logoforward.png"></a>
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;提交订单</div>
		<div class="search_con fr">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品">
			<input type="button" class="input_btn fr" name="" value="搜索">
		</div>		
	</div>
	
	<h3 class="common_title">确认收货地址</h3>

	<div class="common_list_con clearfix">
		<dl>
			<dt>寄送到：</dt>
			<dd><input type="radio" name="" checked="">${receiverAddr }<span>&nbsp;&nbsp;收货人：${receiverName }</span></dd>
		</dl>
		<!-- <a href="user_center_site.html" class="edit_site">编辑收货地址</a> -->

	</div>
	
	<h3 class="common_title">支付方式</h3>	
	<div class="common_list_con clearfix">
		<div class="pay_style_con clearfix">
			<input type="radio" name="pay_style" checked>
			<label class="cash">货到付款</label>
			<input type="radio" name="pay_style">
			<label class="weixin">微信支付</label>
			<input type="radio" name="pay_style">
			<label class="zhifubao"></label>
			<input type="radio" name="pay_style">
			<label class="bank">银行卡支付</label>
		</div>
	</div>

	<h3 class="common_title">商品列表</h3>
	
	<div class="common_list_con clearfix">
		<ul class="goods_list_th clearfix">
			<li class="col01">商品名称</li>
			<li class="col02">商品单位</li>
			<li class="col03">商品价格</li>
			<li class="col04">数量</li>
			<li class="col05">小计</li>		
		</ul>
		<ul class="goods_list_td clearfix">
			<li class="col01">*</li>			
			<li class="col02"><img src="${goodsPic }"></li>
			<li class="col03">${goodsName}</li>
			<li class="col04">Kg</li>
			<li class="col05">${siglePrice }Kg/元</li>
			<li class="col06">${goodsNum }</li>
			
			<li class="col07">${totalMoney}元</li>	
		</ul>
	
	</div>

	<h3 class="common_title">总金额结算</h3>

	<div class="common_list_con clearfix">
		<div class="settle_con">
			<div class="total_goods_count">共<em>1</em>件商品，总金额<b>${totalMoney}元</b></div>
			<div class="transit">运费：<b>8元</b></div>
			<div class="total_pay">实付款：<b>${totalMoney+8}元</b></div>
		</div>
	</div>

	<div class="order_submit clearfix">
		<a href="javascript:payCheck(${orderId})" id="order_btn">确认支付</a>
		<a href="find_allorder.do?op=待支付" id="order_btn">暂不支付</a>
	</div>	

	<div class="popup_con">
		<div class="popup">
			<p>提交成功！</p>
		</div>
		
		<div class="mask"></div>
	</div>
	<script type="text/javascript" src="js/jquery-1.12.2.js"></script>
	<script type="text/javascript">
	
	function payCheck(orderId){
		
			localStorage.setItem('order_finish',2);

			$('.popup_con').fadeIn('fast', function() {

				setTimeout(function(){
					$('.popup_con').fadeOut('fast',function(){
						window.location.href = 'payCheck.do?orderId='+orderId;
					});	
				},3000)
				
			});
		
		
	}
	</script>



<!-- 脚部 -->
<%@ include file="footer.jsp"%>