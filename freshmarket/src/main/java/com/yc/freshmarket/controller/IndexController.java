package com.yc.freshmarket.controller;

import javax.annotation.Resource;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.freshmarket.service.GoodsBiz;

@Controller
@EnableAutoConfiguration
public class IndexController {

	@Resource
	GoodsBiz goodBiz;
	
	@RequestMapping("/index")
	public String index(Model model) {
		
		System.out.println(goodBiz.findAllGoods());
		model.addAttribute("allGoods",goodBiz.findAllGoods());
		
		return "forward/index";
	}
	
}
