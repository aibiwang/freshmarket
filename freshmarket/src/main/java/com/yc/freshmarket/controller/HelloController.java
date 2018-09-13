package com.yc.freshmarket.controller;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@EnableAutoConfiguration
public class HelloController {
	/*
	@Resource
	TblUserDao dao;
	 */
	@RequestMapping("/hello2")
	@ResponseBody
	String home() {
		return "Hello ,spring boot!666";
	}

	@RequestMapping("/hello")
	String hello(){
		return "hello";
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

	//商品详情
	@RequestMapping("/index")
	String index(){
		return "/forward/index";
	}
	
	@RequestMapping("index.do")
	String index1(){
		return "/forward/index";
	}
}
