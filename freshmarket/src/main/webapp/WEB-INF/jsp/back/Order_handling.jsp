<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style.css"/>       
        <link href="assets/css/codemirror.css" rel="stylesheet" />
        <link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="font/css/font-awesome.min.css" />
        <!--[if lte IE 8]>
		<link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="/js/jquery-1.9.1.min.js"></script>
        <script src="/assets/js/bootstrap.min.js"></script>
		<script src="/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="/assets/js/jquery.dataTables.min.js"></script>
		<script src="/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="/assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="/js/lrtk.js" type="text/javascript" ></script>
<title>订单处理</title>
</head>

<body>
<div class="clearfix">
 <div class="handling_style" id="order_hand">
      <div id="scrollsidebar" class="left_Treeview">
        <div class="show_btn" id="rightArrow"><span></span></div>
        <div class="widget-box side_content" >
         <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
         <div class="side_list"><div class="widget-header header-color-green2"><h4 class="lighter smaller">订单操作</h4></div>
         <div class="widget-body">
          <ul class="b_P_Sort_list">
             <li><i class="orange  fa fa-reorder"></i><a href="#">全部订单(${ordertotal})</a></li>
             <li><i class="fa fa-sticky-note pink "></i> <a href="#">已评价(${yiPingJiatotal })</a></li>
             <li><i class="fa fa-sticky-note pink "></i> <a href="#">待支付(${daiZhiFutotal })</a> </li>
             <li><i class="fa fa-sticky-note pink "></i> <a href="#">待发货(${daiFaHuototal})</a></li>
             <li><i class="fa fa-sticky-note pink "></i> <a href="#">已发货(${yiFaHuototal })</a></li>
            </ul>
        </div>
       </div>
      </div>  
     </div>
 <div class="order_list_style" id="order_list_style">
  <div class="search_style">
     
   
    </div>
    <!--交易订单列表-->
    <div class="Orderform_list">
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<th width="25px"><label><input type="checkbox" class="ace" /><span class="lbl"></span></label></th>
				<th width="120px">订单编号</th>
				<th width="100px">交易金额</th>				
                <th width="100px">交易时间</th>	
				<th width="70px">状态</th>
                             
				<th width="200px">操作</th>
			</tr>
		</thead>
	<tbody>
	
	<c:forEach items="${allOrderlist}" var="allOrderlist">
    	<tr>
	     <td><label><input type="checkbox" class="ace"/><span class="lbl"></span></label></td>
	     <td>${allOrderlist.getOrderId() }</td>
	     
	     <td>${allOrderlist.getOrderTotalprice() }</td>
	     
	     <td>${allOrderlist.getOrderDate() }</td>
	     
	     <td class="td-status"><span class="label label-success radius">${allOrderlist.getTag() }</span></td>
	      
	     <td>
	     
	     <c:if test="${allOrderlist.getTag() eq '待发货' }">
	     
	     	<a onClick="Delivery_stop(this,${allOrderlist.getOrderId() },'${allOrderlist.getTag() }')"  href="javascript:;" title="发货"  class="btn btn-xs btn-success"><i class="fa fa-cubes bigger-120"></i></a> 
	     
	     </c:if>
	     
	     
	     <a title="订单详细"  href="orderDetails.do?orderId=${allOrderlist.getOrderId() }"  class="btn btn-xs btn-info order_detailed" ><i class="fa fa-list bigger-120"></i></a> 
	     </td>
     </tr> 
   	
   		
   	
   	</c:forEach>
	



    </tbody>
    </table>   
    </div>
 </div>
 </div>
</div>
<!--发货-->

</body>
</html>
<script>
$(function() { 
	$("#order_hand").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:30,//设置隐藏时的距离
	    spacingh:250,//设置显示时间距
		table_menu:'.order_list_style',
	});
});


//时间
 laydate({
    elem: '#start',
    event: 'focus' 
});
//初始化宽度、高度  
 $(".widget-box").height($(window).height()); 
$(".order_list_style").width($(window).width()-220);
 $(".order_list_style").height($(window).height()-30);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".widget-box").height($(window).height());
	 $(".order_list_style").width($(window).width()-234);
	  $(".order_list_style").height($(window).height()-30);
});
/**发货**/
function Delivery_stop(obj,id,tag){
	alert(id);
	if(tag=='待发货'){
		alert(tag);
		$.ajax({
			  type: 'POST',
			  url: "deliverGoods.do?orderId="+id,
			  dataType: 'JSON',
			  success: function( data ){
				  alert(data);
				  if(data=='1'){
					 
					  window.location.href="allOrder.do";
					  
				  }
				 
			  }
		})
	}
	
};
//订单列表
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,6,8,9]}// 制定列不参与排序
		] } );
                 //全选操作
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			});
</script>
