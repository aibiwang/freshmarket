package com.yc.freshmarket.service;

import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yc.freshmarket.domain.TblCategory;
import com.yc.freshmarket.domain.TblCategoryDao;
import com.yc.freshmarket.domain.TblGoods;
import com.yc.freshmarket.domain.TblGoodsDao;

@Service
@EnableAutoConfiguration
public class GoodsBizImpl implements GoodsBiz{

	@Resource
	TblGoodsDao tblGoodsDao;
	@Resource
	TblCategoryDao tblCategoryDao;
	
	@Override
	public void addGoods(TblGoods tblGoods) {
		
		tblGoodsDao.save(tblGoods);
		
	}

	@Override
	public void upload(String uploadPath, MultipartFile file,Long suffix) throws IllegalStateException, IOException {
		//构建保存的文件对象
		File dest = new File(uploadPath, suffix+file.getOriginalFilename());
		//保存文件
		file.transferTo(dest);
	}
	
	
	@Override
	public List<TblGoods> findAllGoods() {
		
		return tblGoodsDao.findAll();
		
		
	}

	@Override
	public TblGoods findTblGoodsBygoodsId(Integer goodsId) {
		return tblGoodsDao.findOne(goodsId);


	}

	@Override
	public int goodtotal() {
		return tblGoodsDao.goodtotal();
	}

	
	@Override
	public void detelegoods(Integer goodsId) {
		tblGoodsDao.delete(goodsId);
	}

	@Override
	public void updategoods(TblGoods tblGoods) {
		tblGoodsDao.saveAndFlush(tblGoods);
		
	}

	@Override
	public int goodgrounding() {
		return tblGoodsDao.goodgrounding();
	}

	@Override
	public int goodLowerframe() {
		return tblGoodsDao.goodLowerframe();
	}


	/**
	 * 条件查询商品
	 */
	@Override
	public Set<TblGoods> findByGoodsName(String contents) {
		
		Set<TblGoods> set = new HashSet<TblGoods>();

		for(int i=0;i<contents.length();i++) {
			
			char c =contents.charAt(i);
			String s=""+c;
			
			for(TblGoods goods:tblGoodsDao.findByGoodsName("%"+s+"%")) {
				
				set.add(goods);
			}
		}
		return set;
	}

	@Override
	public void addCategory(TblCategory tblCategory) {
		
		tblCategoryDao.save(tblCategory);
	}



}
