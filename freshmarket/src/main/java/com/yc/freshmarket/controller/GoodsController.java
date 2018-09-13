package com.yc.freshmarket.controller;

import javax.annotation.Resource;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.freshmarket.service.GoodsBiz;

@Controller
@EnableAutoConfiguration
public class GoodsController {

	@Resource
	GoodsBiz goodsBiz;
	
	@RequestMapping("/detail.do")
	public String goodsDetail(Integer goodsId,Model model) {
		
		model.addAttribute("DetailGoods",goodsBiz.findTblGoodsBygoodsId(goodsId));
		
		return "forward/detail";
		
	}
}
