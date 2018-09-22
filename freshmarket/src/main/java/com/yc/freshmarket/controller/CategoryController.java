package com.yc.freshmarket.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.freshmarket.domain.TblCategory;
import com.yc.freshmarket.service.CategoryBiz;

@Controller
@EnableAutoConfiguration
public class CategoryController {

	@Resource
	CategoryBiz categoryBiz;
	
	@RequestMapping("addCategory.do")
	public String addCategory(TblCategory tblCategory,HttpServletRequest request){
		
		categoryBiz.addCategory(tblCategory);
		
		request.setAttribute("msg", "添加类型成功！！！");
		
		return "/back/product-category-add";
		
	}
}
