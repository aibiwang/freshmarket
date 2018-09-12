package com.yc.freshmarket.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.freshmarket.domain.TblUser;
import com.yc.freshmarket.service.UserBizImpl;

@Controller
@EnableAutoConfiguration
public class UserController {
	
	@Resource
	UserBizImpl userBizImpl;
	
	/**
	 * 登录
	 * @param username
	 * @param pwd
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("login.do")
	public String login(String username, String pwd, HttpSession session, Model model){
		
		TblUser user = userBizImpl.login(username, pwd);
		
		if(user!=null){								//登录成功
			return "/forward/user_center_info";
		}else{										//登录失败
			return "redirect:login.jsp";	
		}
		
	}

}
