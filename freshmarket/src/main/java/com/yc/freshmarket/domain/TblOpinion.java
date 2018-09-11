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
	private Integer	orderId;
	private String content;
	private Integer	satisfy;
	private Timestamp opinionDate;
	
	@Override
	public String toString() {
		return "TblOpinion [opinionId=" + opinionId + ", orderId=" + orderId + ", content=" + content + ", satisfy="
				+ satisfy + ", opinionDate=" + opinionDate + "]";
	}

	public Integer getOpinionId() {
		return opinionId;
	}

	public void setOpinionId(Integer opinionId) {
		this.opinionId = opinionId;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getSatisfy() {
		return satisfy;
	}

	public void setSatisfy(Integer satisfy) {
		this.satisfy = satisfy;
	}

	public Timestamp getOpinionDate() {
		return opinionDate;
	}

	public void setOpinionDate(Timestamp opinionDate) {
		this.opinionDate = opinionDate;
	}

}
