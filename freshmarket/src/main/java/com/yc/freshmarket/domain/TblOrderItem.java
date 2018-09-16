package com.yc.freshmarket.domain;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity	//实体类注解
@Table(name="tbl_orderitem")	// 配置表名
public class TblOrderItem {
	@Id	//注解注解
	@GeneratedValue(strategy=GenerationType.AUTO)	//配置主键值的生成机制
	private Integer	orderitemId;
	private Integer	orderId;
	private Integer	goodsId;
	private Integer	goodscount;
	private double	orderitemTotalprice;

	@Override
	public String toString() {
		return "TblOrderItem [orderitemId=" + orderitemId + ", orderId=" + orderId + ", goodsId=" + goodsId
				+ ", goodscount=" + goodscount + ", orderitemTotalprice=" + orderitemTotalprice + "]";
	}

	public Integer getOrderitemId() {
		return orderitemId;
	}

	public void setOrderitemId(Integer orderitemId) {
		this.orderitemId = orderitemId;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public Integer getGoodscount() {
		return goodscount;
	}

	public void setGoodscount(Integer goodscount) {
		this.goodscount = goodscount;
	}

	public double getOrderitemTotalprice() {
		return orderitemTotalprice;
	}

	public void setOrderitemTotalprice(double orderitemTotalprice) {
		this.orderitemTotalprice = orderitemTotalprice;
	}
	
}
