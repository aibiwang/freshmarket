package com.yc.freshmarket.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Service;

import com.yc.freshmarket.domain.TblGoods;
import com.yc.freshmarket.domain.TblGoodsDao;

@Service
@EnableAutoConfiguration
public class GoodsBizImpl implements GoodsBiz{

	@Resource
	TblGoodsDao tblGoodsDao;
	
	@Override
	public List<TblGoods> findAllGoods() {
		
		return tblGoodsDao.findAll();
		
		
	}

	@Override
	public TblGoods findTblGoodsBygoodsId(Integer goodsId) {
		return tblGoodsDao.findOne(goodsId);


	}
	
	@Override
	public void addGoos(TblGoods tblGoods) {
		
	/*	dao.addGoos(tblGoods.getGoodsName(),tblGoods.getInprice(),
				tblGoods.getSaleprice(),tblGoods.getCategoryId(),
				tblGoods.getGoodsReservenum(),tblGoods.getGoodsDesc(),tblGoods.getGoodsPic());*/
		
	}

}
