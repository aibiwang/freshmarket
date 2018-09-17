package com.yc.freshmarket.controller;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@EnableAutoConfiguration
public class HelloController {

	/**
	 * 测试添加商品
	 */
	@RequestMapping("/TgoodsAdd.do")
	String goodsAdd(){
		return "/back/picture-add";
	}

	/**
	 * 修改商品信息
	 * @return
	 */
	@RequestMapping("/TgoodsUpdate.do")
	String goodsUpdate(){
		return "/back/picture-update";
	}

	/**
	 * 测试查看商品列表
	 */
	@RequestMapping("/TgoodsList.do")
	String goodsList(){
		return "/back/Products_List";
	}
	
	/**
	 * 测试backIndex
	 */
	@RequestMapping("/backIndex")
	String backIndex(){
		return "/back/index";
	}
	
	/**
	 * 打开home界面
	 * @return
	 */
	@RequestMapping("/home")
	String home(){
		return "/back/home";
	}

	@RequestMapping("/login")
	String login(){
		return "/forward/login";
	}


	@RequestMapping("/register")
	String register(){
		return "/forward/register";
	}


	//我的订单
	@RequestMapping("/user_center_order")
	String user_center_order(){
		return "/forward/user_center_order";
	}

	//用户中心
	@RequestMapping("/user_center_info")
	String user_center_info(){
		return "/forward/user_center_info";
	}

	//用户购物车
	@RequestMapping("/cart")
	String cart(){
		return "/forward/cart";
	}

	//用户地址
	@RequestMapping("/user_center_site")
	String user_center_site(){
		return "/forward/user_center_site";
	}

	//商品详情
	@RequestMapping("/detail")
	String detail(){
		return "/forward/detail";
	}

	//物流图
	@RequestMapping("/logistics")
	String logistics(){
		return "/forward/logistics";
	}
	
	//去结算
	@RequestMapping("/place_order")
	String place_order(){
		return "/forward/place_order";
	}
}
