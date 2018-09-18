package com.yc.freshmarket.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Service;

import com.yc.freshmarket.domain.TblCategory;
import com.yc.freshmarket.domain.TblCategoryDao;

@Service
@EnableAutoConfiguration
public class CategoryBizImpl implements CategoryBiz{

	@Resource
	TblCategoryDao tblCategoryDao;
	
	@Override
	public List<TblCategory> findAll() {
		
		List<TblCategory> list = tblCategoryDao.findAll();
		
		return list;
	}

}
