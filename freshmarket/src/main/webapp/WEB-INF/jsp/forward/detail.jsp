<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 头部 -->
<%@ include file="header.jsp"%>


<div class="search_bar clearfix">
	<a href="index.html" class="logo fl"><img
		src="images/logoforward.png"></a>
	<div class="search_con fl">
		<input type="text" class="input_text fl" name="" placeholder="搜索商品">
		<input type="button" class="input_btn fr" name="" value="搜索">
	</div>
	<div class="guest_cart fr">
		<input type="button" onclick="myCart()" class="cart_name fl"
			value="我的购物车">
	</div>
</div>

<div class="navbar_con">
	<div class="navbar clearfix">
		<div class="subnav_con fl">
			<h1>全部商品分类</h1>
			<span></span>
			<ul class="subnav">
				<li><a href="#" class="fruit">新鲜水果</a></li>
				<li><a href="#" class="seafood">海鲜水产</a></li>
				<li><a href="#" class="meet">猪牛羊肉</a></li>
				<li><a href="#" class="egg">禽类蛋品</a></li>
				<li><a href="#" class="vegetables">新鲜蔬菜</a></li>
				<li><a href="#" class="ice">速冻食品</a></li>
			</ul>
		</div>
		<ul class="navlist fl">
			<li><a href="index">首页</a></li>
			<li class="interval">|</li>
			<li><a href="">手机生鲜</a></li>
			<li class="interval">|</li>
			<li><a href="">抽奖</a></li>
		</ul>
	</div>
</div>

<div class="breadcrumb">
	<a href="#">全部分类</a> <span>></span> <a href="#">新鲜水果</a> <span>></span>
	<a href="#">商品详情</a>
</div>

<div class="goods_detail_con clearfix">
	<div class="goods_detail_pic fl">
		<img height="300px" width="300px" src="${DetailGoods.goodsPic }">
	</div>

	<div class="goods_detail_list fr">
		<h3>${DetailGoods.goodsName }</h3>
		<p>${DetailGoods.goodsDesc }</p>
		<div class="prize_bar">
			<span class="show_pirze">¥<em>${DetailGoods.saleprice }</em></span> <span
				class="show_unit">单 位：Kg</span>
		</div>
		<!-- 	<div class="goods_num clearfix">
				<div class="num_name fl">数 量：</div>
				<div class="num_add fl">
					<input type="text" class="num_show fl" value="1">
					<a href="javascript:;" class="add fr">+</a>
					<a href="javascript:;" class="minus fr">-</a>	
				</div> 
			</div>
			<div class="total">总价：<em>16.80元</em></div> -->
		<div class="operate_btn">
			<a href="buy.do?goodsId=${DetailGoods.goodsId}"
				onclick="script:if(${loginedUser==null}){alert('请先登录')}"
				class="buy_btn">立即购买</a> <a
				href="javascript:addCart(${DetailGoods.goodsId})" class="add_cart"
				id="add_cart">加入购物车</a>
		</div>
	</div>
</div>

<div class="main_wrap clearfix">
	<!-- 	<div class="l_wrap fl clearfix">
			<div class="new_goods">
				<h3>新品推荐</h3>
				<ul>
					<li>
						<a href="#"><img src="images/goods/goods001.jpg"></a>
						<h4><a href="#">进口柠檬</a></h4>
						<div class="prize">￥3.90</div>
					</li>
					<li>
						<a href="#"><img src="images/goods/goods002.jpg"></a>
						<h4><a href="#">玫瑰香葡萄</a></h4>
						<div class="prize">￥16.80</div>
					</li>
				</ul>
			</div>
		</div> -->

	<div class="main_wrap clearfix">
		<ul class="detail_tab clearfix">
			<li class="active">商品评价</li>
		</ul>

		<div class="tab_content">

			<table style="width: 1000px">

				<tr align="center" height="30px" >
					<td>评价人</td>
					<td>内容</td>
					<td>满意度</td>
					<td>评价日期</td>
				</tr>

				<c:forEach items="${opinionList }" var="opinion">
					<tr align="center" height="30px">

						<td>${opinion.userName }</td>
						<td>${opinion.content }</td>
						<td>${opinion.satisfy }</td>
						<td>${opinion.date }</td>

					</tr>

				</c:forEach>

			</table>

		</div>
	</div>
</div>

<script type="text/javascript">

function addCart(goodsId){
	
	$.post("addToCart.do?goodsId="+goodsId,function(data){
		
		alert(data);
	});
	
}
	function myCart(){
		$.post("myCart.do",function(data){
			if(data=='请先登录'){
			alert(data);
			}else{
			window.location.href ='myCart.do';
			}
		});
	}
	


</script>


<!-- 脚部 -->
<%@ include file="footer.jsp"%>
