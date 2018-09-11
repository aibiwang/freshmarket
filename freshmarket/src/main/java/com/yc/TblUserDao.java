package com.yc;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.yc.bean.TblUser;

/**
 * TblUser 实体类
 * Integer 主键类
 * @author liu-pc
 *
 */
public interface TblUserDao extends JpaRepository<TblUser, Integer>{

	
	/**
	 * 自动生成sql
	 * @param string
	 * @param string2
	 * @return
	 */
	TblUser findByUnameAndUpass(String string, String string2);
	
	
	/**
	 * 
	 * JpQl、HQl:from TblUser where uid=?
	 * 
	 * 原始的sql：   select max(uid) from tbl_user 
	 * 
	 * @Query 可以执行 insert、update、delete、select
	 * @param id
	 * @return
	 */
	@Query(nativeQuery=true,value="select max(uid) from tbl_user ")
	Integer findMaxUser(Integer id);

}
