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
	private TblUserDao dao;
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
		user.setUserAddr("我是地球人");
		user.setUserType("普通用户");
		user.setUserMoney(0.00);
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

	@Override
	public TblUser updatePhone(TblUser user) {
		return dao.saveAndFlush(user);
	}

	@Override
	public TblUser updatePwd(TblUser user) {
		return dao.saveAndFlush(user);
	}

	@Override
	public TblUser updateAddr(TblUser user) {
		return dao.saveAndFlush(user);
	}

	@Override
	public int usertotal() {
		return dao.usertotal();
	}

	@Override
	public TblUser updateEmail(TblUser user) {
		return dao.saveAndFlush(user);
	}

	@Override
	public TblUser updateName(TblUser user) {
		return dao.saveAndFlush(user);
	}

}
