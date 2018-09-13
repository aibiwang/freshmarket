package com.yc.freshmarket.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.freshmarket.domain.TblGoods;
import com.yc.freshmarket.service.GoosBizImpl;

@Controller
@EnableAutoConfiguration
public class GoodsController {

	@Resource
	GoosBizImpl goosBizImpl;
	
	@RequestMapping("/addGoods.do")
	public void addGoods(TblGoods tblGoods,HttpServletRequest request,HttpSession session ){
		
		System.out.println("----------------------"+tblGoods);
		
		
		
		
	}
	
	
}
