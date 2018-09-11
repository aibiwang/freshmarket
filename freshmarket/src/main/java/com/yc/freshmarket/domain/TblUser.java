package com.yc.freshmarket.domain;

import javax.persistence.*;

@Entity	//实体类注解
@Table(name="tbl_user")	// 配置表名
public class TblUser {

	@Id	//注解注解
	@GeneratedValue(strategy=GenerationType.AUTO)	//配置主键值的生成机制
	private Integer userId;
//	@Column
	private String	userName;
	private String	userPwd;
	private String	userType;
	private String	userPhone;
	private String	userEmail;
	private String	userAddr;
	private Integer	cartId;
	
	@Override
	public String toString() {
		return "TblUser [userId=" + userId + ", userName=" + userName + ", userPwd=" + userPwd + ", userType="
				+ userType + ", userPhone=" + userPhone + ", userEmail=" + userEmail + ", userAddr=" + userAddr
				+ ", cartId=" + cartId + "]";
	}
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public Integer getCartId() {
		return cartId;
	}
	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}
	
}
