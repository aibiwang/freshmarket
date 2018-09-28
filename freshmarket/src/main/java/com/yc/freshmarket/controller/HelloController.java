package com.yc.freshmarket.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.freshmarket.domain.TblCategory;
import com.yc.freshmarket.service.CategoryBiz;

@Controller
@EnableAutoConfiguration
public class HelloController {

	@Resource
	private CategoryBiz categoryBiz;
	/**
	 * 测试添加商品
	 */
	@RequestMapping("/TgoodsAdd.do")
	String goodsAdd(HttpServletRequest request){

		List<TblCategory> categorylist = this.categoryBiz.findAll();
		request.setAttribute("categorylist", categorylist);

		return "/back/picture-add";
	}

	/**
	 * 修改商品信息
	 * @return
	 */
	@RequestMapping("/TgoodsUpdate.do")
	String goodsUpdate(HttpServletRequest request){
		List<TblCategory> categorylist = this.categoryBiz.findAll();
		request.setAttribute("categorylist", categorylist);
		
		return "/back/picture-update";
	}

	/**
	 * 测试查看商品列表
	 */
	@RequestMapping("/TgoodsList.do")
	String goodsList(){
		return "/back/Products_List";
	}

	/**
	 * 测试backIndex
	 */
	@RequestMapping("/backIndex")
	String backIndex(){
		return "/back/index";
	}
	
	/**
	 * 打开category_Manage界面
	 * @return
	 */
	@RequestMapping("/category_Manage")
	String category_Manage(){
		return "/back/Category_Manage";
	}

	/**
	 * product-category-add
	 * @return
	 */
	@RequestMapping("/productCategoryAdd")
	String productCategoryAdd(){
		return "/back/product-category-add";
	}

	/**
	 * 打开home界面
	 * @return
	 */
	@RequestMapping("/home")
	String home(){
		return "/back/home";
	}

	/**
	 * 打开Order_handling界面
	 * @return
	 */
	@RequestMapping("/orderhandling")
	String orderhandling(){
		return "/back/Order_handling";
	}


	@RequestMapping("/login")
	String login(){
		return "/forward/login";
	}


	@RequestMapping("/register")
	String register(){
		return "/forward/register";
	}


	//我的订单
	@RequestMapping("/user_center_order")
	String user_center_order(){
		return "/forward/user_center_order";
	}

	//用户中心
	@RequestMapping("/user_center_info")
	String user_center_info(){
		return "/forward/user_center_info";
	}


	//用户地址
	@RequestMapping("/user_center_site")
	String user_center_site(){
		return "/forward/user_center_site";
	}

	//商品详情
	@RequestMapping("/detail")
	String detail(){
		return "/forward/detail";
	}

	//物流图
	@RequestMapping("/logistics")
	String logistics(){
		return "/forward/logistics";
	}

	//去结算
	@RequestMapping("/place_order")
	String place_order(){
		return "/forward/place_order";
	}

	//去评价
	@RequestMapping("/pingjia")
	String pingjia(){
		return "/forward/pingjia";
	}

	//评价详情
	@RequestMapping("/pingjia_xiangqing")
	String pingjia_xiangqing(){
		return "/forward/pingjia_xiangqing";
	}

	//修改密码
	@RequestMapping("/finduserpwd")
	String finduserpwd(){
		return "/forward/finduserpwd";
	}

}
