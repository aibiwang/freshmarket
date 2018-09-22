<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" /> 
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style.css"/>       
        <link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
        <link rel="stylesheet" href="Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css"/>
        <link href="Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />   
		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
<script src="/js/jquery-1.9.1.min.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/typeahead-bs2.min.js"></script>
<!-- page specific plugin scripts -->
<script src="/assets/js/jquery.dataTables.min.js"></script>
<script src="/assets/js/jquery.dataTables.bootstrap.js"></script>
<script type="text/javascript" src="/js/H-ui.js"></script>
<script type="text/javascript" src="/js/H-ui.admin.js"></script>
<script src="/assets/layer/layer.js" type="text/javascript"></script>
<script src="/assets/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript"
	src="/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
<script src="/js/lrtk.js" type="text/javascript"></script>
<title>产品列表</title>
</head>
<body>
	<div class=" page-content clearfix">
		<div id="products_style">
			<div class="search_style">

				<!--       <ul class="search_content clearfix">
       <li><label class="l_f">产品名称</label><input name="" type="text"  class="text_add" placeholder="输入品牌名称"  style=" width:250px"/></li>
       <li><label class="l_f">添加时间</label><input class="inline laydate-icon" id="start" style=" margin-left:10px;"></li>
       <li style="width:90px;"><button type="button" class="btn_search"><i class="icon-search"></i>查询</button></li>
      </ul> -->

    </div>
     <div class="border clearfix">
       <span class="l_f">
        <a href="TgoodsAdd.do?list=${list }" title="添加商品" class="btn btn-warning Order_form"><i class="icon-plus"></i>添加商品</a>
        
       </span>
       <span class="r_f">共：<b>${goodtotal}</b>件商品</span>
     </div>
     <!--产品列表展示-->
     <div class="h_products_list clearfix" id="products_list">
       <div id="scrollsidebar" class="left_Treeview">
        <div class="show_btn" id="rightArrow"><span></span></div>
        <div class="widget-box side_content" >
         <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
         <div class="side_list"><div class="widget-header header-color-green2"><h4 class="lighter smaller">产品类型列表</h4></div>
         <div class="widget-body">
          <div class="widget-main padding-8"><div id="treeDemo" class="ztree"></div></div>
        </div>
       </div>
      </div>  
     </div>
         <div class="table_menu_list" id="testIframe">
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 	<tr>
				<th width="25px"><label><input type="checkbox" class="ace"/><span class="lbl"></span></label></th>
				<th width="80px">商品编号</th>
				<th width="100px">图片</th>
				<th width="80px">商品名称</th>
				<th width="50px">进价</th>
				<th width="50px">销售价</th>
				<th width="50px">类别</th>	
				<th width="100px">库存</th>
				<th width="180px">商品描述</th>			
				<th width="100px">加入时间</th>
				<th width="70px">状态</th>                
				<th width="200px">操作</th>
			</tr>
		</thead>
	<tbody>
     	<c:forEach items="${list}" var="list">
			<c:forEach items="${list.getListGoods()}" var="listgoods">
			 <tr>
		        
		        
		        
		       	 
		       	 <c:if test="${!empty listgoods }">
		       	 	<td width="25px"><label><input type="checkbox" class="ace" name="goodsId" value="${listgoods.getGoodsId()}" /><span class="lbl"></span></label></td>
		       	 	<td width="80px">${listgoods.getGoodsId()}</td>  
		       	 	
		       	 	<td height="100px" width="100px"><img height="80px" width="80px" src="${listgoods.getGoodsPic() }"/></td>  
		        	<td width="80px"><u style="cursor:pointer" class="text-primary" onclick="">${listgoods.getGoodsName()}</u></td>
		        	<td width="50px">${listgoods.getInprice()}元</td>
		        	<td width="50px">${listgoods.getSaleprice()}元</td>
		        	<td width="50px">${list.getCategoryName()}</td>
			        <td width="100px">${listgoods.getGoodsReservenum() }</td> 
			        <td width="180px">${listgoods.getGoodsDesc() }</td>   
			        <td width="100px">${listgoods.getGoodsPutdate() }</td>
			       	<td width="70px">${listgoods.getGoodsPutstatus() }</td>
		        
		        	 <td class="td-manage">
				        <a onClick="member_stop(this,'10001')"  href="javascript:;" title="停用"  class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a> 
				        <a title="编辑" onclick="member_edit(

				        '${listgoods.getGoodsName()}',
				        '${listgoods.getInprice()}',
				        '${listgoods.getSaleprice()}',
				        '${list.getCategoryId()}',
				        '${listgoods.getGoodsReservenum() }',
				        '${listgoods.getGoodsDesc() }',
				   
				        '${listgoods.getGoodsPutstatus() }',
				        '${listgoods.getGoodsPic()}',
				        '${listgoods.getGoodsId() }')"
												href="javascript:;" class="btn btn-xs btn-info"><i
													class="icon-edit bigger-120"></i></a> <a title="删除"
												href="javascript:;"
												onclick="member_del(this,'${listgoods.getGoodsId()}')"
												class="btn btn-xs btn-warning"><i
													class="icon-trash  bigger-120"></i></a></td>
										</c:if>
									</tr>
								</c:forEach>

							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script>
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,8,9]}// 制定列不参与排序
		] } );
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			
			
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			});
 laydate({
    elem: '#start',
    event: 'focus' 
});
$(function() { 
	$("#products_style").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:30,//设置隐藏时的距离
	    spacingh:260,//设置显示时间距
	});
});
</script>
<script type="text/javascript">
//初始化宽度、高度  
 $(".widget-box").height($(window).height()-215); 
$(".table_menu_list").width($(window).width()-260);
 $(".table_menu_list").height($(window).height()-215);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".widget-box").height($(window).height()-215);
	 $(".table_menu_list").width($(window).width()-260);
	  $(".table_menu_list").height($(window).height()-215);
	})
 
/*******树状图*******/
var setting = {
	view: {
		dblClickExpand: false,
		showLine: false,
		selectedMulti: false
	},
	data: {
		key: {
			name: "categoryName"
		},
		simpleData: {
			enable:true,
			idKey: "categoryId",
			pIdKey: "parentId",
			rootPId: ""
		}
	},
	callback: {
		beforeClick: function(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("tree");
			if (treeNode.isParent) {
				zTree.expandNode(treeNode);
				return false;
			} else {
				demoIframe.attr("src",treeNode.file + ".html");
				return true;
			}
		}
	}
};
    
var zNodes = ${gsonlist};
		
var code;
		
function showCode(str) {
	if (!code) code = $("#code");
	code.empty();
	code.append("<li>"+str+"</li>");
}
		
$(document).ready(function(){
	var t = $("#treeDemo");
	t = $.fn.zTree.init(t, setting, zNodes);
	demoIframe = $("#testIframe");
	demoIframe.bind("load", loadReady);
	var zTree = $.fn.zTree.getZTreeObj("tree");
	zTree.selectNode(zTree.getNodeByParam("id",'11'));
});	
/*产品-停用*/
function member_stop(obj,id){
	alert(id);
	layer.confirm('确认要停用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*产品-启用*/
function member_start(obj,id){
	alert(obj);
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="icon-ok bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!',{icon: 6,time:1000});
	});
}
/*产品-编辑*/
function member_edit(a,b,c,d,e,f,g,h,i){
	alert(a);
	alert(h);
	$.ajax({
		  type: 'POST',
		  url: "updategoods.do",
	 	  data: {'goodsName':     document.getElementsByName("goodsName").innerHTML = a ,
	 		 	'inprice':   document.getElementsByName("inprice").innerHTML = b    ,
				'saleprice':     document.getElementsByName("saleprice").innerHTML = c  , 
				'categoryId':    document.getElementsByName("categoryId").innerHTML = d    ,
				'goodsReservenum':   document.getElementsByName("goodsReservenum").innerHTML = e    ,
				
				'goodsDesc':  document.getElementsByName("goodsDesc").innerHTML = f,
				'goodsPutstatus':  document.getElementsByName("goodsPutstatus").innerHTML = g  , 
				'goodsPic':  document.getElementsByName("goodsPic").innerHTML = h ,
				'goodsId':  document.getElementsByName("goodsId").innerHTML = i 
				 
		  }, 
		  dataType: 'JSON',
		  success: function( data ){
			 
			  if(data=='1'){
				  alert(i);
				  window.location.href="TgoodsUpdate.do";
				  
			  }
			  
		  }
	});
	
	//layer_show(a,b,c,d,e,f,g,h);
}

/*产品-删除*/
function member_del(obj,id){
	alert(id);
	
	
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		
		$.ajax({
			  type: 'POST',
			  url: "detelegoods.do?goodsId="+id,
			  dataType: 'JSON',
			  success: function( data ){
				
			  }
		});
		
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
//面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.Order_form').on('click', function(){
	var cname = $(this).attr("title");
	var chref = $(this).attr("href");
	var cnames = parent.$('.Current_page').html();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe').html(cname);
    parent.$('#iframe').attr("src",chref).ready();;
	parent.$('#parentIframe').css("display","inline-block");
	parent.$('.Current_page').attr({"name":herf,"href":"javascript:void(0)"}).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
    parent.layer.close(index);
	
});
</script>
