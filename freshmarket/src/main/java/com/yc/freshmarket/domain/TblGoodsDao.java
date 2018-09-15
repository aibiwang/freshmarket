package com.yc.freshmarket.domain;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TblGoodsDao extends JpaRepository<TblGoods, Integer> {

	/**
	 * 通过goodsid查询商品详情
	 * @param goodsId
	 * @return
	 */
	@Query(nativeQuery=true,value="select * from tbl_goods where tbl_goods.goods_id=?1")
	TblGoods findByGoodsId(Integer goodsId);

}
