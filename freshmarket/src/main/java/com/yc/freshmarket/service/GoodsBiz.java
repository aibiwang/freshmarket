package com.yc.freshmarket.service;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import org.springframework.web.multipart.MultipartFile;

import com.yc.freshmarket.domain.TblGoods;

/**
 * GoosBiz			商品接口
 * @author liu-pc
 *
 */
public interface GoodsBiz {

	/**
	 * 添加商品
	 * @param tblGoods
	 */
	public void addGoods(TblGoods tblGoods);
	
	/**
	 * 查询商品总数
	 * @return
	 */
	public int goodtotal();
	
	/**
	 * 商品上架数量
	 * @return
	 */
	public int goodgrounding();
	
	/**
	 * 商品下架数量
	 * @return
	 */
	public int goodLowerframe();
	
	
	/**
	 * 删除商品
	 * @param goodsId
	 */
	public void detelegoods(Integer	goodsId);
	
	/**
	 * 修改商品信息
	 * @param tblGoods
	 */
	public void updategoods(TblGoods tblGoods);
	
	
	/**
	 * 上传文件
	 * @param uploadPath
	 * @param file
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public void upload(String uploadPath,MultipartFile file) throws IllegalStateException, IOException;



	List<TblGoods> findAllGoods();
	
	TblGoods findTblGoodsBygoodsId(Integer goodsId);
	/**
	 * 条件查询商品
	 * @param contents
	 * @return
	 */
	public Set<TblGoods> findByGoodsName(String contents);


}
