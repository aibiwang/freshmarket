package com.yc.freshmarket.service;

import java.util.List;

import com.yc.freshmarket.domain.TblGoods;

/**
 * GoosBiz			商品接口
 * @author liu-pc
 *
 */
public interface GoodsBiz {

	List<TblGoods> findAllGoods();
	
	TblGoods findTblGoodsBygoodsId(Integer goodsId);

/**
 * GoosBiz			商品接口
 * @author liu-pc
 *
 */

	public void addGoos(TblGoods tblGoods);
}
