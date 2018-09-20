<%@page import="com.yc.freshmarket.domain.TblUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 头部 -->
<%@ include file="header.jsp"%>

	<div class="search_bar clearfix">
		<a href="index.html" class="logo fl"><img src="images/logoforward.png"></a>
		<div class="search_con fl">
			<input type="text" class="input_text fl" id="searchId" name="" placeholder="搜索商品" value="">
			<input type="button" class="input_btn fr" name="" value="搜索" onclick="searchGoods()">
		</div>
		<div class="guest_cart fr">
			<input type="button" onclick="myCart()" class="cart_name fl" value="我的购物车">
		</div>
	</div>

	<div class="list_model">

		<div class="goods_con clearfix">
			<ul class="goods_list fl">
			
			<c:if test="${goodsSet.size()!=0}">
				<c:forEach items="${goodsSet}" var="g">
					<li>
						<h4><a href="#">${g.goodsName}</a></h4>
						<a href="detail.do?goodsId=${g.goodsId}"><img src="${g.goodsPic}"></a>
						  
						<div class="prize" style="size: 10px" >¥ ${g.saleprice}/kg
						<input type="button" value="加购物车" onclick="addToCart(${g.goodsId})">
						<a href="buy.do?goodsId=${g.goodsId}"><input type="button" onclick="script:if(${loginedUser==null}){alert('请先登录')}" value="立即购买"></a>
	
						</div>
					</li>
				
				</c:forEach>
			</c:if>
			
			</ul>
			
		</div>
<c:if test="${goodsSet.size()==0}">
	<div style="margin-left: 475px;">
		<span style="color:red;font-size: 20px;">未搜索到您想要的商品</span>
	</div>
</c:if>
	</div>
<div class="list_model" style="height: 50px"><div style="margin-left: 420px;" 
	class="page" maxshowpageitem="1" pagelistcount="9"  id="page1"> </div></div>
	
<script type="text/javascript">

		//搜索功能
		function searchGoods(){
			var contents=$('#searchId').val();
			window.location.href ='search.do?contents='+contents;
			
		}
		
		function addToCart(goodsId){
			
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
		
		
		

		function tt(dd){
			//alert(dd);
		}
		
		var GG = {
			"kk":function(mm){
			   //alert(mm);
			}
		}
			
	

		$("#page1").initPage(71,1,GG.kk);
	  
	</script>

<!-- 脚部 -->
<%@ include file="footer.jsp"%>
