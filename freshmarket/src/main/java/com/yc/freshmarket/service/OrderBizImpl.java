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

	@Override
	public int ordertotal() {
		
		return dao.ordertotal();
	}

	@Override
	public int daiFaHuototal() {
		
		return dao.daiFaHuototal();
	}
	
	@Override
	public int yiFaHuototal() {
		
		return dao.yiFaHuototal();
	}
	@Override
	public int yiPingJiatotal() {
		
		return dao.yiPingJiatotal();
	}
	@Override
	public int daiZhiFutotal() {
		
		return dao.daiZhiFutotal();
	}
	
	@Override
	public int pingJiatotal() {
		
		return dao.pingJiatotal();
	}
	
	@Override
	public int moneytotal() {
		
		return dao.moneytotal();
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

	@Override
	public List<TblOrder> findAllOrder() {
		List<TblOrder> list = dao.findAll();
		return list;
	}

	@Override
	public List<Object[]> findorderDetails(Integer orderId) {
		
		List<Object[]> list = dao.findorderDetails(orderId);
		return list;
	}










	
}
