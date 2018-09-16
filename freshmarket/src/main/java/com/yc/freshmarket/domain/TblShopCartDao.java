package com.yc.freshmarket.domain;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface TblShopCartDao extends JpaRepository<TblShopCart, Integer>{

	TblShopCart findByCartIdAndGoodsId(Integer cartId, Integer goodsId);

	List<TblShopCart> findByCartId(Integer cartdId);
	
	@Transactional
	@Query(nativeQuery=true,value="UPDATE tbl_shopcart SET goodscount=goodscount+?1 WHERE cartItem_Id=?2 ")
	@Modifying
	void changeNum(double d,Integer cartitemId);

}
