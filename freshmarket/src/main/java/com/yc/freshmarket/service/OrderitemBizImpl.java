package com.yc.freshmarket.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Service;

import com.yc.freshmarket.domain.TblOrderItem;
import com.yc.freshmarket.domain.TblOrderItemDao;

@Service
@EnableAutoConfiguration
public class OrderitemBizImpl implements OrderitemBiz{
	
	@Resource
	TblOrderItemDao Dao;

	@Override
	public void insertOrderitem(List<TblOrderItem> orderItems) {
		Dao.save(orderItems);
		
	}

}
