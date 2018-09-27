package com.yc.freshmarket.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Service;

import com.yc.freshmarket.domain.TblOpinion;
import com.yc.freshmarket.domain.TblOpinionDao;

@Service
@EnableAutoConfiguration
public class OpinionBizImpl implements OpinionBiz{
	@Resource
	TblOpinionDao Dao;

	@Override
	public List<TblOpinion> insertOpinion(List<TblOpinion> opinionList) {
		
		return Dao.save(opinionList);
	}

	@Override
	public List<Map<String,Object>> findOpinionByGoodsId(Integer goodsId) {
		
		List<Map<String,Object>> opinionList= new ArrayList<Map<String,Object>>();
		List<Object[]> list= Dao.findOpinionBygoodsId(goodsId);
		Map<String,Object> map ;
		for(Object[] o:list) {
			map= new HashMap<String, Object>();
			map.put("content", o[0]);
			map.put("date", o[1]);
			map.put("satisfy", o[2]);
			map.put("userName", o[3]);
			opinionList.add(map);
		}
		
		return opinionList;
	}

	

}
