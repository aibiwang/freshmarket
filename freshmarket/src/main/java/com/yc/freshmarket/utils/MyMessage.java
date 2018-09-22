/**
 * @author Tony
 * @date 2018-01-10
 * @project rest_demo
 */
package com.yc.freshmarket.utils;

public class MyMessage {

	static AbsRestClient InstantiationRestAPI() {
		return new JsonReqClient();
	}

	public static String testSendSms(String sid, String token, String appid, String templateid, String param,
			String mobile, String uid) {
		String result=null;
		
		try {
		    result= InstantiationRestAPI().sendSms(sid, token, appid, templateid, param, mobile, uid);
			System.out.println("Response content is: " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public static void testSendSmsBatch(String sid, String token, String appid, String templateid, String param,
			String mobile, String uid) {
		try {
			String result = InstantiationRestAPI().sendSmsBatch(sid, token, appid, templateid, param, mobile, uid);
			System.out.println("Response content is: " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void testAddSmsTemplate(String sid, String token, String appid, String type, String template_name,
			String autograph, String content) {
		try {
			String result = InstantiationRestAPI().addSmsTemplate(sid, token, appid, type, template_name, autograph,
					content);
			System.out.println("Response content is: " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void testGetSmsTemplate(String sid, String token, String appid, String templateid, String page_num,
			String page_size) {
		try {
			String result = InstantiationRestAPI().getSmsTemplate(sid, token, appid, templateid, page_num, page_size);
			System.out.println("Response content is: " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void testEditSmsTemplate(String sid, String token, String appid, String templateid, String type,
			String template_name, String autograph, String content) {
		try {
			String result = InstantiationRestAPI().editSmsTemplate(sid, token, appid, templateid, type, template_name,
					autograph, content);
			System.out.println("Response content is: " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void testDeleterSmsTemplate(String sid, String token, String appid, String templateid) {
		try {
			String result = InstantiationRestAPI().deleterSmsTemplate(sid, token, appid, templateid);
			System.out.println("Response content is: " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param mobile 接收者电话
	 * @param param  验证码
	 */
	public String sendMessage(String mobile,String param) {

		String sid = "c53ad2ecebc31afed105407e4db23a73";// 账号
		String token = "27e806ad6f2f87787f500dba9b028ef1";// 密码
		String appid = "280e6b982f3940eaa27495ed8614236c";// 项目（应用）编号
		//  280e6b982f3940eaa27495ed8614236c 
		//  4ab6303335e9481e83622c061a7f45f9
		String templateid = "353177";// 模板编号 :353177    353190
		//String param = "jam";// 替换内容:数组
		//String mobile = "18570935120";// 目标号码
		String uid = "";// 选填
		String result=testSendSms(sid, token, appid, templateid, param, mobile, uid);
		return result;
	}
}
