package com.yc.freshmarket.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.yc.freshmarket.domain.TblCategory;
import com.yc.freshmarket.domain.TblGoods;
import com.yc.freshmarket.domain.TblOrder;
import com.yc.freshmarket.service.CategoryBiz;
import com.yc.freshmarket.service.GoodsBiz;
import com.yc.freshmarket.service.OrderBiz;
import com.yc.freshmarket.service.OrderitemBiz;
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
	@Resource
	private OrderitemBiz orderitemBiz;
	
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
	public String addGoods(TblGoods tblGoods,HttpServletRequest request,HttpSession session,@RequestParam("picFile") MultipartFile picFile ){
		
		
		String uploadPath = "/upload";

		long suffix = System.currentTimeMillis();
		
		tblGoods.setGoodsPic(".."+uploadPath+ "/" + suffix+picFile.getOriginalFilename());
		
		
		
		uploadPath = session.getServletContext().getRealPath(uploadPath);
		
		tblGoods.setGoodsPutdate(new Timestamp(System.currentTimeMillis()));
		try {
			goodsBiz.upload(uploadPath, picFile,suffix);
			
			goodsBiz.addGoods(tblGoods);
			
			TblCategory tblCategory = new TblCategory();
			tblCategory.setCategoryName(tblGoods.getGoodsName());
			tblCategory.setParentId(tblGoods.getCategoryId());
			
			//将商品加入类型表的第二层
			goodsBiz.addCategory(tblCategory);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", "添加商品成功！！！");
		return "/back/picture-add";
	}
	
	
	@RequestMapping("/findGoods.do")
	public String findGoods(HttpServletRequest request,HttpSession session,Model model,PrintWriter out){
		Gson gson = new Gson();
		int goodtotal = goodsBiz.goodtotal();
		
		List<TblCategory> list = this.categoryBiz.findAll();
		
		session.setAttribute("gsonlist", gson.toJson(list));
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println("===+++==="+list.get(i).getCategoryId());
		}
		
		request.setAttribute("goodtotal", goodtotal);
		request.setAttribute("list", list);
		return "/back/Products_List";

	}
	
	@RequestMapping("/detelegoods.do")
	public String detelegoods(@RequestParam("goodsId") Integer	goodsId,HttpServletRequest request, Model mav){
		
		goodsBiz.detelegoods(goodsId);
		orderitemBiz.deteleOrderitem(goodsId);
		return "/back/Products_List";
	}
	
	@RequestMapping("/updategoods.do")
	public void updategoods(TblGoods tblGoods,HttpServletRequest request,HttpSession session,Writer write,Model mav ) throws IOException{
		
		write.write("1");
		
		session.setAttribute("tblGoods", tblGoods);
		
	}
	
	
	@RequestMapping("/doUpdate.do")
	public void doUpdate(TblGoods tblGoods,HttpServletRequest request,HttpSession session ){
		
		tblGoods.setGoodsPutdate(new Timestamp(System.currentTimeMillis()));
		try {
		
			goodsBiz.updategoods(tblGoods);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		}	
	}
	
	@RequestMapping("/statisticalData.do")
	public String statisticalData(HttpServletRequest request,HttpSession session ) throws UnknownHostException{
		int goodtotal = goodsBiz.goodtotal();
		int usertotal = userBiz.usertotal();
		int ordertotal = orderBiz.ordertotal();
		
		int daiFaHuototal = orderBiz.daiFaHuototal();
		int yiFaHuototal = orderBiz.yiFaHuototal();
		int yiPingJiatotal = orderBiz.yiPingJiatotal();
		int daiZhiFutotal = orderBiz.daiZhiFutotal();
		int pingJiatotal = orderBiz.pingJiatotal();
		
		int goodgrounding = goodsBiz.goodgrounding();
		int goodLowerframe = goodsBiz.goodLowerframe();
		
		InetAddress addr = InetAddress.getLocalHost();// 网络适配器地址描述的类
		
		
		
		//给金额添加逗号
		DecimalFormat df = new DecimalFormat("#,###.00"); 
		String moneytotal = df.format(orderBiz.moneytotal());
		
		SimpleDateFormat sdft = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");//设置日期格式
		
		session.setAttribute("timea", sdft.format(new Date()));
		
		session.setAttribute("addre", addr.getHostAddress());
		
		session.setAttribute("pingJiatotal", pingJiatotal);
		session.setAttribute("daiZhiFutotal", daiZhiFutotal);
		session.setAttribute("yiPingJiatotal", yiPingJiatotal);
		session.setAttribute("yiFaHuototal", yiFaHuototal);
		session.setAttribute("daiFaHuototal", daiFaHuototal);
		session.setAttribute("goodgrounding", goodgrounding);
		session.setAttribute("goodLowerframe", goodLowerframe);
		session.setAttribute("moneytotal", moneytotal);
		session.setAttribute("ordertotal", ordertotal);
		session.setAttribute("usertotal", usertotal);
		session.setAttribute("goodtotal", goodtotal);
		
		return "/back/home";
		
	}
	

	@RequestMapping("/allOrder.do")
	public String allOrder(HttpServletRequest request){
		
		List<TblOrder> allOrderlist = orderBiz.findAllOrder();
		
		request.setAttribute("allOrderlist", allOrderlist);
		
		return "/back/Order_handling";
		
	}
	


	@RequestMapping("/search.do")
	public String searchGoods(String contents,Model model) {
		
		Set<TblGoods> goodsSet=goodsBiz.findByGoodsName(contents);
		System.out.println(goodsSet);
		model.addAttribute("goodsSet",goodsSet);
		return "forward/search";
	}
	
}
