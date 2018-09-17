package com.yc.freshmarket.domain;

import java.sql.Timestamp;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;


public interface TblOrderDao  extends JpaRepository<TblOrder, Integer>{

	/**
	 * 查询用户所有的订单
	 * @param uid
	 * @return
	 */
	@Query(nativeQuery=true,value="select * from tbl_order where tbl_order.user_id=?1 ")
	List<TblOrder> findAllByUserId(Integer uid);

	/**
	 * 更新订单状态
	 * @param tag
	 * @param orderId
	 * @return
	 */
	@Transactional
	@Modifying
	@Query(nativeQuery=true,value="update tbl_order as o set o.tag = ?1 where o.order_id = ?2")
	int updateTagByOrderId(String tag,Integer orderId);

	/**
	 * 查询要评价的订单的信息
	 * @param orderId
	 * @return
	 */
	@Query(nativeQuery=true,value="select * from tbl_order where tbl_order.order_id=?1 ")
	TblOrder findAllByOrderId(Integer orderId);

	/**
	 * 评价成功插入订单表
	 * @param tag
	 * @param orderId
	 * @return
	 */
	@Transactional
	@Modifying
	@Query(nativeQuery=true,value="update tbl_order as o set o.tag=?1,o.order_pingjiamanyidu=?2,o.order_pingjianeirong=?3,o.order_pingjiashijian=?4 where o.order_id=?5")
	int updateOrderManyiduByOrderId(String tag, Integer pingjiamanyidu, String pingjianeirong, Timestamp pingjiashijian,
			Integer orderId);
}
