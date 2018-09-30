package com.yc.freshmarket.domain;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity	//实体类注解
@Table(name="tbl_opinion")	// 配置表名
public class TblOpinion {
	@Id	//注解注解
	@GeneratedValue(strategy=GenerationType.AUTO)	//配置主键值的生成机制
	private Integer	opinionId;
	private Integer	goodsId;
	private String content;
	private Integer	userId;
	private Integer	satisfy;
	private Timestamp date;
	
	
	public TblOpinion(Integer opinionId, Integer goodsId, String content, Integer userId, Integer satisfy,
			Timestamp date) {
		super();
		this.opinionId = opinionId;
		this.goodsId = goodsId;
		this.content = content;
		this.userId = userId;
		this.satisfy = satisfy;
		this.date = date;
	}
	public Integer getOpinionId() {
		return opinionId;
	}
	public void setOpinionId(Integer opinionId) {
		this.opinionId = opinionId;
	}
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getSatisfy() {
		return satisfy;
	}
	public void setSatisfy(Integer satisfy) {
		this.satisfy = satisfy;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "TblOpinion [opinionId=" + opinionId + ", goodsId=" + goodsId + ", content=" + content + ", userId="
				+ userId + ", satisfy=" + satisfy + ", date=" + date + "]";
	}
	
	

}
