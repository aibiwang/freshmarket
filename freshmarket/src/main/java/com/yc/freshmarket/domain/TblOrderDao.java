package com.yc.freshmarket.domain;

import java.sql.Timestamp;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;


public interface TblOrderDao  extends JpaRepository<TblOrder, Integer>{




	/**
	 * 查询用户所有的订单
	 * @param uid
	 * @return
	 */
	@Query(nativeQuery=true,value="select * from tbl_order where tbl_order.user_id=?1 ")
	List<TblOrder> findAllByUserId(Integer uid);

	/**
	 * 更新订单状态
	 * @param tag
	 * @param orderId
	 * @return
	 */
	@Transactional
	@Modifying
	@Query(nativeQuery=true,value="update tbl_order as o set o.tag = ?1 where o.order_id = ?2")
	int updateTagByOrderId(String tag,Integer orderId);

	@Query(nativeQuery=true,value="select count(*) ocnt from tbl_order")
	int ordertotal();

	@Query(nativeQuery=true,value="select count(*) ocnt from tbl_order where tbl_order.tag='待发货'")
	int daiFaHuototal();
	
	@Query(nativeQuery=true,value="select count(*) ocnt from tbl_order where tbl_order.tag='已发货'")
	int yiFaHuototal();
	
	@Query(nativeQuery=true,value="select count(*) ocnt from tbl_order where tbl_order.tag='已评价'")
	int yiPingJiatotal();
	
	@Query(nativeQuery=true,value="select count(*) ocnt from tbl_order where tbl_order.tag='待支付'")
	int daiZhiFutotal();
	
	@Query(nativeQuery=true,value="select count(tbl_order.order_pingjianeirong) ocnt from tbl_order")
	int pingJiatotal();
	
	@Query(nativeQuery=true,value="select sum(order_totalprice) total from tbl_order where tbl_order.tag !='待支付'")
	int moneytotal();


	/**
	 * 查询要评价的订单的信息
	 * @param orderId
	 * @return
	 */
	@Query(nativeQuery=true,value="select * from tbl_order where tbl_order.order_id=?1 ")
	TblOrder findAllByOrderId(Integer orderId);

	/**
	 * 评价成功插入订单表
	 * @param tag
	 * @param orderId
	 * @return
	 */
	@Transactional
	@Modifying
	@Query(nativeQuery=true,value="update tbl_order as o set o.tag=?1,o.order_pingjiamanyidu=?2,o.order_pingjianeirong=?3,o.order_pingjiashijian=?4 where o.order_id=?5")
	int updateOrderManyiduByOrderId(String tag, Integer pingjiamanyidu, String pingjianeirong, Timestamp pingjiashijian,
			Integer orderId);

	
	/**
	 * 查询所有详情订单
	 * @return
	 */
	@Query(nativeQuery=true,value="select * from(\n" +
			"select f.*,g.category_name from (\n" +
			"select e.*,d.goods_name,d.saleprice,d.goods_pic,d.category_id from (\n" +
			"select a.order_id,a.receiver_addr,a.receiver_name,a.receiver_phone,a.order_date,\n" +
			"a.order_totalprice,b.user_name,c.goods_id,c.goodscount,a.tag from tbl_order a\n" +
			"left join tbl_user b on a.user_id = b.user_id\n" +
			"right join tbl_orderitem c on a.order_id = c.order_id\n" +
			") e\n" +
			"left join tbl_goods d on e.goods_id = d.goods_id\n" +
			") f\n" +
			"left join tbl_category g on g.category_id = f.category_id\n" +
			") h where h.order_id=?")
	List<Object[]> findorderDetails(Integer orderId);

	

	

	
	
}
