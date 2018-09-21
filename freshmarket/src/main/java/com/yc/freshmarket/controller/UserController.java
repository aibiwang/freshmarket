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
import com.yc.freshmarket.domain.TblUserDao;
import com.yc.freshmarket.service.UserBiz;
import com.yc.freshmarket.service.UserBizImpl;
import com.yc.freshmarket.utils.SHA;

@Controller
@EnableAutoConfiguration
public class UserController {
	
	@Resource(name="userBizImpl")
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
		System.out.println("------------------"+user);
		
		if(user!=null){								//登录成功
			session.setAttribute("loginedUser", user);
			
			if((user.getUserType().equals("普通用户"))){
				return "/forward/user_center_info";
			}else{
				return "/back/index";
			}
			
			
			
			
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
	 * 注册检验用户名是否已经存在
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

	/**
	 * 更改手机号码
	 * @param phone
	 * @param session
	 * @param out
	 * @throws IOException
	 */
	@RequestMapping(path="updatePhone.do",method=RequestMethod.POST)
	public void updatePhone(@Param("phone")String phone,HttpSession session,Writer out) throws IOException{
		TblUser user = (TblUser)session.getAttribute("loginedUser");
		if(!"".equals(phone)&& !phone.isEmpty()&&!user.getUserPhone().equals(phone)){
			user.setUserPhone(phone);
			TblUser updateUser = userBiz.updatePhone(user);
			if(updateUser!=null){
				out.write("update phone seccess");
			}
		}else{
			out.write("update phone fail");
		}
	}
	
	/**
	 * 修改密码
	 * @param phone
	 * @param session
	 * @param out
	 * @throws IOException
	 */
	@RequestMapping(path="updatePwd.do",method=RequestMethod.POST)
	public void updatePwd(@Param("pwd")String pwd,HttpSession session,Writer out) throws IOException{
		TblUser user = (TblUser)session.getAttribute("loginedUser");
		if(!"".equals(pwd)&& !pwd.isEmpty()&&!user.getUserPwd().equals(pwd)){
			pwd = SHA.applySha256(pwd);
			user.setUserPwd(pwd);
			TblUser updateUser = userBiz.updatePwd(user);
			if(updateUser!=null){
				out.write("update pwd seccess");
			}
		}else{
			out.write("update pwd fail");
		}
	}
	
	/**
	 * 修改地址
	 * @param addr
	 * @param session
	 * @param out
	 * @throws IOException
	 */
	@RequestMapping(path="updateAddr.do",method=RequestMethod.POST)
	public void updateAddr(@Param("addr")String addr,HttpSession session,Writer out) throws IOException{
		TblUser user = (TblUser)session.getAttribute("loginedUser");
		if(!"".equals(addr)&& !addr.isEmpty()&&!user.getUserPwd().equals(addr)){
			user.setUserAddr(addr);
			TblUser updateUser = userBiz.updateAddr(user);
			if(updateUser!=null){
				out.write("update addr seccess");
			}
		}else{
			out.write("update addr fail");
		}
	}
	
	/**
	 * 修改邮箱
	 * @param email
	 * @param session
	 * @param out
	 * @throws IOException
	 */
	@RequestMapping(path="updateEmail.do",method=RequestMethod.POST)
	public void updateEmail(@Param("email")String email,HttpSession session,Writer out) throws IOException{
		TblUser user = (TblUser)session.getAttribute("loginedUser");
		if(!"".equals(email)&& !email.isEmpty()&&!user.getUserPwd().equals(email)){
			user.setUserEmail(email);
			TblUser updateUser = userBiz.updateAddr(user);
			if(updateUser!=null){
				out.write("update email seccess");
			}
		}else{
			out.write("update email fail");
		}
	}
	
	
	/**
	 * 修改用户名
	 * @param uname
	 * @param session
	 * @param out
	 * @throws IOException
	 */
	@RequestMapping(path="updateUname.do",method=RequestMethod.POST)
	public void updateUname(@Param("uname")String uname,HttpSession session,Writer out) throws IOException{
		TblUser user = (TblUser)session.getAttribute("loginedUser");
		if(!"".equals(uname)&& !uname.isEmpty()&&!user.getUserPwd().equals(uname)){
			user.setUserName(uname);
			TblUser updateUser = userBiz.updateAddr(user);
			if(updateUser!=null){
				out.write("update uname seccess");
			}
		}else{
			out.write("update uname fail");
		}
	}
	
	
	/**
	 * 管理员
	 * @return
	 */
	@RequestMapping("manage.do")
	public String manage(){
		return "/back/admin_info";
		
	}
	
}
