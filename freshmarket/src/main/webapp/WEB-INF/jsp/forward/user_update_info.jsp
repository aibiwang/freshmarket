<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 头部 -->
<%@ include file="header.jsp"%>


	<div class="search_bar clearfix">
		<a href="index.html" class="logo fl"><img src="images/logoforward.png"></a>
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;用户中心</div>
		<div class="search_con fr">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品">
			<input type="button" class="input_btn fr" name="" value="搜索">
		</div>		
	</div>
		<div class="right_content clearfix">
				<div class="info_con clearfix">
				<h3 class="common_title2">基本信息&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">点击修改</a></h3>
						<ul class="user_info_list">
							<li>
								<span>用户名：</span>${loginedUser.getUserName()}
								<%-- <input type="text" value="${user.getUserName()}" id="username_info"/> --%></li>
							<li><span>联系方式：</span>${loginedUser.getUserPhone()}</li>
							<li><span>联系地址：</span>${loginedUser.getUserAddr()}
								<c:if test="${empty  loginedUser.getUserAddr()}">
									<a href="#">暂未完善地址信息</a>
								</c:if>
								${loginedUser.getUserAddr()}
							</li>			
						</ul>
				</div>
				
		</div>
<!-- 脚部 -->
<%@ include file="footer.jsp"%>
