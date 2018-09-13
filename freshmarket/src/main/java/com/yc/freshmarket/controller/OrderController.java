package com.yc.freshmarket.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.freshmarket.domain.TblUser;
import com.yc.freshmarket.service.GoodsBiz;
import com.yc.freshmarket.service.OrderBiz;

@Controller
@EnableAutoConfiguration
public class OrderController {

	@Resource
	OrderBiz orderBiz;
	@Resource
	GoodsBiz goodsBiz;
	
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
			System.out.println(user);
			model.addAttribute("goods",goodsBiz.findTblGoodsBygoodsId(goodsId));
			return "forward/order";
			
		}
	}
	
	
	@RequestMapping("/oderSubmit.do")
	public String oderSubmit(Model model,Integer goodsNum,String receiverName,String receiverTel,String receiverAddr,double siglePrice,String goodsName,String goodsPic,String orderTime) {
		
		model.addAttribute("goodsNum",goodsNum);
		model.addAttribute("receiverName",receiverName);
		model.addAttribute("receiverTel",receiverTel);
		model.addAttribute("receiverAddr",receiverAddr);
		model.addAttribute("siglePrice",siglePrice);
		model.addAttribute("goodsName",goodsName);
		model.addAttribute("orderTime",orderTime);
		model.addAttribute("goodsPic",goodsPic);
		model.addAttribute("totalMoney",siglePrice*goodsNum);
		
		return "forward/place_order";
		
	}
	
	
	
}
