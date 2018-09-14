package com.yc.freshmarket.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.validation.constraints.Size;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yc.freshmarket.domain.TblGoods;
import com.yc.freshmarket.domain.TblGoodsDao;

@Service
@EnableAutoConfiguration
public class GoodsBizImpl implements GoodsBiz{

	@Resource
	TblGoodsDao dao;
	
	@Override
	public void addGoods(TblGoods tblGoods) {
		
		dao.save(tblGoods);
		
	}

	@Override
	public void upload(String uploadPath, MultipartFile file) throws IllegalStateException, IOException {
		//构建保存的文件对象
		File dest = new File(uploadPath, file.getOriginalFilename());
		//保存文件
		file.transferTo(dest);
	}

	@Override
	public List<TblGoods> findAll() {
		
		List<TblGoods> list = dao.findAll();
	
		return list;
	}

	

}
