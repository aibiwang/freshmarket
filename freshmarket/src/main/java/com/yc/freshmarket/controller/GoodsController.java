package com.yc.freshmarket.controller;

import java.io.IOException;
import java.io.Writer;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.yc.freshmarket.domain.TblCategory;
import com.yc.freshmarket.domain.TblGoods;
import com.yc.freshmarket.service.CategoryBiz;
import com.yc.freshmarket.service.GoodsBiz;
import com.yc.freshmarket.service.OrderBiz;
import com.yc.freshmarket.service.UserBiz;

@Controller
@EnableAutoConfiguration
public class GoodsController {

	@Resource
	private GoodsBiz goodsBiz;
	@Resource
	private CategoryBiz categoryBiz;
	@Resource
	private UserBiz userBiz;
	@Resource
	private OrderBiz orderBiz;
	
	@RequestMapping("/detail.do")
	public String goodsDetail(Integer goodsId,Model model) {
		
		model.addAttribute("DetailGoods",goodsBiz.findTblGoodsBygoodsId(goodsId));
		
		return "forward/detail";
		
	}
	
	/**
	 * 添加商品
	 * @param tblGoods
	 * @param request
	 * @param session
	 * @param picFile
	 */
	@RequestMapping("/addGoods.do")
	public void addGoods(TblGoods tblGoods,HttpServletRequest request,HttpSession session,@RequestParam("picFile") MultipartFile picFile ){
		
		String uploadPath = "/upload";

		tblGoods.setGoodsPic(".."+uploadPath+ "/" + picFile.getOriginalFilename());
		
		uploadPath = session.getServletContext().getRealPath(uploadPath);
		
		tblGoods.setGoodsPutdate(new Timestamp(System.currentTimeMillis()));
		try {
			goodsBiz.upload(uploadPath, picFile);
			
			System.out.println(uploadPath+"-------------------");
			
			System.out.println(picFile.getOriginalFilename()+"*************");
			goodsBiz.addGoods(tblGoods);
			
			System.out.println("----------------------"+tblGoods);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	
	@RequestMapping("/findGoods.do")
	public String findGoods(HttpServletRequest request,Model model){
		int goodtotal = goodsBiz.goodtotal();
		
		List<TblCategory> list = this.categoryBiz.findAll();
		request.setAttribute("goodtotal", goodtotal);
		request.setAttribute("list", list);
		return "/back/Products_List";

	}
	
	@RequestMapping("/detelegoods.do")
	public String detelegoods(@RequestParam("goodsId") Integer	goodsId,HttpServletRequest request, Model mav){
		
		System.out.println("-----goodsId------"+goodsId);
		
		goodsBiz.detelegoods(goodsId);
		
		return "/back/Products_List";
	}
	
	@RequestMapping("/updategoods.do")
	public void updategoods(TblGoods tblGoods,HttpServletRequest request,HttpSession session,Writer write,Model mav ) throws IOException{
		
		System.out.println("-----------tblGoods-----------"+tblGoods);
		
		
		write.write("1");
		
		session.setAttribute("tblGoods", tblGoods);
		
		System.out.println("111111111111");
		
		
	}
	
	
	@RequestMapping("/doUpdate.do")
	public void doUpdate(TblGoods tblGoods,HttpServletRequest request,HttpSession session ){
		
		System.out.println("-------8778-----------"+tblGoods.getGoodsId());
		System.out.println("-------87780000-----------"+tblGoods.getGoodsPic());
		tblGoods.setGoodsPutdate(new Timestamp(System.currentTimeMillis()));
		try {
		
			goodsBiz.updategoods(tblGoods);
			
			System.out.println("----------------------"+tblGoods);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		}	
	}
	
	@RequestMapping("/statisticalData.do")
	public String statisticalData(HttpServletRequest request,HttpSession session ){
		int goodtotal = goodsBiz.goodtotal();
		int usertotal = userBiz.usertotal();
		int ordertotal = orderBiz.ordertotal();
		int goodgrounding = goodsBiz.goodgrounding();
		int goodLowerframe = goodsBiz.goodLowerframe();
		
		
		//给金额添加逗号
		DecimalFormat df = new DecimalFormat("#,###.00"); 
		String moneytotal = df.format(orderBiz.moneytotal());
		
		//double moneytotal = orderBiz.moneytotal();
		System.out.println("---------moneytotal------------"+moneytotal);
		
		session.setAttribute("goodgrounding", goodgrounding);
		session.setAttribute("goodLowerframe", goodLowerframe);
		session.setAttribute("moneytotal", moneytotal);
		session.setAttribute("ordertotal", ordertotal);
		session.setAttribute("usertotal", usertotal);
		session.setAttribute("goodtotal", goodtotal);
		
		return "/back/home";
		
	}
	
	@RequestMapping("/search.do")
	public String searchGoods(String contents,Model model) {
		
		Set<TblGoods> goodsSet=goodsBiz.findByGoodsName(contents);
		System.out.println(goodsSet);
		model.addAttribute("goodsSet",goodsSet);
		return "forward/search";
	}
	
}
