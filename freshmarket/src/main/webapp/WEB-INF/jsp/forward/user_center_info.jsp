<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 头部 -->
<%@ include file="header.jsp"%>
<script type="text/javascript">
	function check_phone() {
		var re = /^1[3|4|5|7|8|9][0-9]\d{8}$/;
		if (re.test($('#phone').val())) {
		} else {
			alert('你输入的手机格式不正确')
		}
	}
	
	function updatePhone() {/* 更新手机号 */
		var phone = document.getElementById('phone').value;
		$.post("updatePhone.do?phone=" + phone, null, function(data) {
			alert(data);
		});
	}

	function updatePwd() {
		var addr = document.getElementById('pwd').value;
		$.post("updatePwd.do?pwd=" + pwd, null, function(data) {
			alert(data);
		});
	}

	function updateAddr() {
		var addr = document.getElementById('addr').value;
		$.post("updateAddr.do?addr=" + addr, null, function(data) {
			alert(data);
		});
	}
</script>
<div class="search_bar clearfix">
	<a href="index.html" class="logo fl"><img
		src="images/logoforward.png"></a>
	<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;用户中心</div>
	<div class="search_con fr">
		<input type="text" class="input_text fl" name="" placeholder="搜索商品">
		<input type="button" class="input_btn fr" name="" value="搜索">
	</div>
</div>

<div class="main_con clearfix">
	<div class="left_menu_con clearfix">
		<h3>用户中心</h3>
		<ul>
			<li><a href="user_center_info" class="active">· 个人信息</a></li>
			<li><a href="find_allorder.do?op=全部订单">· 全部订单</a></li>
			<li><a href="user_center_site">· 收货地址</a></li>
		</ul>
	</div>

	<div  class="right_content clearfix">
		<div id="right_content2" class="info_con clearfix">
			<h3 class="common_title2">
				基本信息&nbsp;&nbsp;&nbsp;&nbsp;
			</h3>
			<ul class="user_info_list">
				<li><span>用户名：</span>
				<input readonly="readonly" type="text" name="username" value="${loginedUser.getUserName()}"/>&nbsp;不可修改
				<li><span>密码：</span>
				<input type="password" id="pwd" name="pwd" value="${loginedUser.getUserPwd()}"/> 
				<button id="update_pwd" onclick="updatePwd()">点击修改</button></li> 
				<li><span>联系方式：</span>
				<input type="text" id="phone" name="phone"value="${loginedUser.getUserPhone()}" onblur="check_phone()">
				<button id="update_phone" onclick="updatePhone()">点击修改</button></li>
				<li><span>联系地址：</span>
				<input type="text" id="addr" name="addr" value="${loginedUser.getUserAddr()}"/> 
				<button id="update_addr" onclick="updateAddr()">点击修改</button></li>
			</ul>
		</div>
		<h3 class="common_title2">最近浏览</h3>
		<div class="has_view_list">
			<ul class="goods_type_list clearfix">
				<li><a href="detail"><img src="images/goods/caomei.jpg"></a>
					<h4>
						<a href="detail">大兴大棚草莓</a>
					</h4>
					<div class="operate">
						<span class="prize">￥16.80</span> <span class="unit">16.80/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div></li>

				<li><a href="#"><img src="images/goods/lizhi.jpg"></a>
					<h4>
						<a href="#">吐鲁番梨光杏</a>
					</h4>
					<div class="operate">
						<span class="prize">￥5.50</span> <span class="unit">5.50/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div></li>

				<li><a href="#"><img src="images/goods/huangtao.jpg"></a>
					<h4>
						<a href="#">黄肉桃</a>
					</h4>
					<div class="operate">
						<span class="prize">￥10.00</span> <span class="unit">10.00/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div></li>

				<li><a href="#"><img src="images/goods/putao.jpg"></a>
					<h4>
						<a href="#">葡萄</a>
					</h4>
					<div class="operate">
						<span class="prize">￥28.80</span> <span class="unit">28.8/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div></li>

				<li><a href="#"><img src="images/goods/lanmei.jpg"></a>
					<h4>
						<a href="#">蓝莓</a>
					</h4>
					<div class="operate">
						<span class="prize">￥6.45</span> <span class="unit">6.45/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div></li>
			</ul>
		</div>
	</div>
</div>

<!-- 脚部 -->
<%@ include file="footer.jsp"%>
