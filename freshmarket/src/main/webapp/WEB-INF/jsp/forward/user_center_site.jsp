<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 头部 -->
<%@ include file="header.jsp"%>



	<div class="search_bar clearfix">
		<a href="index.html" class="logo fl"><img src="images/logo.png"></a>
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
				<li><a href="user_center_info.html">· 个人信息</a></li>
				<li><a href="user_center_order.html">· 全部订单</a></li>
				<li><a href="user_center_site.html" class="active">· 收货地址</a></li>
			</ul>
		</div>
		<div class="right_content clearfix">
				<h3 class="common_title2">收货地址</h3>
				<div class="site_con">
					<dl>
						<dt>当前地址：</dt>
						<dd>北京市 海淀区 东北旺西路8号中关村软件园 （李思 收） 182****7528</dd>
					</dl>					
				</div>
				<h3 class="common_title2">编辑地址</h3>
				<div class="site_con">
					<form>
						<div class="form_group">
							<label>收件人：</label>
							<input type="text" name="">
						</div>
						<div class="form_group form_group2">
							<label>详细地址：</label>
							<textarea class="site_area"></textarea>
						</div>
						<div class="form_group">
							<label>邮编：</label>
							<input type="text" name="">
						</div>
						<div class="form_group">
							<label>手机：</label>
							<input type="text" name="">
						</div>

						<input type="submit" name="" value="提交" class="info_submit">
					</form>
				</div>
		</div>
	</div>




<!-- 脚部 -->
<%@ include file="footer.jsp"%>