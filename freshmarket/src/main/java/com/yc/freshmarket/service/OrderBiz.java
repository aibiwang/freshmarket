package com.yc.freshmarket.service;

import java.sql.Timestamp;
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
	
	TblOrder insertOrder(TblOrder Order);

	/**
	 * 显示待评价订单界面信息
	 * @param orderId
	 * @return
	 */
	TblOrder findByOrderId(Integer orderId);

	/**
	 * 插入评价内容
	 * @param order
	 * @return
	 */
	int updateOrderManyiduByOrderId(String tag, Integer pingjiamanyidu, String pingjianeirong, Timestamp pingjiashijian,
			Integer orderId);

}
