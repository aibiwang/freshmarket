<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 头部 -->
<%@ include file="header.jsp"%>


	<div class="search_bar clearfix">
		<a href="index.html" class="logo fl"><img src="images/logoforward.png"></a>
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;购物车</div>
		<div class="search_con fr">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品">
			<input type="button" class="input_btn fr" name="" value="搜索">
		</div>		
	</div>

	<div class="total_count">全部商品:<em>${ShopCartSize}&nbsp;件</em></div>	
	<ul class="cart_list_th clearfix">
		<li class="col01">商品名称</li>
		<li class="col02">商品单位</li>
		<li class="col03">商品价格</li>
		<li class="col04">数量</li>
		<li class="col05">小计</li>
		<li class="col06">操作</li>
	</ul>
	
	<c:forEach items="${ShopCarts }" var="sc">
	
	<ul class="cart_list_td clearfix">
		<li class="col01"><input type="checkbox" name="selectGoods" checked onclick="selectGoods(${sc.cartitemId },this.checked)"></li>
		<li class="col02"><img src="${(map[sc.goodsId]).goodsPic}"></li>
		<li class="col03">${(map[sc.goodsId]).goodsName}<br><em>${(map[sc.goodsId]).saleprice}元/Kg</em></li>
		<li class="col04">1Kg</li>
		<li class="col05">${(map[sc.goodsId]).saleprice}元</li>
		<li class="col06">
			<div class="num_add">
				<a href="javascript:changeNum('${sc.cartitemId }','add','${(map[sc.goodsId]).saleprice}')" class="add fl">+</a>
				<input type="text" disabled="disabled" class="num_show fl" name="${sc.cartitemId }" value="${sc.goodscount }">	
				<a href="javascript:changeNum('${sc.cartitemId }','sub','${(map[sc.goodsId]).saleprice}')" class="minus fl">-</a>	
			</div>
		</li>
		<li class="col07" style="color:red"  id="${ sc.cartitemId}">${((map[sc.goodsId]).saleprice)*(sc.goodscount)}元</li>
		<li class="col08"><a href="javascript:deleteShopCart(${sc.cartitemId },'${(map[sc.goodsId]).goodsName }')">删除</a></li>
	</ul>

	</c:forEach>
	

	<ul class="settlements">
		<li class="col01"><input type="checkbox"  checked="checked" id="selectAllGoods" onclick="selectAllGoods(this.checked)"/></li>
		<li class="col02">全选</li>
		<li class="col03">合计(不含运费)：<span>¥</span><em id="totalPrice">*</em><br>共计<b id="goodsNum">${ShopCartSize}</b>件商品</li>
		<li class="col04"><a href="javascript:goPay()">去结算</a></li>
	</ul>

<script type="text/javascript">

	var set = new Set();
	$(function(){
	
		var totalPrice=0;
		$(".col07").each(function(){
			set.add($(this).attr('id'));
			totalPrice+= Number($(this).html().split('元')[0]);
			
		});
			console.log(totalPrice);
			$('#totalPrice').html(totalPrice);
			set.forEach(function(element){
				console.log(element);
			})
	})
	



	function deleteShopCart(cartItemId,goodsName){
		
		if(confirm("确定删除  \" "+goodsName+" \"  商品吗？")){
		$.post("delShopCartItem.do?cartItemId="+cartItemId,function(data){
			if(data=='删除成功'){
				window.location.href ='myCart.do';  
			}
			
		});
		}
	}	
	
	
	
	
	function changeNum(cartItemId,flag,salePrice){
	
		var oldNum = $('input[name='+cartItemId+']').val();
		if(oldNum<1 && flag=='sub'){
			alert('数量不能小于0.5');
		}else{
			
		$.post("changeNum.do?cartItemId="+cartItemId+"&flag="+flag,function(data){
			
			
			$('*[name='+cartItemId+']').attr('value',data);
			var price = salePrice*data;
			$('#'+cartItemId+'').html(price+'元');
			
			var totalPrice=0;
			var checkIndex=0;
			var allCheckeBox = document.getElementsByName('selectGoods');
			$(".col07").each(function(){
				
				if (allCheckeBox[checkIndex].type == 'checkbox'
					&& allCheckeBox[checkIndex].checked == true){
					
				totalPrice+= Number($(this).html().split('元')[0]);
				}
				
				checkIndex++;
				
			});
				console.log(totalPrice);
				$('#totalPrice').html(totalPrice);

		});   
		}
		
	}
		  
	//复选框按钮
	function selectGoods(cartitemId,isSelected) {
			//判断复选框中只要有一个未选择，那么全选按钮就不能被选中
			var allCheckeBox = document.getElementsByName('selectGoods');
			for (var i = 0; i < allCheckeBox.length; i++) {
				if (allCheckeBox[i].type == 'checkbox' && allCheckeBox[i].checked == false) {
					document.getElementById('selectAllGoods').checked = false;
					break;//退出循环
				}
				document.getElementById('selectAllGoods').checked = true;
			}
			
			
			var totalPrice=0;
			var checkIndex=0;
			var goodsnumber=0;
			var allCheckeBox = document.getElementsByName('selectGoods');
			$(".col07").each(function(){
				
				if (allCheckeBox[checkIndex].type == 'checkbox'
					&& allCheckeBox[checkIndex].checked == true){
					
				totalPrice+= Number($(this).html().split('元')[0]);
				goodsnumber+=1;
				}
				
				checkIndex++;
				
			});
				console.log(totalPrice);
				$('#totalPrice').html(totalPrice);
				$('#goodsNum').html(goodsnumber);
		
			
			//根据复选框的选中情况,决定set中的元素是否移除
			if(isSelected==false){
				var a=set.delete(''+cartitemId);
			}else{
				set.add(cartitemId+'');
			}
			set.forEach(function(element){
				console.log(element);
			});
		}

	//全选按钮
		function selectAllGoods(checkValue) {
			var allCheckBox = document.getElementsByName('selectGoods');
			for (var i = 0; i < allCheckBox.length; i++) {
				if (allCheckBox[i].type == 'checkbox') {
					allCheckBox[i].checked = checkValue;
				}
			}
			
			
			if(checkValue==true){
			var totalPrice=0;
			var goodsNum=0;
			$(".col07").each(function(){
				totalPrice+= Number($(this).html().split('元')[0]);
				goodsNum+=1;
				
			});
				$('#totalPrice').html(totalPrice);
				$('#goodsNum').html(goodsNum);
			}else{
				$('#totalPrice').html(0);
				$('#goodsNum').html(0);
			}
		}

	//去结算
	function goPay(){
		//判断是否全选
		if($('#selectAllGoods').is(':checked')){
			
			window.location.href ='cartOrder.do';
				
		}else{
			var param='';
			set.forEach(function(element){
				param+=element+',';
			})
			alert(param);	
			
			window.location.href ='goPay.do?params='+param;
			
			
		}
		
		
	}
	
</script>

<!-- 脚部 -->
<%@ include file="footer.jsp"%>