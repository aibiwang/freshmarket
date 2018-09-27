package com.yc.freshmarket.controller;

import java.io.IOException;
import java.io.Writer;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.freshmarket.domain.TblGoods;
import com.yc.freshmarket.domain.TblGoodsDao;
import com.yc.freshmarket.domain.TblOpinion;
import com.yc.freshmarket.domain.TblOrder;
import com.yc.freshmarket.domain.TblOrderItem;
import com.yc.freshmarket.domain.TblUser;
import com.yc.freshmarket.service.GoodsBiz;
import com.yc.freshmarket.service.OpinionBiz;
import com.yc.freshmarket.service.OrderBiz;
import com.yc.freshmarket.service.OrderitemBiz;

@Controller
@EnableAutoConfiguration
public class OrderController{

	@Resource
	private OrderBiz orderBiz;
	@Resource
	private GoodsBiz goodsBiz;
	@Resource
	private TblGoodsDao tblGoodsDao;
	@Resource
	OrderitemBiz orderitemBiz; 
	@Resource
	OpinionBiz opinionBiz;

	/**
	 * 立即购买请求
	 * @param goodsId
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/buy.do")
	public String buy(Integer goodsId,Model model,HttpSession session) {

		TblUser user=(TblUser) session.getAttribute("loginedUser");
		if(user==null) {
			model.addAttribute("msg","请先登录");
			return "forward/login";
		}else {
			model.addAttribute("goodsId",goodsId);
			model.addAttribute("goods",goodsBiz.findTblGoodsBygoodsId(goodsId));
			return "forward/order";

		}
	}


	@Transactional
	@RequestMapping("/oderSubmit.do")
	public String oderSubmit(HttpSession session, Model model,Integer goodsId, Integer goodsNum,String receiverName,String receiverTel,String receiverAddr,double siglePrice,String goodsName,String goodsPic,String orderTime) {

		double totalprices=siglePrice*goodsNum;
		TblOrder order = new TblOrder();
		order.setOrderDate(new Timestamp(System.currentTimeMillis()));
		order.setOrderTotalprice(totalprices);
		order.setReceiverAddr(receiverAddr);
		order.setReceiverName(receiverName);
		order.setReceiverPhone(receiverTel);
		order.setTag("待支付");
		order.setUserId(((TblUser)session.getAttribute("loginedUser")).getUserId());
		//插入订单
		order=orderBiz.insertOrder(order);
		
		TblOrderItem orderItem = new TblOrderItem();
		orderItem.setGoodscount(goodsNum);
		orderItem.setGoodsId(goodsId);
		orderItem.setOrderId(order.getOrderId());
		orderItem.setOrderitemTotalprice(totalprices);
		
		List<TblOrderItem> orderItems=new ArrayList<TblOrderItem>();
		orderItems.add(orderItem);
		//插入订单子项
		orderitemBiz.insertOrderitem(orderItems);
		
		model.addAttribute("goodsNum",goodsNum);
		model.addAttribute("receiverName",receiverName);
		model.addAttribute("receiverTel",receiverTel);
		model.addAttribute("receiverAddr",receiverAddr);
		model.addAttribute("siglePrice",siglePrice);
		model.addAttribute("goodsName",goodsName);
		model.addAttribute("orderTime",orderTime);
		model.addAttribute("goodsPic",goodsPic);
		model.addAttribute("totalMoney",totalprices);
		model.addAttribute("orderId", order.getOrderId());
		//返回界面
		return "forward/place_order";
	}

	/**
	 * 各种订单查询
	 * @param op
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/find_allorder.do")
	public String find_allorder(String op,HttpSession session,Model model) {
		TblUser user=(TblUser) session.getAttribute("loginedUser");
		Integer uid = user.getUserId();
		List<TblOrder> orders1 = orderBiz.findByUserId(uid);
		
		
		List<TblOrder> orders = new ArrayList<TblOrder>();

		
		if(orders1!=null&&orders1.size()>0){

			int ordercount=0;//订单总数
			int waitpaycount=0;//待付款
			int waitfahuocount=0;//待发货
			int waitshouhuo=0;//待收货
			int waitdaipingjia=0;//待评价
			int yipingjia=0;//已评价
			String status="";

			for(int i = 0;i<orders1.size();i++){
				//1.统计各种订单状态数量
				status=orders1.get(i).getTag();
				if("待支付".equals(status)){
					waitpaycount++;
					ordercount++;
				}else if("已发货".equals(status)){
					waitshouhuo++;
					ordercount++;
				}else if("待评价".equals(status)){
					waitdaipingjia++;
					ordercount++;
				}else if("待发货".equals(status)){
					waitfahuocount++;
					ordercount++;
				}else if("已评价".equals(status)){
					yipingjia++;
					ordercount++;
				}
				//判断显示哪个状态的订单
				if(orders1.get(i).getTag().equals(op)){
					orders.add(orders1.get(i));
				}
			}
			if("全部订单".equals(op)){
				orders=orders1;
			}

			if(orders!=null&&orders.size()>0){
				//				System.out.println(orders);

				List<TblOrderItem> orderItems = new ArrayList<TblOrderItem>();
				Map<TblOrderItem,TblGoods> goodsDetail =new HashMap<TblOrderItem,TblGoods>();//每个订单有一个Map
				for(int i=0;i<orders.size();i++){
					//2.获取每个订单项对应的商品详情
					if(orders.get(i).getItems()!=null&&orders.get(i).getItems().size()>0){
						orderItems=orders.get(i).getItems();
						for(TblOrderItem orderItem:orderItems){
							Integer goodsId = orderItem.getGoodsId();
							TblGoods tblgoods = tblGoodsDao.findByGoodsId(goodsId);
							goodsDetail.put(orderItem, tblgoods);
							/*System.out.println("商品详情"+tblgoods);
						System.out.println(goodsDetail.get(orderItem).getGoodsPic());*/
						}
					}
				}
				System.out.println("总数："+ordercount+"===待发货"+waitfahuocount+"==待支付："+waitpaycount+"===待收货："+waitshouhuo+"带评价："+waitdaipingjia);
				model.addAttribute("orders", orders);
				model.addAttribute("goodsDetail", goodsDetail);
				model.addAttribute("ordercount", ordercount);
				model.addAttribute("waitfahuocount", waitfahuocount);
				model.addAttribute("waitpaycount", waitpaycount);
				model.addAttribute("waitshouhuo", waitshouhuo);
				model.addAttribute("waitdaipingjia", waitdaipingjia);
				model.addAttribute("yipingjia", yipingjia);
			}
		}
		return "forward/user_center_order";

	}

	/**
	 * 确认收货
	 * @param orderId
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/updateOrderTag.do")
	public void updateOrderTag(Integer orderId,String tag,Writer out) throws IOException {
		int result = orderBiz.updateTagByOrderId(tag,orderId);
		System.out.println(result);
		if(result>0){
			out.write("去评价");
		}else{
			out.write("订单状态出现异常！！！");
		}
	}
	
	/**
	 * 后台查看订单
	 * @return
	 */
	@RequestMapping("/orderfind.do")
	public String orderfind(HttpServletRequest request,Model model){

		
		return "/back/Order_handling";
		
	}
	
	/**
	 * 发货
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/deliverGoods.do")
	public void deliverGoods(Integer orderId,Writer out) throws IOException{
		String tag ="已发货";
		int result = orderBiz.updateTagByOrderId(tag,orderId);
		System.out.println("---------------deliverGoods------------"+result);
		out.write("1");
		
	}
	
	
	/** 确认支付
	 * @param orderId
	 * @param out
	 * @throws IOException
	 */
	@RequestMapping("/payCheck.do")
	public String payCheck(Integer orderId,HttpSession session,Model model) throws IOException {
		
		orderBiz.updateTagByOrderId("待发货", orderId);
		
		return find_allorder("待发货",session,model);
	}
	

	/**
	 * 点击去评价时跳到评价界面前，先查订单信息
	 * @param orderId
	 * op=0则为添加评价信息，op=1则为查看评价详情
	 * @param out
	 * @throws IOException
	 */
	@RequestMapping("/selectPingjia.do")
	public void selectPingjia(Integer op,Integer orderId,Writer out,HttpSession session) throws IOException {
		System.out.println(op);
		TblOrder order = orderBiz.findByOrderId(orderId);
		System.out.println(order);
		if(order!=null){
			List<TblOrderItem> orderItems = new ArrayList<TblOrderItem>();
			Map<TblOrderItem,TblGoods> goodsDetail =new HashMap<TblOrderItem,TblGoods>();//订单有一个Map
			//2.获取每个订单项对应的商品详情
			if(order.getItems()!=null&&order.getItems().size()>0){
				orderItems=order.getItems();
				for(TblOrderItem orderItem:orderItems){
					Integer goodsId = orderItem.getGoodsId();
					TblGoods tblgoods = tblGoodsDao.findByGoodsId(goodsId);
					goodsDetail.put(orderItem, tblgoods);
					System.out.println("商品详情"+tblgoods);
					System.out.println(goodsDetail.get(orderItem).getGoodsPic());
				}
			}
			session.setAttribute("order", order);
			session.setAttribute("goodsDetail", goodsDetail);
		}
		if(op==1){
			out.write("pingjia_xiangqing");//评价详情
		}else{
			out.write("pingjia");//添加评价信息
		}
	}

	/**
	 * 评价成功后，从评价界面跳回我的订单时修改该订单状态
	 * @param orderId
	 * @param model
	 * @return 
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/updateOrderTag1.do")
	public String updateOrderTag(Integer orderId,Integer pingjiamanyidu,String pingjianeirong,HttpSession session,Model model) throws IOException {
		if(orderId!=null&&!"".equals(pingjiamanyidu)&&!"".equals(pingjianeirong)){
			String tag ="已评价";
			Timestamp Pingjiashijian = new Timestamp(System.currentTimeMillis());
			int result = orderBiz.updateOrderManyiduByOrderId(tag,pingjiamanyidu,pingjianeirong,Pingjiashijian,orderId);
			System.out.println(result);
			if(result>0){
				//将评价内容插入评价表
				TblUser user = (TblUser) session.getAttribute("loginedUser");
				
				List<Integer> goodsIdList=orderitemBiz.findGoodsId(orderId);
				List<TblOpinion> opinionList= new ArrayList<TblOpinion>();
				
				for(int goodsId:goodsIdList) {
					TblOpinion opinion = new TblOpinion(null, goodsId, pingjianeirong, user.getUserId(), pingjiamanyidu, Pingjiashijian);
					opinionList.add(opinion);
				}
				
				opinionList=opinionBiz.insertOpinion(opinionList);
				
				return find_allorder("全部订单",session,model);
			}
		}
		return "forward/user_center_info";
	}
	
	
	/**
	 * 订单详情
	 * @return
	 */
	@RequestMapping("/orderDetails.do")
	public String orderDetails( HttpServletRequest request,Integer orderId ){
		
		System.out.println("---------opopopopooooooooo--------"+orderId);
		
		List<Object[]> orderDetails = orderBiz.findorderDetails(orderId);
		
		for (int i = 0; i < orderDetails.size(); i++) {
			System.out.println("-------orderDetails--------"+orderDetails.get(i)[0]);
		}
		
		request.setAttribute("orderDetails", orderDetails);
		return "back/order_detailed";
		
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping("/transaction.do")
	public String transaction( HttpServletRequest request,Integer orderId ){
		System.out.println("=========transaction============");
		List<TblOrder> allOrderlist = orderBiz.findAllOrder();
		
		int Jan = 0;
		int Feb = 0;
		int Mar = 0;
		int Apr = 0;
		int May = 0;
		int Jun = 0;
		int Jul = 0;
		int Aug = 0;
		int Sep = 0;
		int Oct = 0;
		int Nov = 0;
		int Dec = 0;
		
		for (int i = 0; i < allOrderlist.size(); i++) {
		
			if((allOrderlist.get(i).getOrderDate().getMonth()+1) == 1){
				Jan++;
			}else if((allOrderlist.get(i).getOrderDate().getMonth()+1) == 2){
				Feb++;
			}else if((allOrderlist.get(i).getOrderDate().getMonth()+1) == 3){
				Mar++;
			}else if((allOrderlist.get(i).getOrderDate().getMonth()+1) == 4){
				Apr++;
			}else if((allOrderlist.get(i).getOrderDate().getMonth()+1) == 5){
				May++;
			}else if((allOrderlist.get(i).getOrderDate().getMonth()+1) == 6){
				Jun++;
			}else if((allOrderlist.get(i).getOrderDate().getMonth()+1) == 7){
				Jul++;
			}else if((allOrderlist.get(i).getOrderDate().getMonth()+1) == 8){
				Aug++;
			}else if((allOrderlist.get(i).getOrderDate().getMonth()+1) == 9){
				Sep++;
			}else if((allOrderlist.get(i).getOrderDate().getMonth()+1) == 10){
				Oct++;
			}else if((allOrderlist.get(i).getOrderDate().getMonth()+1) == 11){
				Nov++;
			}else if((allOrderlist.get(i).getOrderDate().getMonth()+1) == 12){
				Dec++;
			}
		}
		
		request.setAttribute("Jan", Jan);
		request.setAttribute("Feb", Feb);
		request.setAttribute("Mar", Mar);
		request.setAttribute("Apr", Apr);
		request.setAttribute("May", May);
		request.setAttribute("Jun", Jun);
		request.setAttribute("Jul", Jul);
		request.setAttribute("Aug", Aug);
		request.setAttribute("Sep", Sep);
		request.setAttribute("Oct", Oct);
		request.setAttribute("Nov", Nov);
		request.setAttribute("Dec", Dec);
		
		return "/back/transaction";
		
	}

}
