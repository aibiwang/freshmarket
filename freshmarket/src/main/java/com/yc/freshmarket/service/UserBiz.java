package com.yc.freshmarket.service;

import com.yc.freshmarket.domain.TblUser;


public interface UserBiz {

	public TblUser login(String name, String pwd);

	
}
