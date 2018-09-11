package com.yc.freshmarket.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity	//实体类注解
@Table(name="tbl_shopcart")	// 配置表名
public class TblShopCart {
	@Id	//注解注解
	private Integer	cartId;
	@Id	//注解注解
	private Integer	goodsId;
	private double	goodscount;
	
	@Override
	public String toString() {
		return "TblShopCart [cartId=" + cartId + ", goodsId=" + goodsId + ", goodscount=" + goodscount + "]";
	}

	public Integer getCartId() {
		return cartId;
	}

	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}

	public Integer getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public double getGoodscount() {
		return goodscount;
	}

	public void setGoodscount(double goodscount) {
		this.goodscount = goodscount;
	}
	
}
