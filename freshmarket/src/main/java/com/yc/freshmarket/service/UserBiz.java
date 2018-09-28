package com.yc.freshmarket.service;

import com.yc.freshmarket.domain.TblUser;

/**
 * UserBiz			用户接口
 * @author liu-pc
 *
 */
public interface UserBiz {

	/**
	 * 查询用户总数
	 * @return
	 */
	public int usertotal();
	
	/**
	 * 用户登录
	 * @param name
	 * @param pwd
	 * @return
	 */
	public TblUser login(String name, String pwd);

	/**
	 * 注册
	 * @param user
	 * @return
	 */
	public TblUser register(TblUser user);

	/**
	 * 检验用户名是否可用
	 * @param username
	 * @return
	 */
	public TblUser checkName(String username);

	/**
	 * 修改手机号
	 * @param user
	 * @return
	 */
	public TblUser updatePhone(TblUser user);

	/**
	 * 修改用户密码
	 * @param user
	 * @return
	 */
	public int updatePwd(String pwd, String phone);

	/**
	 * 修改地址
	 * @param user
	 * @return
	 */
	public TblUser updateAddr(TblUser user);
	
	/**
	 * 修改邮箱
	 * @param user
	 * @return
	 */
	public TblUser updateEmail(TblUser user);
	
	/**
	 * 修改用户名
	 * @param user
	 * @return
	 */
	public TblUser updateName(TblUser user);

	/**
	 * 手机获取验证码
	 * @param phone
	 * @return
	 */
	public TblUser findByPhone(String phone);

	/**
	 * 生成验证码
	 * @return
	 */
	public String getCode();

	/**
	 * 手机号存在发送验证码
	 * @param phone
	 * @param code
	 * @return
	 */
	public int sendMsg(String phone, String code);

	/**
	 * 修改管理员密码
	 * @param user
	 * @return
	 */
	public TblUser updateMagPwd(TblUser user);


}
