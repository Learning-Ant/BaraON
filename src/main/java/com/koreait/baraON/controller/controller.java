package com.koreait.baraON.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.baraON.command.BaraONCommand;

@Controller
public class controller {

	@Autowired
	private SqlSession sqlSession;
	
	private BaraONCommand baraONCommand;
	
	@RequestMapping(value="/")
	public String index() {
		return "index";
	}
	
}