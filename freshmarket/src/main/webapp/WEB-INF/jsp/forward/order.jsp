<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>确认订单</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="full-screen" content="yes">
<meta name="browsermode" content="application">
<meta name="x5-fullscreen" content="true">
<meta name="x5-page-mode" content="app">
<link rel="stylesheet" type="text/css" href="css/lxs_index.css"/>
<link rel="stylesheet" type="text/css" href="css/lxsHeadFoot.css">
<link rel="stylesheet" type="text/css" href="css/order_new.css"/>
<script src="js/jquery-2.1.4.min.js"></script>
<script src="js/lxs_index00.js"></script>
<script></script>
</head>
<body>

<div class="content">
	<div class="headTop">
		<a href="javascript:history.go(-1)" class="back"><i class="iconBack"></i></a><span>确认订单</span><a class="more"><i class="iconDian"></i><i class="iconDian"></i><i class="iconDian"></i></a>
	</div>
</div>


<div class="j_main m-main">
	<!-- <div class="o_logo">
		<span>登录预订更便捷</span><a href="" rel="nofollow">马上登录</a>
	</div> -->
	<form action="" method="post" name="form_1">
		
		<div class="tit">
			<i></i>填写订单
		</div>
		<div class="txt">
			<dl>
				<dt>商品名称：</dt>
				<dd class="line30">水晶葡萄</dd>
			</dl>
			
			<dl>
				<dt>下单日期：</dt>
				<dd>2018-09-10</dd>
			</dl>
			<dl class="J_price">
				<dt>金额：</dt>
				<dd class="box-flex-1 price pd0" id="adult_price_span"><span>￥ <span id="price_d">620</span></dd><span>千克：</span><dd class="box-flex-2"><span class="subadd j_num"><span class="sub" data-type="adults"></span><input id="j_price_d_num" type="number" min="1" max="99" class="text_num" value="1" name="adult_num"><span class="add" data-type="adults"></span></span></dd>
			</dl>
			
		</div>
		
		<script type="text" id="j_baoxian_con"> <dl> <dt> <a href="javascript:;" class="j_baoxian_tit J_baoxian_info">*title*</a> <input type="hidden" name="*name1*" value="*id*" /> <input type="hidden" name="*name2*" value="*price*" /> </dt> <dd> <font><span class="j_baoxian_c">*price_c*</span><i class="more"></i></font> </dd> </dl> </script>
		<script></script>
		<div class="tit">
			<i></i>填写收货人信息
		</div>
		<div class="txt">
			<dl>
				<dt>联系人：</dt>
				<dd><input maxlength="20" type="text" name="truename" class="o_man" placeholder="真实姓名（必填）" value=""></dd>
			</dl>
			<dl>
				<dt>手机号码：</dt>
				<dd class="pd0"><input type="tel" name="mobiletel" id="n_mobiletel" class="o_number" maxlength="11" placeholder="手机号码（必填）" value=""></dd><dd style="width:8rem;-webkit-box-flex:inherit">
				
				</dd>
			</dl>
		 	<dl>
				<dt>收货地址：</dt>
				<dd class="o_yanzhengNo"><input type="text" id="code" name="code" class="o_yz" placeholder="收货地址（必填）" maxlength="6">
				<div class="o_yzTrips">
				</div>
				</dd>
			</dl> 
		</div>
	
		<script type="text" id="j_kehu_c"> <dl class="j_kehu_open"> <dt> <span>游客*i*</span> <div class="none"> <input maxlength="20" type="hidden" class="o_man tourist_name" name="insurance_username[]" placeholder="游客姓名（必填）"> <input type="hidden" class="o_man tourist_phone_number" name="phone_number[]" placeholder="手机号码（选填）"> <input type="hidden" class="o_man tourist_identity_card" name="idcard_no[]" placeholder="身份证号码（必填）">  </div> </dt> <dd> <font class="corBlue"><span>填写信息</span><i class="more fr"></i></font> </dd> </dl> </script>
		<script></script>
	
	
		
	</form>
	<div class="submintFix">
		<dl>
			<dt>
			<div class="price">
				订单总额 <span>￥<em class="j_all_money">620</em></span>
			</div>
			</dt>
			<dd class="sbmFix"><button type="button" id="save">提交订单</button></dd>
		</dl>
	</div>
</div>



		</body>
		</html>