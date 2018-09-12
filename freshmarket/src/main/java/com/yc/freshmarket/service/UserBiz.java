package com.yc.freshmarket.service;

import com.yc.freshmarket.domain.TblUser;

/**
 * UserBiz			用户接口
 * @author liu-pc
 *
 */
public interface UserBiz {

	/**
	 * 用户登录
	 * @param name
	 * @param pwd
	 * @return
	 */
	public TblUser login(String name, String pwd);


}
