package com.yc.freshmarket.service;

import java.io.IOException;
import java.util.List;

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
	 * 查看所有商品
	 * @return
	 */
	public List<TblGoods> findAll();
	
	
	/**
	 * 上传文件
	 * @param uploadPath
	 * @param file
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public void upload(String uploadPath,MultipartFile file) throws IllegalStateException, IOException;
}
