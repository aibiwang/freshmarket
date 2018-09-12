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
	
	@RequestMapping("/findAll")
	String findAll(Model m){
		m.addAttribute("list", dao.findAll());
		
		TblUser user = dao.findByUserNameAndUserPwd("k","1");
		
		
		m.addAttribute("user", user);
		
		
		
		return "allUser";
	}
	
    public static void main(String[] args) throws Exception {
        SpringApplication.run(HelloController.class, args);
        //运行之后在浏览器中访问：http://localhost:8080/hello
    }
}
