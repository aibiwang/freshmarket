package com.yc.freshmarket.service;

import java.util.List;

import com.yc.freshmarket.domain.TblOrder;

/**
 * OrderBiz				订单接口
 * @author liu-pc
 *
 */
public interface OrderBiz {

	/**
	 * 通过用户id查询所有订单
	 * @param uid
	 * @return
	 */
	List<TblOrder> findByUserId(Integer uid);

	/**
	 *更新订单状态
	 * @param order
	 * @return
	 */
	int updateTagByOrderId(String tag,Integer orderId);
	
	public int ordertotal();
	
	public int moneytotal();
	

}
