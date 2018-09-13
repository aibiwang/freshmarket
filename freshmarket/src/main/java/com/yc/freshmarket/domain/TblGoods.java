package com.yc.freshmarket.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity	//实体类注解
@Table(name="tbl_goods")	// 配置表名
public class TblGoods {
	
	@Id	//注解注解
	@GeneratedValue(strategy=GenerationType.AUTO)	//配置主键值的生成机制	
	private Integer	goodsId;
	@Column
	private String	goodsName;
	private double	inprice;
	private double	saleprice;
	private Integer	categoryId;
	private Integer	goodsReservenum;
	private String	goodsDesc;
	private Timestamp goodsPutdate;
	private String	goodsPutstatus;
	private String goodsPic;
	

	public Integer getGoodsId() {
		return goodsId;
	}

	public String getGoodsPic() {
		return goodsPic;
	}

	public void setGoodsPic(String goodsPic) {
		this.goodsPic = goodsPic;
	}

	@Override
	public String toString() {
		return "TblGoods [goodsId=" + goodsId + ", goodsName=" + goodsName + ", inprice=" + inprice + ", saleprice="
				+ saleprice + ", categoryId=" + categoryId + ", goodsReservenum=" + goodsReservenum + ", goodsDesc="
				+ goodsDesc + ", goodsPutdate=" + goodsPutdate + ", goodsPutstatus=" + goodsPutstatus + ", goodsPic="
				+ goodsPic + "]";
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
