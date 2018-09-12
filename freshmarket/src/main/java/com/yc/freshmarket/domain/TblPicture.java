package com.yc.freshmarket.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity	//实体类注解
@Table(name="tbl_picture")	// 配置表名
public class TblPicture {
	@Id	//注解注解
	@GeneratedValue(strategy=GenerationType.AUTO)	//配置主键值的生成机制
	private Integer	picId;
	private String	picName;
	private Integer	goodsId;
	
	@Override
	public String toString() {
		return "TblPicture [picId=" + picId + ", picName=" + picName + ", goodsId=" + goodsId + "]";
	}

	public Integer getPicId() {
		return picId;
	}

	public void setPicId(Integer picId) {
		this.picId = picId;
	}

	public String getPicName() {
		return picName;
	}

	public void setPicName(String picName) {
		this.picName = picName;
	}

	public Integer getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	
}
