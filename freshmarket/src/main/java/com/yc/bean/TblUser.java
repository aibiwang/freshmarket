package com.yc.bean;

import java.sql.Timestamp;

import javax.persistence.*;

@Entity	//实体类注解
@Table(name="tbl_user")	// 配置表名
public class TblUser {

	@Id	//注解注解
	@GeneratedValue(strategy=GenerationType.AUTO)	//配置主键值的生成机制
	private Integer uid;
	@Column
	private String uname;
	private String upass;
	private String head;
	private Timestamp regtime;
	private Integer gender;
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public Timestamp getRegtime() {
		return regtime;
	}
	public void setRegtime(Timestamp regtime) {
		this.regtime = regtime;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUcid() {
		return ucid;
	}
	public void setUcid(String ucid) {
		this.ucid = ucid;
	}
	public String getHead_path() {
		return head_path;
	}
	public void setHead_path(String head_path) {
		this.head_path = head_path;
	}
	private String tel;
	private String uemail;
	private String ucid;
	private String head_path;
}
