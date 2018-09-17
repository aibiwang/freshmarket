<%@page import="com.yc.freshmarket.domain.TblUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 头部 -->
<%@ include file="header.jsp"%>

	<div class="search_bar clearfix">
		<a href="index.html" class="logo fl"><img src="images/logoforward.png"></a>
		<div class="search_con fl">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品">
			<input type="button" class="input_btn fr" name="" value="搜索">
		</div>
		<div class="guest_cart fr">
			<input type="button" onclick="myCart()" class="cart_name fl" value="我的购物车">
		</div>
	</div>

	<div class="navbar_con">
		<div class="navbar">
			<h1 class="fl">全部商品分类</h1>
			<ul class="navlist fl">
				<li><a href="">首页</a></li>
				<li class="interval">|</li>
				<li><a href="">手机生鲜</a></li>
				<li class="interval">|</li>
				<li><a href="">抽奖</a></li>
			</ul>
		</div>
	</div>

	<div class="center_con clearfix">
		<ul class="subnav fl">
			<li><a href="#model01" class="fruit">新鲜水果</a></li>
			<li><a href="#model02" class="seafood">海鲜水产</a></li>
			<li><a href="#model03" class="meet">猪牛羊肉</a></li>
			<li><a href="#model04" class="egg">禽类蛋品</a></li>
			<li><a href="#model05" class="vegetables">新鲜蔬菜</a></li>
			<li><a href="#model06" class="ice">速冻食品</a></li>
		</ul>
		<div class="slide fl">
			<ul class="slide_pics">
				<li><img src="images/slide.jpg" alt="幻灯片"></li>
				<li><img src="images/slide02.jpg" alt="幻灯片"></li>
				<li><img src="images/slide03.jpg" alt="幻灯片"></li>
				<li><img src="images/slide04.jpg" alt="幻灯片"></li>
			</ul>
			<div class="prev"></div>
			<div class="next"></div>
			<ul class="points"></ul>
		</div>
		<div class="adv fl">
			<a href="#"><img src="images/adv01.jpg"></a>
			<a href="#"><img src="images/adv02.jpg"></a>
		</div>
	</div>

	<div class="list_model">
		<div class="list_title clearfix">
			<h3 class="fl" id="model01">新鲜水果</h3>
			<div class="subtitle fl">
				<span>|</span>
				<a href="#">鲜芒</a>
				<a href="#">加州提子</a>
				<a href="#">亚马逊牛油果</a>
			</div>
			<a href="#" class="goods_more fr" id="fruit_more">查看更多 ></a>
		</div>

		<div class="goods_con clearfix">
			<div class="goods_banner fl"><img src="images/banner01.jpg"></div>
			<ul class="goods_list fl">
			
			<c:forEach items="${allGoods}" var="g">
			
			<c:if test="${g.categoryId==1}">
			
				<li>
					<h4><a href="#">${g.goodsName}</a></h4>
					<a href="detail.do?goodsId=${g.goodsId}"><img src="${g.goodsPic}"></a>
					  
					<div class="prize" style="size: 10px" >¥ ${g.saleprice}/kg
					<input type="button" value="加购物车" onclick="addToCart(${g.goodsId})">
					<a href="buy.do?goodsId=${g.goodsId}"><input type="button" onclick="script:if(${loginedUser==null}){alert('请先登录')}" value="立即购买"></a>

					</div>
				</li>
			
			</c:if>
			</c:forEach>
			
			</ul>
			
			
		</div>
	</div>
	<div class="list_model" style="height: 50px"><div style="margin-left: 420px;" 
	class="page" maxshowpageitem="1" pagelistcount="9"  id="page1"> </div></div>
	
	
	
	
	
	
	
	
	<div class="list_model">
		<div class="list_title clearfix">
			<h3 class="fl" id="model02">海鲜水产</h3>
			<div class="subtitle fl">
				<span>|</span>
				<a href="#">河虾</a>
				<a href="#">扇贝</a>				
			</div>
			<a href="#" class="goods_more fr">查看更多 ></a>
		</div>

		<div class="goods_con clearfix">
			<div class="goods_banner fl"><img src="images/banner02.jpg"></div>
			<ul class="goods_list fl">
			
			
			<c:forEach items="${allGoods}" var="g">
			
			<c:if test="${g.categoryId==2}">
			
				<li>
					<h4><a href="#">${g.goodsName}</a></h4>
					<a href="detail.do?goodsId=${g.goodsId}"><img src="${g.goodsPic}"></a>
					  
					<div class="prize" style="size: 10px" >¥ ${g.saleprice}/kg
					<input type="button" value="加购物车" onclick="addToCart(${g.goodsId})">
					<a href="buy.do?goodsId=${g.goodsId}"><input type="button" onclick="script:if(${loginedUser==null}){alert('请先登录')}" value="立即购买"></a>
					</div>
				</li>
			
			</c:if>
			</c:forEach>
			
			</ul>
		</div>
	</div>
	<div class="list_model" style="height: 50px"><div style="margin-left: 420px;" 
	class="page" maxshowpageitem="1" pagelistcount="9"  id="page2"> </div></div>




	<div class="list_model">
		<div class="list_title clearfix">
			<h3 class="fl" id="model03">猪牛羊肉</h3>
			<div class="subtitle fl">
				<span>|</span>
				<a href="#">鲜芒</a>
				<a href="#">加州提子</a>
				<a href="#">亚马逊牛油果</a>
			</div>
			<a href="#" class="goods_more fr">查看更多 ></a>
		</div>

		<div class="goods_con clearfix">
			<div class="goods_banner fl"><img src="images/banner03.jpg"></div>
			<ul class="goods_list fl">
			
			
			<c:forEach items="${allGoods}" var="g">
			
			<c:if test="${g.categoryId==3}">
			
				<li>
					<h4><a href="#">${g.goodsName}</a></h4>
					<a href="detail.do?goodsId=${g.goodsId}"><img src="${g.goodsPic}"></a>
					  
					<div class="prize" style="size: 10px" >¥ ${g.saleprice}/kg
					<input type="button" value="加购物车" onclick="addToCart(${g.goodsId})">
					<a href="buy.do?goodsId=${g.goodsId}"><input type="button" onclick="script:if(${loginedUser==null}){alert('请先登录')}" value="立即购买"></a>
					</div>
				</li>
			
			</c:if>
			</c:forEach>
			
			</ul>
		</div>
	</div>
<div class="list_model" style="height: 50px"><div style="margin-left: 420px;" 
	class="page" maxshowpageitem="1" pagelistcount="9"  id="page3"> </div></div>
	<div class="list_model">
		<div class="list_title clearfix">
			<h3 class="fl" id="model04">禽类蛋品</h3>
			<div class="subtitle fl">
				<span>|</span>
				<a href="#">鲜芒</a>
				<a href="#">加州提子</a>
				<a href="#">亚马逊牛油果</a>
			</div>
			<a href="#" class="goods_more fr">查看更多 ></a>
		</div>

		<div class="goods_con clearfix">
			<div class="goods_banner fl"><img src="images/banner04.jpg"></div>
			<ul class="goods_list fl">
			
			<c:forEach items="${allGoods}" var="g">
			
			<c:if test="${g.categoryId==4}">
			
				<li>
					<h4><a href="#">${g.goodsName}</a></h4>
					<a href="detail.do?goodsId=${g.goodsId}"><img src="${g.goodsPic}"></a>
					  
					<div class="prize" style="size: 10px" >¥ ${g.saleprice}/kg
					<input type="button" value="加购物车" onclick="addToCart(${g.goodsId})">
				<a href="buy.do?goodsId=${g.goodsId}"><input type="button" onclick="script:if(${loginedUser==null}){alert('请先登录')}" value="立即购买"></a>
					</div>
				</li>
			
			</c:if>
			</c:forEach>
			
			</ul>
		</div>
	</div>
	<div class="list_model" style="height: 50px"><div style="margin-left: 420px;" 
	class="page" maxshowpageitem="1" pagelistcount="9"  id="page4"> </div></div>
	<div class="list_model">
		<div class="list_title clearfix">
			<h3 class="fl" id="model05">新鲜蔬菜</h3>
			<div class="subtitle fl">
				<span>|</span>
				<a href="#">鲜芒</a>
				<a href="#">加州提子</a>
				<a href="#">亚马逊牛油果</a>
			</div>
			<a href="#" class="goods_more fr">查看更多 ></a>
		</div>

		<div class="goods_con clearfix">
			<div class="goods_banner fl"><img src="images/banner05.jpg"></div>
			<ul class="goods_list fl">
			
			<c:forEach items="${allGoods}" var="g">
			
			<c:if test="${g.categoryId==5}">
			
				<li>
					<h4><a href="#">${g.goodsName}</a></h4>
					<a href="detail.do?goodsId=${g.goodsId}"><img src="${g.goodsPic}"></a>
					  
					<div class="prize" style="size: 10px" >¥ ${g.saleprice}/kg
					<input type="button" value="加购物车" onclick="addToCart(${g.goodsId})">
					<a href="buy.do?goodsId=${g.goodsId}"><input type="button" onclick="script:if(${loginedUser==null}){alert('请先登录')}" value="立即购买"></a>
					</div>
				</li>
			
			</c:if>
			</c:forEach>
			
			</ul>
		</div>
	</div>
	<div class="list_model" style="height: 50px"><div style="margin-left: 420px;" 
	class="page" maxshowpageitem="1" pagelistcount="9"  id="page5"> </div></div>
	<div class="list_model">
		<div class="list_title clearfix">
			<h3 class="fl" id="model06">速冻食品</h3>
			<div class="subtitle fl">
				<span>|</span>
				<a href="#">鲜芒</a>
				<a href="#">加州提子</a>
				<a href="#">亚马逊牛油果</a>
			</div>
			<a href="#" class="goods_more fr">查看更多 ></a>
		</div>

		<div class="goods_con clearfix">
			<div class="goods_banner fl"><img src="images/banner06.jpg"></div>
			<ul class="goods_list fl">
			
			<c:forEach items="${allGoods}" var="g">
			
			<c:if test="${g.categoryId==6}">
			
				<li>
					<h4><a href="#">${g.goodsName}</a></h4>
					<a href="detail.do?goodsId=${g.goodsId}"><img src="${g.goodsPic}"></a>
					  
					<div class="prize" style="size: 10px" >¥ ${g.saleprice}/kg
					<input type="button" value="加购物车" onclick="addToCart(${g.goodsId})">
					<a href="buy.do?goodsId=${g.goodsId}"><input type="button" onclick="script:if(${loginedUser==null}){alert('请先登录')}" value="立即购买"></a>
					</div>
				</li>
			
			</c:if>
			</c:forEach>
				
			</ul>
		</div>
	</div>
	<div class="list_model" style="height: 50px"><div style="margin-left: 420px;" 
	class="page" maxshowpageitem="1" pagelistcount="9"  id="page6"> </div></div>
	


<script type="text/javascript">
		
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
			
	

		$("#page1").initPage(21,1,GG.kk);
		$("#page2").initPage(31,1,GG.kk);
		$("#page3").initPage(41,1,GG.kk);
		$("#page4").initPage(51,1,GG.kk);
		$("#page5").initPage(61,1,GG.kk);
		$("#page6").initPage(71,1,GG.kk);  
	</script>

	<!-- <script type="text/javascript">
		/* BCSlideshow('focuspic');  */
		var oFruit = document.getElementById('fruit_more');
		var oShownum = document.getElementById('show_count');

		var hasorder = localStorage.getItem('order_finish');

		if(hasorder)
		{
			oShownum.innerHTML = '2';
		}

		oFruit.onclick = function(){
			window.location.href = 'list.html';
		}
	</script> -->

<!-- 脚部 -->
<%@ include file="footer.jsp"%>
