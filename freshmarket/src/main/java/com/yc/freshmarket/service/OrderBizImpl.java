package com.yc.freshmarket.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Service;

import com.yc.freshmarket.domain.TblOrder;
import com.yc.freshmarket.domain.TblOrderDao;

@Service
@EnableAutoConfiguration
public class OrderBizImpl implements OrderBiz{

	@Resource
	private TblOrderDao dao;
	
	@Override
	public List<TblOrder> findByUserId(Integer uid) {
		List<TblOrder> list = dao.findAllByUserId(uid);
		return list;
	}

	@Override
	public int updateTagByOrderId(String tag,Integer orderId) {
		int result = dao.updateTagByOrderId(tag,orderId);
		return result;
	}

	@Override
	public int ordertotal() {
		
		return dao.ordertotal();
	}

	@Override
	public int moneytotal() {
		
		return dao.moneytotal();
	}


	

	

}
