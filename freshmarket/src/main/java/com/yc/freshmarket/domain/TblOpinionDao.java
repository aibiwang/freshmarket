package com.yc.freshmarket.domain;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TblOpinionDao  extends JpaRepository<TblOpinion, Integer>{

	
	@Query(nativeQuery=true,value="SELECT tbl_opinion.content,tbl_opinion.date,tbl_opinion.satisfy,tbl_user.user_name FROM tbl_opinion,tbl_user WHERE \r\n" + 
			"tbl_opinion.goods_id=?1 AND tbl_opinion.user_id=tbl_user.user_id")
	List<Object[]> findOpinionBygoodsId(Integer goodsId);


}
