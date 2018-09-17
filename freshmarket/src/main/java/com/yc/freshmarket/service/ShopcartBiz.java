package com.yc.freshmarket.service;

import java.util.List;

import com.yc.freshmarket.domain.TblShopCart;

/**
 * ShopcartBiz		购物车记录接口
 * @author liu-pc
 *
 */
public interface ShopcartBiz {
	
	
	public String addToCart(Integer cartId,Integer goodsId);

	public List<TblShopCart> findCartById(Integer cardId);

	public void delShopCart(Integer cartItemId);

	public void changeNum(Integer cartitemId, String flag);

	public double getNum(int cartitemId);
}
