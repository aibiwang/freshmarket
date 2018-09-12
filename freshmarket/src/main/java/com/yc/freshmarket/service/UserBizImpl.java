package com.yc.freshmarket.service;

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

}
