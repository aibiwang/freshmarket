package com.yc.freshmarket.utils;

public class Test {
	public static void main(String[] args) {
		
		/*【BBS】您的验证码为：{1}，3分钟内输入有效，请勿向他人泄露*/
		/*【验证码】您的{1}验证码为:{2}，3分钟内输入有效，请勿向他人泄露。*/
		
		String mobile="15198565317";
		String param="jam123";
		MyMessage message = new MyMessage();
		message.sendMessage(mobile,param);
	}
}
