package com.yc.freshmarket.controller;

import javax.annotation.Resource;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.freshmarket.domain.TblUser;
import com.yc.freshmarket.domain.TblUserDao;

@Controller
@EnableAutoConfiguration
public class HelloController {
	
	@Resource
	TblUserDao dao;
	
	@RequestMapping("/login")
	String login(){
		return "/forward/login";
	}
	
	@RequestMapping("/cart")
	String cart(){
		return "/forward/cart";
	}
	

}
