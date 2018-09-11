package com.yc.freshmarket.domain;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Table;
@Entity	//实体类注解
@Table(name="tbl_goods")	// 配置表名
public class TblGoods {
	private Integer	goodsId;
	private String	goodsName;
	private double	inprice;
	private double	saleprice;
	private Integer	categoryId;
	private Integer	goodsReservenum;
	private String	goodsDesc;
	private Timestamp goodsPutdate;
	private String	goodsPutstatus;
	
	@Override
	public String toString() {
		return "TblGoods [goodsId=" + goodsId + ", goodsName=" + goodsName + ", inprice=" + inprice + ", saleprice="
				+ saleprice + ", categoryId=" + categoryId + ", goodsReservenum=" + goodsReservenum + ", goodsDesc="
				+ goodsDesc + ", goodsPutdate=" + goodsPutdate + ", goodsPutstatus=" + goodsPutstatus + "]";
	}

	public Integer getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public double getInprice() {
		return inprice;
	}

	public void setInprice(double inprice) {
		this.inprice = inprice;
	}

	public double getSaleprice() {
		return saleprice;
	}

	public void setSaleprice(double saleprice) {
		this.saleprice = saleprice;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Integer getGoodsReservenum() {
		return goodsReservenum;
	}

	public void setGoodsReservenum(Integer goodsReservenum) {
		this.goodsReservenum = goodsReservenum;
	}

	public String getGoodsDesc() {
		return goodsDesc;
	}

	public void setGoodsDesc(String goodsDesc) {
		this.goodsDesc = goodsDesc;
	}

	public Timestamp getGoodsPutdate() {
		return goodsPutdate;
	}

	public void setGoodsPutdate(Timestamp goodsPutdate) {
		this.goodsPutdate = goodsPutdate;
	}

	public String getGoodsPutstatus() {
		return goodsPutstatus;
	}

	public void setGoodsPutstatus(String goodsPutstatus) {
		this.goodsPutstatus = goodsPutstatus;
	}

}
