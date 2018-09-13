package com.yc.freshmarket.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.freshmarket.domain.TblUser;
import com.yc.freshmarket.service.GoodsBiz;
import com.yc.freshmarket.service.OrderBizImpl;

@Controller
@EnableAutoConfiguration
public class OrderController {

	@Resource
	OrderBizImpl orderBizImpl;
	@Resource
	GoodsBiz goodsBiz;
	
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
}
