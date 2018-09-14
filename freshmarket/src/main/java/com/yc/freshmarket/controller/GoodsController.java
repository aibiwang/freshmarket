package com.yc.freshmarket.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.yc.freshmarket.domain.TblGoods;
import com.yc.freshmarket.service.GoodsBiz;

@Controller
@EnableAutoConfiguration
public class GoodsController {

	@Resource

	private GoodsBiz goodsBiz;
	
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

		tblGoods.setGoodsPic(".."+uploadPath+ "\\" + picFile.getOriginalFilename());
		
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
	public String findGoods(HttpServletRequest request){
		
		List<TblGoods> list = this.goodsBiz.findAll();
		
		System.out.println("------list--------"+list);
		
		request.setAttribute("list", list);
		return "/back/Products_List";

	}
	
}
