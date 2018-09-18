package com.yc.freshmarket.service;

import java.sql.Timestamp;
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

	/**
	 * 插入订单
	 */
	@Override
	public TblOrder insertOrder(TblOrder Order) {
		
		return dao.save(Order);
	}
	@Override
	public TblOrder findByOrderId(Integer orderId) {
		TblOrder list = dao.findAllByOrderId(orderId);
		return list;
	}

	@Override
	public int updateOrderManyiduByOrderId(String tag, Integer pingjiamanyidu, String pingjianeirong,
			Timestamp pingjiashijian, Integer orderId) {
		int result = dao.updateOrderManyiduByOrderId(tag,pingjiamanyidu,pingjianeirong,pingjiashijian,orderId);
		return result;
	}

}
