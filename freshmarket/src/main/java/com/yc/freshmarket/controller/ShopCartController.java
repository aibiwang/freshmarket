package com.yc.freshmarket.controller;

import java.io.IOException;
import java.io.Writer;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.freshmarket.domain.TblGoods;
import com.yc.freshmarket.domain.TblOrder;
import com.yc.freshmarket.domain.TblOrderItem;
import com.yc.freshmarket.domain.TblShopCart;
import com.yc.freshmarket.domain.TblUser;
import com.yc.freshmarket.service.GoodsBiz;
import com.yc.freshmarket.service.OrderBiz;
import com.yc.freshmarket.service.OrderitemBiz;
import com.yc.freshmarket.service.ShopcartBiz;

@Controller
@EnableAutoConfiguration
public class ShopCartController {

	@Resource
	ShopcartBiz shopcartBiz;
	@Resource
	GoodsBiz goodsBiz;
	@Resource
	OrderBiz orderBiz;
	@Resource
	OrderitemBiz orderitemBiz;
	
	/**
	 * 添加购物车方法
	 * @param session
	 * @param goodsId
	 * @param writer
	 * @throws IOException
	 */
	 @ResponseBody
	@RequestMapping(path="/addToCart.do")
	public void addToCart(HttpSession session,Integer goodsId,Writer writer) throws IOException {
		TblUser user = (TblUser) session.getAttribute("loginedUser");
		if(user==null) {
			writer.write("请先登录");
		}else {
			Integer cartId = user.getCartId();	
			String msg=shopcartBiz.addToCart(cartId, goodsId);
			writer.write(msg);
		}
		
		
	}
	/**
	 * 查看我的购物车
	 * @param session
	 * @param model
	 * @param writer
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/myCart.do")
	public String myCart(HttpSession session,Model model,Writer writer) throws IOException {
		
		TblUser user = (TblUser) session.getAttribute("loginedUser");
		if(user==null) {
			writer.write("请先登录");
			return null;
		}else {
			List<TblShopCart> ShopCarts = shopcartBiz.findCartById(user.getCartId());
			System.out.println(ShopCarts);
			
			Map<Object,Object> map = new HashMap<Object, Object>();
			for(TblShopCart ShopCart:ShopCarts) {
				TblGoods goods =goodsBiz.findTblGoodsBygoodsId(ShopCart.getGoodsId());
				map.put(ShopCart.getGoodsId(), goods);
				
			}
			System.out.println(map);
			model.addAttribute("ShopCarts",ShopCarts);
			model.addAttribute("map",map);
			model.addAttribute("ShopCartSize",ShopCarts.size());
			return "forward/cart";
		}
		
		
	}
	
	/**
	 * 删除购物车子项
	 * @param cartItemId
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/delShopCartItem.do")
	public void delShopCartItem(Integer cartItemId,Model model,Writer writer) throws IOException {
		
		shopcartBiz.delShopCart(cartItemId);
		writer.write("删除成功");
	}
	
	/**
	 * 修改商品数量
	 * @param cartItemId
	 * @param model
	 * @param writer
	 * @throws IOException
	 */
	@RequestMapping("/changeNum.do")
	public void changeNum(String cartItemId,String flag,Model model,Writer writer) throws IOException {
		
		shopcartBiz.changeNum(Integer.parseInt(cartItemId),flag);
		
		double num = shopcartBiz.getNum(Integer.parseInt(cartItemId));
		
		writer.write(""+num);
	}
	
	/**
	 * 通过购物车去结算
	 * @param session
	 * @param model
	 * @param writer
	 * @return
	 * @throws IOException
	 */
	@Transactional
	@RequestMapping("/cartOrder.do")
	public String cartOder(HttpSession session,String totalPrice,Model model) throws IOException {
		
		TblUser user = (TblUser) session.getAttribute("loginedUser");

		//总价
		double totalPrices=Double.parseDouble(totalPrice);
		
		//将购物车的记录存到订单子项中
		TblOrder tblOrder = new TblOrder();
		tblOrder.setOrderDate(new Timestamp(System.currentTimeMillis()));
		tblOrder.setOrderTotalprice(totalPrices);
		tblOrder.setReceiverAddr(user.getUserAddr());
		tblOrder.setReceiverName(user.getUserName());
		tblOrder.setReceiverPhone(user.getUserPhone());
		//订单状态
		tblOrder.setTag("待支付");
		tblOrder.setUserId(user.getUserId());
		//插入订单
		tblOrder=orderBiz.insertOrder(tblOrder);
		
		List<TblShopCart> ShopCarts = shopcartBiz.findCartById(user.getCartId());

		List<TblOrderItem> orderItems= new ArrayList<TblOrderItem>();
		Map<Object,Object> map = new HashMap<Object, Object>();
		for(TblShopCart ShopCart:ShopCarts) {
			TblGoods goods =goodsBiz.findTblGoodsBygoodsId(ShopCart.getGoodsId());
			map.put(ShopCart.getGoodsId(), goods);
			
			//生成订单子项
			TblOrderItem orderItem = new TblOrderItem();
			orderItem.setOrderId(tblOrder.getOrderId());
			orderItem.setGoodsId(ShopCart.getGoodsId());
			orderItem.setGoodscount(ShopCart.getGoodscount());
			orderItem.setOrderitemTotalprice((ShopCart.getGoodscount())*(goods.getSaleprice()));
			orderItems.add(orderItem);

		}
		//插入订单子项
		orderitemBiz.insertOrderitem(orderItems);
		
		model.addAttribute("ShopCarts",ShopCarts);
		model.addAttribute("map",map);
		model.addAttribute("ShopCartSize",ShopCarts.size());
		model.addAttribute("receiverAddr",user.getUserAddr());
		model.addAttribute("receiverName",user.getUserName());
		model.addAttribute("orderId", tblOrder.getOrderId());
		return "forward/cart_order";

	}
	
	/**
	 * 选择购物车中的商品进行结算
	 * @param params
	 * @param session
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@Transactional
	@RequestMapping("/goPay.do")
	public String goPay(String params,String totalPrice,HttpSession session,Model model) throws IOException {
		
		TblUser user = (TblUser) session.getAttribute("loginedUser");
		
		String[] sCartItemsIds=params.split(",");
		//总价
		double totalPrices =Double.parseDouble(totalPrice);
		List<Integer> cartItemIds=new ArrayList<Integer>();
		
		for(String s:sCartItemsIds) {
			cartItemIds.add(Integer.parseInt(s));
		}
		
		List<TblShopCart> ShopCarts = shopcartBiz.findByCartitemIds(cartItemIds);
		
		if(ShopCarts.size()==ShopCarts.size()) {
			//将购物车的记录存到订单子项中
			TblOrder tblOrder = new TblOrder();
			tblOrder.setOrderDate(new Timestamp(System.currentTimeMillis()));
			tblOrder.setOrderTotalprice(totalPrices);
			tblOrder.setReceiverAddr(user.getUserAddr());
			tblOrder.setReceiverName(user.getUserName());
			tblOrder.setReceiverPhone(user.getUserPhone());
			//订单状态
			tblOrder.setTag("待支付");
			tblOrder.setUserId(user.getUserId());
			//插入订单
			tblOrder=orderBiz.insertOrder(tblOrder);
			
			List<TblOrderItem> orderItems= new ArrayList<TblOrderItem>();
			
			Map<Object,Object> map = new HashMap<Object, Object>();
			for(TblShopCart ShopCart:ShopCarts) {
				TblGoods goods =goodsBiz.findTblGoodsBygoodsId(ShopCart.getGoodsId());
				map.put(ShopCart.getGoodsId(), goods);
				
				//生成订单子项
				TblOrderItem orderItem = new TblOrderItem();
				orderItem.setOrderId(tblOrder.getOrderId());
				orderItem.setGoodsId(ShopCart.getGoodsId());
				orderItem.setGoodscount(ShopCart.getGoodscount());
				orderItem.setOrderitemTotalprice((ShopCart.getGoodscount())*(goods.getSaleprice()));
				orderItems.add(orderItem);
				
			}
			//插入订单子项
			orderitemBiz.insertOrderitem(orderItems);
			
			model.addAttribute("ShopCarts",ShopCarts);
			model.addAttribute("map",map);
			model.addAttribute("ShopCartSize",ShopCarts.size());
			model.addAttribute("receiverAddr",user.getUserAddr());
			model.addAttribute("receiverName",user.getUserName());
			model.addAttribute("orderId", tblOrder.getOrderId());
			return "forward/cart_order";
			
		}else {
			return null;
		}
		
	}
	
	
}
