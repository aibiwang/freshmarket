package com.yc.freshmarket.service;

import java.util.List;

import com.yc.freshmarket.domain.TblOrderItem;

/**
 * OrderitemBiz		订单条目接口
 * @author liu-pc
 *
 */
public interface OrderitemBiz {

	void insertOrderitem(List<TblOrderItem> orderItems);

}
