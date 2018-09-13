package com.yc.freshmarket.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.freshmarket.service.GoodsBiz;
import com.yc.freshmarket.domain.TblGoods;

@Controller
@EnableAutoConfiguration
public class GoodsController {

	@Resource
	private GoodsBiz goodsBiz;
	
	@RequestMapping("/detail.do")
	public String goodsDetail(Integer goodsId,Model model) {
		
		model.addAttribute("DetailGoods",goodsBiz.findTblGoodsBygoodsId(goodsId));
		
		return "forward/detail";
		
	}
	
	@RequestMapping("/addGoods.do")
	public void addGoods(TblGoods tblGoods,HttpServletRequest request,HttpSession session ){
		
		System.out.println("----------------------"+tblGoods);
		
	}
	
}
