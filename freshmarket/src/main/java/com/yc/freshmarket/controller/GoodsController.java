package com.yc.freshmarket.controller;

import javax.annotation.Resource;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;

import com.yc.freshmarket.service.GoosBizImpl;

@Controller
@EnableAutoConfiguration
public class GoodsController {

	@Resource
	GoosBizImpl goosBizImpl;
}
