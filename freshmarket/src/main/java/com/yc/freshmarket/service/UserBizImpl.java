package com.yc.freshmarket.service;

import java.util.Random;

import javax.annotation.Resource;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Service;

import com.yc.freshmarket.domain.TblUser;
import com.yc.freshmarket.domain.TblUserDao;
import com.yc.freshmarket.utils.MyMessage;

@Service
@EnableAutoConfiguration
public class UserBizImpl implements UserBiz{

	@Resource
	private TblUserDao dao;
	
	private final String[] authCode = { "a", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
			"p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" };

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

	/**
	 * 手机获取验证码
	 */
	@Override
	public TblUser findByPhone(String phone) {
		return dao.findByUserPhone(phone);
	}

	/**
	 * 获取验证码
	 * 
	 * @return
	 */
	@Override
	public String getCode() {
		String code = "";
		int strLength = 4;
		Random r = new Random();
		for (int i = 0; i < strLength; i++) {
			if (i / 2 == 0) {
				code += authCode[r.nextInt(authCode.length)];
			} else {
				code += authCode[r.nextInt(authCode.length)].toUpperCase();
			}
		}

		return code;
	}

	/**
	 * 
	 * @param tel
	 *            电话号码
	 * @param code
	 *            验证码
	 * @return 0：失败 1：成功
	 */
	@Override
	public int sendMsg(String phone, String code) {

		String mobile = phone;
		String param = code;
		MyMessage message = new MyMessage();
		System.out.println(phone+"----"+code+"\n"+message);
		String Result = message.sendMessage(mobile, param);
		System.out.println(Result);
		String[] value = Result.split(",");
		String[] val = value[0].split(":");

		System.out.println("返回码：" + val[1]);
		// 发送状态码
		if ("\"000000\"".equals(val[1])) {
			return 1;
		} else {
			return 0;
		}
	}

	@Override
	public int updatePwd(String pwd, String phone) {
		int result = dao.updatePwdByPhone(pwd,phone);
		return result;
	}

	@Override
	public TblUser updateMagPwd(TblUser user) {
		return dao.saveAndFlush(user);
	}

}
