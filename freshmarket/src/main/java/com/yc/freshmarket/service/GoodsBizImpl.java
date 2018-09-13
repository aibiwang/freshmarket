package com.yc.freshmarket.service;

import javax.annotation.Resource;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Service;

import com.yc.freshmarket.domain.TblGoods;
import com.yc.freshmarket.domain.TblGoodsDao;

@Service
@EnableAutoConfiguration
public class GoodsBizImpl implements GoodsBiz{

	@Resource
	TblGoodsDao dao;
	
	@Override
	public void addGoos(TblGoods tblGoods) {
		
	/*	dao.addGoos(tblGoods.getGoodsName(),tblGoods.getInprice(),
				tblGoods.getSaleprice(),tblGoods.getCategoryId(),
				tblGoods.getGoodsReservenum(),tblGoods.getGoodsDesc(),tblGoods.getGoodsPic());*/
		
	}

}
