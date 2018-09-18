package com.yc.freshmarket.domain;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity	//实体类注解
@Table(name="tbl_order")	// 配置表名
public class TblOrder {
	@Id	//注解注解
	@GeneratedValue(strategy=GenerationType.AUTO)	//配置主键值的生成机制
	private Integer	orderId;
	private Integer	userId;
	private double orderTotalprice;
	private String receiverAddr;
	private String receiverName;
	private String receiverPhone;
	private String payment;
	private String orderMeno;
	private Timestamp orderDate;
	private Timestamp sendDate;
	private String tag;
	private Timestamp orderPingjiashijian;
	private String orderPingjianeirong;
	private Integer orderPingjiamanyidu;
	
	@OneToMany(targetEntity=TblOrderItem.class,mappedBy="orderId")
	private List<TblOrderItem> items;

	@Override
	public String toString() {
		return "TblOrder [orderId=" + orderId + ", userId=" + userId + ", orderTotalprice=" + orderTotalprice
				+ ", receiverAddr=" + receiverAddr + ", receiverName=" + receiverName + ", receiverPhone="
				+ receiverPhone + ", payment=" + payment + ", orderMeno=" + orderMeno + ", orderDate=" + orderDate
				+ ", sendDate=" + sendDate + ", tag=" + tag + ", orderPingjiashijian=" + orderPingjiashijian
				+ ", orderPingjianeirong=" + orderPingjianeirong + ", orderPingjiamanyidu=" + orderPingjiamanyidu
				+ ", items=" + items + "]";
	}

	
	public Timestamp getOrderPingjiashijian() {
		return orderPingjiashijian;
	}

	public void setOrderPingjiashijian(Timestamp orderPingjiashijian) {
		this.orderPingjiashijian = orderPingjiashijian;
	}

	public String getOrderPingjianeirong() {
		return orderPingjianeirong;
	}

	public void setOrderPingjianeirong(String orderPingjianeirong) {
		this.orderPingjianeirong = orderPingjianeirong;
	}

	public Integer getOrderPingjiamanyidu() {
		return orderPingjiamanyidu;
	}

	public void setOrderPingjiamanyidu(Integer orderPingjiamanyidu) {
		this.orderPingjiamanyidu = orderPingjiamanyidu;
	}

	public List<TblOrderItem> getItems() {
		return items;
	}

	public void setItems(List<TblOrderItem> items) {
		this.items = items;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public double getOrderTotalprice() {
		return orderTotalprice;
	}

	public void setOrderTotalprice(double orderTotalprice) {
		this.orderTotalprice = orderTotalprice;
	}

	public String getReceiverAddr() {
		return receiverAddr;
	}

	public void setReceiverAddr(String receiverAddr) {
		this.receiverAddr = receiverAddr;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverPhone() {
		return receiverPhone;
	}

	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}


	public String getOrderMeno() {
		return orderMeno;
	}

	public void setOrderMeno(String orderMeno) {
		this.orderMeno = orderMeno;
	}

	public Timestamp getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}

	public Timestamp getSendDate() {
		return sendDate;
	}

	public void setSendDate(Timestamp sendDate) {
		this.sendDate = sendDate;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}
	
}
