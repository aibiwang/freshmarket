package com.yc.freshmarket.controller;

import javax.annotation.Resource;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;

import com.yc.freshmarket.service.ShopcartBizImpl;

@Controller
@EnableAutoConfiguration
public class ShopCartController {

	@Resource
	ShopcartBizImpl shopcartBizImpl;
}
