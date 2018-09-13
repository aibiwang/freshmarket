<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 头部 -->
	<head>
		<meta charset="utf-8" />
		<title></title>
		<style>
			body{font-size: 12px;}
			ul li{list-style: none;}
			.track-rcol{width: 100%px; border: 1px solid #eee;}
			.track-list{margin: 100%px; padding-left: 5px; position: relative;}
			.track-list li{position: relative; padding: 9px 0 0 25px; line-height: 18px; border-left: 1px solid #d9d9d9; color: #999;}
			.track-list li.first{color: red; padding-top: 0; border-left-color: #fff;}
			.track-list li .node-icon{position: absolute; left: -6px; top: 50%; width: 11px; height: 11px; background: url(images/img/order-icons.png)  -21px -72px no-repeat;}
			.track-list li.first .node-icon{background-position:0 -72px;}
			.track-list li .time{margin-right: 20px; position: relative; top: 4px; display: inline-block; vertical-align: middle;}
			.track-list li .txt{max-width: 600px; position: relative; top: 4px; display: inline-block; vertical-align: middle;}
			.track-list li.first .time{margin-right: 20px; }
			.track-list li.first .txt{max-width: 600px; }
			.main_con clearfix{margin-left:auto;margin-right:auto;}
		</style>
	</head>
<%@ include file="header.jsp"%>
	<div class="search_bar clearfix">
		<a href="index" class="logo fl"><img src="images/logoforward.png"></a>
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;物流中心</div>
		<!-- <div class="search_con fr">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品">
			<input type="button" class="input_btn fr" name="" value="搜索">
		</div>	 -->	
	</div>

	<div class="main_con clearfix" style="text-align: center;">
		<div class="track-rcol" style="text-align: center;">
			<div class="track-list">
				<ul>
					<li class="first">
						<i class="node-icon"></i>
						<span class="time">2016-03-10 18:07:15</span>
						<span class="txt">感谢您在生鲜超市购物，欢迎您再次光临！</span>
					</li>
					<li>
						<i class="node-icon"></i>
						<span class="time">2016-03-10 18:07:15</span>
						<span class="txt">【生鲜到家】配送员【申国龙】已出发，联系<br/>电话【18410106883，感谢您的耐心等待，<br/>参加评价还能赢取更多福利呦】</span>
					</li>
					<li>
						<i class="node-icon"></i>
						<span class="time">2016-03-10 18:07:15</span>
						<span class="txt">感谢您在生鲜超市购物，欢迎您再次光临！</span>
					</li>
					<li>
						<i class="node-icon"></i>
						<span class="time">2016-03-10 18:07:15</span>
						<span class="txt">感谢您在生鲜超市购物，欢迎您再次光临！</span>
					</li>
					<li>
						<i class="node-icon"></i>
						<span class="time">2016-03-10 18:07:15</span>
						<span class="txt">感谢您在生鲜超市购物，欢迎您再次光临！</span>
					</li>
					<li>
						<i class="node-icon"></i>
						<span class="time">2016-03-10 18:07:15</span>
						<span class="txt">感谢您在生鲜超市购物，欢迎您再次光临！</span>
					</li>
					<li>
						<i class="node-icon"></i>
						<span class="time">2016-03-10 18:07:15</span>
						<span class="txt">感谢您在生鲜超市购物，欢迎您再次光临！</span>
					</li>
					<li>
						<i class="node-icon"></i>
						<span class="time">2016-03-10 18:07:15</span>
						<span class="txt">感谢您在生鲜超市购物，欢迎您再次光临！</span>
					</li>
					<li>
						<i class="node-icon"></i>
						<span class="time">2016-03-10 18:07:15</span>
						<span class="txt">感谢您在生鲜超市购物，欢迎您再次光临！</span>
					</li>
				</ul>
			</div>
		</div>
	</div>
<!-- 脚部 -->
<%@ include file="footer.jsp"%>

