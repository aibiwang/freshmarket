package com.yc.freshmarket.service;

import java.util.List;

import javax.annotation.Resource;

import org.eclipse.jdt.internal.compiler.impl.ShortConstant;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.yc.freshmarket.domain.TblShopCart;
import com.yc.freshmarket.domain.TblShopCartDao;

@Service
@EnableAutoConfiguration
public class ShopcartBizImpl implements ShopcartBiz{
	
	@Resource
	TblShopCartDao tblShopCartDao;

	@Override
	public String addToCart(Integer cartId, Integer goodsId) {
		
		TblShopCart shopCart =null;
		
		shopCart=tblShopCartDao.findByCartIdAndGoodsId(cartId,goodsId);
		
		if(shopCart==null) {
			shopCart = new TblShopCart();
			shopCart.setCartId(cartId);
			shopCart.setGoodsId(goodsId);
			shopCart.setGoodscount(1.0);
			shopCart= tblShopCartDao.save(shopCart);
			if(shopCart.getCartitemId()!=null) {
				return "添加购物车成功";
			}else {
				return "服务器异常";
			}
		}else {
			return "该商品已在您的购物车中";
		}
		
	}

	/**
	 * 查看购物车
	 */
	@Override
	public List<TblShopCart> findCartById(Integer cartdId) {
		
		List<TblShopCart> list = tblShopCartDao.findByCartId(cartdId);
		return list;
	}

	/**
	 * 删除购物车子项
	 */
	@Override
	public void delShopCart(Integer cartItemId) {
		tblShopCartDao.delete(cartItemId);
		
	}

	/**
	 * 修改商品数量
	 */
	@Override
	public void changeNum(Integer cartitemId, String flag) {
		if("add".equals(flag)) {
			tblShopCartDao.changeNum(0.5,cartitemId);
		}else {
			tblShopCartDao.changeNum(-0.5,cartitemId);
		}
	}

	/**
	 * 获取商品数量
	 */
	@Override
	public double getNum(int cartitemId) {
		
		return (double) (tblShopCartDao.findOne(cartitemId)).getGoodscount();
	} 

}
