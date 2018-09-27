package com.yc.freshmarket.service;

import java.util.List;
import java.util.Map;

import com.yc.freshmarket.domain.TblOpinion;

/**
 * OpinionBiz			评价接口
 * @author liu-pc
 *
 */
public interface OpinionBiz {

	public List<TblOpinion> insertOpinion(List<TblOpinion> opinionList);

	public List<Map<String,Object>> findOpinionByGoodsId(Integer goodsId);
}
