package com.yc.freshmarket.domain;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TblGoodsDao extends JpaRepository<TblGoods, Integer> {

	/*
	@Query(nativeQuery=true,value="")
	void addGoos(String goodsName, double inprice, double saleprice,
			Integer categoryId, double goodsReservenum, String goodsDesc,
			String goodsPic);*/

}
