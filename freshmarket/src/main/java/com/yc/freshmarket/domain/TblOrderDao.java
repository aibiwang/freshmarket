package com.yc.freshmarket.domain;

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

	@Transactional
	@Modifying
	@Query(nativeQuery=true,value="update tbl_order as o set o.tag = ?1 where o.order_id = ?2")
	int updateTagByOrderId(String tag,Integer orderId);

	@Query(nativeQuery=true,value="select count(*) ocnt from tbl_order")
	int ordertotal();

	@Query(nativeQuery=true,value="select sum(order_totalprice) total from tbl_order")
	int moneytotal();


}
