package com.yc.freshmarket.domain;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TblGoodsDao extends JpaRepository<TblGoods, Integer> {

	/**
	 * 统计商品数量
	 * @return
	 */
	@Query(nativeQuery=true,value="select count(*) cnt from tbl_goods;")
	int goodtotal();


	/*
	@Query(nativeQuery=true,value="")
	void addGoos(String goodsName, double inprice, double saleprice,
			Integer categoryId, double goodsReservenum, String goodsDesc,
			String goodsPic);*/

	/**
	 * 通过goodsid查询商品详情
	 * @param goodsId
	 * @return
	 */
	@Query(nativeQuery=true,value="select * from tbl_goods where tbl_goods.goods_id=?1")
	TblGoods findByGoodsId(Integer goodsId);


	/**
	 * 统计商品上架数量
	 * @return
	 */
	@Query(nativeQuery=true,value="select count(*) gcnt from tbl_goods where goods_putstatus like '%上架%'")
	int goodgrounding();


	/**
	 * 统计商品下架数量
	 * @return
	 */
	@Query(nativeQuery=true,value="select count(*) gcnt from tbl_goods where goods_putstatus like '%下架%'")
	int goodLowerframe();


	
	@Query(nativeQuery=true,value="SELECT * FROM tbl_goods WHERE goods_name LIKE ?1")
	List<TblGoods> findByGoodsName(String contents);


}
