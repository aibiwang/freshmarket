package com.yc.freshmarket.utils;

import java.security.MessageDigest;

public class SHA {
	
	/*应用sha256算法让一个输入转变成256位的hash值
	MD5加密 生成32位md5码 速度比较快 性能高 安全强度比sha1要低 
	SHA加密 生成40位SHA码 加密速度比md5慢 性能比md5低 安全强度比md5高*/
	
			public static String applySha256(String input){
				try {
					MessageDigest digest = MessageDigest.getInstance("SHA-256");
					byte[] hash = digest.digest(input.getBytes("UTF-8"));
					StringBuffer hexString = new StringBuffer();
					for (int i = 0; i < hash.length; i++) {
						String hex = Integer.toHexString(0xff & hash[i]);
						if(hex.length() == 1) hexString.append('0');
						hexString.append(hex);
					}
					return hexString.toString();
				}
				catch(Exception e) {
					throw new RuntimeException(e);
				}
			}
			/*public static void main(String[] args) {
				String sha = "jam";
				Scanner sc = new Scanner(System.in);
				String loginStr = sc.next();
				loginStr = SHA.applySha256(loginStr);
				sha=SHA.applySha256(sha);
				if(loginStr.equals(sha)){
					System.out.println("登录成功");
				}else{
					System.out.println("登陆失败");
				}
				//循环加密
				for(int i= 0;i<10;i++){
					System.out.println(SHA.applySha256(sha));
					sha=SHA.applySha256(sha);
				}
			}*/
}
