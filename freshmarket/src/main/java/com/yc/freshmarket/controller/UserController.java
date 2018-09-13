package com.yc.freshmarket.controller;

import java.io.IOException;
import java.io.Writer;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yc.freshmarket.domain.TblUser;
import com.yc.freshmarket.service.UserBiz;
import com.yc.freshmarket.utils.SHA;

@Controller
@EnableAutoConfiguration
public class UserController {
	
	@Resource
	private UserBiz userBiz;
	
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
		pwd = SHA.applySha256(pwd);
		TblUser user = userBiz.login(username, pwd);
		if(user!=null){								//登录成功
			session.setAttribute("loginedUser", user);
			return "/forward/user_center_info";
		}else{										//登录失败
			model.addAttribute("msg", "用户名或密码错误");
			return "/forward/login";	
		}
	}
	
	@RequestMapping("loginout.do")
	public String loginOut(HttpSession session){
		if(session.getAttribute("loginedUser")!=null){
			session.removeAttribute("loginedUser");
			return "/forward/login";
		}
		return "/forward/index";
	}
	/**
	 * 组测试检验用户名是否已经存在
	 * @param username
	 * @param out
	 * @throws IOException
	 */
	@RequestMapping(path="checkName.do",method=RequestMethod.POST)
	public void checkName(@Param("username")String username,Writer out) throws IOException{
		if(!"".equals(username)&& !username.isEmpty()){
			TblUser user = userBiz.checkName(username);
			if(user!=null){
				out.write("username is exist!!!");
			}
		}
	}
	
	/**
	 * 用户注册
	 * @param username
	 * @param pwd
	 * @param model
	 * @return
	 */
	@RequestMapping("register.do")
	public String register(String username, String pwd,String phone,Model model){
		//通过SHA加密
		pwd = SHA.applySha256(pwd);
		
		TblUser user = new TblUser();
		user.setUserName(username);
		user.setUserPwd(pwd);
		user.setUserPhone(phone);
		
		TblUser userresult = userBiz.register(user);
		
		if(userresult!=null){						//注册成功
			return "/forward/login";
		}else{										//注册失败
			return "/forward/register";	
		}
		
	}
	

}
