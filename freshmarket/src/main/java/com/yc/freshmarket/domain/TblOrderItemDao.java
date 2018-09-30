package com.yc.freshmarket.domain;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TblOrderItemDao extends JpaRepository<TblOrderItem, Integer>{

	
	@Query(nativeQuery=true,value="select goods_id from tbl_orderitem where order_id=?1")
	List<Integer> findGoodsId(Integer orderId);

}
