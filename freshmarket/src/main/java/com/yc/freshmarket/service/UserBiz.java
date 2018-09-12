package com.yc.freshmarket.service;

<<<<<<< HEAD
import com.yc.freshmarket.domain.TblUser;


public interface UserBiz {

	public TblUser login(String name, String pwd);
=======
import java.sql.Timestamp;

import javax.persistence.*;

@Entity	//实体类注解
@Table(name="tbl_user")	// 配置表名
public class UserBiz {

	@Id	//注解注解
	@GeneratedValue(strategy=GenerationType.AUTO)	//配置主键值的生成机制
	private Integer uid;
	@Column
	private String uname;
	private String upass;
	
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
>>>>>>> branch 'master' of https://github.com/aibiwang/freshmarket.git
	
}
