package com.yc.freshmarket.service;

import java.util.List;

import com.yc.freshmarket.domain.TblCategory;
import com.yc.freshmarket.domain.TblGoods;

/**
 * CategoryBiz		商品类型接口
 * @author liu-pc
 *
 */
public interface CategoryBiz {

	/**
	 * 查看所有商品
	 * @return
	 */
	public List<TblCategory> findAll();
	
	/**
	 * 添加商品类型
	 * @param tblCategory
	 */
	public void addCategory(TblCategory tblCategory); 
}
