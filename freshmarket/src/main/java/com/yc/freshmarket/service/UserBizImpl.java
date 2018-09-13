package com.yc.freshmarket.service;

import java.util.Random;

import javax.annotation.Resource;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Service;

import com.yc.freshmarket.domain.TblUser;
import com.yc.freshmarket.domain.TblUserDao;

@Service
@EnableAutoConfiguration
public class UserBizImpl implements UserBiz{

	@Resource
	TblUserDao dao;
	/**
	 * 登录
	 */
	@Override
	public TblUser login(String name, String pwd) {
		TblUser user = dao.findByUserNameAndUserPwd(name, pwd);
		return user;
	}

	/**
	 * 注册
	 */
	@Override
	public TblUser register(TblUser user) {
		Random rd = new Random();
		int cartId = rd.nextInt(10000000)+100000;
		user.setCartId(cartId);
//		 int result = dao.regester(user);
		 System.out.println(dao.save(user));
		return dao.save(user);
	}

	@Override
	public TblUser checkName(String username) {
		TblUser user = dao.findByUserName(username);
		if(user!=null){
			return user;
		}
		return null;
	}

}
