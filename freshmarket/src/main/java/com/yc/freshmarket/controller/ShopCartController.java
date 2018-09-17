package com.yc.freshmarket.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Param;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.freshmarket.domain.TblGoods;
import com.yc.freshmarket.domain.TblShopCart;
import com.yc.freshmarket.domain.TblUser;
import com.yc.freshmarket.service.GoodsBiz;
import com.yc.freshmarket.service.ShopcartBiz;
import com.yc.freshmarket.service.ShopcartBizImpl;

@Controller
@EnableAutoConfiguration
public class ShopCartController {

	@Resource
	ShopcartBiz shopcartBiz;
	@Resource
	GoodsBiz goodsBiz;
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
	@RequestMapping("/cartOrder.do")
	public String cartOder(HttpSession session,Model model) throws IOException {
		
		TblUser user = (TblUser) session.getAttribute("loginedUser");

		List<TblShopCart> ShopCarts = shopcartBiz.findCartById(user.getCartId());

		Map<Object,Object> map = new HashMap<Object, Object>();
		for(TblShopCart ShopCart:ShopCarts) {
			TblGoods goods =goodsBiz.findTblGoodsBygoodsId(ShopCart.getGoodsId());
			map.put(ShopCart.getGoodsId(), goods);

		}
		System.out.println(map);
		model.addAttribute("ShopCarts",ShopCarts);
		model.addAttribute("map",map);
		model.addAttribute("ShopCartSize",ShopCarts.size());
		model.addAttribute("receiverAddr",user.getUserAddr());
		model.addAttribute("receiverName",user.getUserName());
		return "forward/cart_order";

	}
	
	@RequestMapping("/goPay.do")
	public String goPay(String params,HttpSession session,Model model) throws IOException {
		
		System.out.println(params);
		
		TblUser user = (TblUser) session.getAttribute("loginedUser");
		
		List<TblShopCart> ShopCarts = shopcartBiz.findCartById(user.getCartId());
		
		Map<Object,Object> map = new HashMap<Object, Object>();
		for(TblShopCart ShopCart:ShopCarts) {
			TblGoods goods =goodsBiz.findTblGoodsBygoodsId(ShopCart.getGoodsId());
			map.put(ShopCart.getGoodsId(), goods);
			
		}
		System.out.println(map);
		model.addAttribute("ShopCarts",ShopCarts);
		model.addAttribute("map",map);
		model.addAttribute("ShopCartSize",ShopCarts.size());
		model.addAttribute("receiverAddr",user.getUserAddr());
		model.addAttribute("receiverName",user.getUserName());
		return "forward/cart_order";
		
	}
	
	
}
