package com.yc.freshmarket.domain;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * TblUser 实体类
 * Integer 主键类
 * @author liu-pc
 *
 */
public interface TblUserDao extends JpaRepository<TblUser, Integer>{

	//TblUser findByUnameAndUpass(String string, String string2);
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

	TblUser findByUserNameAndUserPwd(String string, String string2);
	
	@Query(nativeQuery=true,value="select * from tbl_user where tbl_user.user_name=?1 ")
	TblUser findByUserName(String username);

}
