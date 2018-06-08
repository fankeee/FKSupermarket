package com.lixueyuan.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lixueyuan.service.EnterpriseService;
import com.lixueyuan.util.BaseUtil;


@Controller
@RequestMapping(value ="/category")
public class CategoryController {
	@Autowired
	private EnterpriseService enterpriseService;
	
	//数据库备份
	@RequestMapping("/backup")
	public@ResponseBody boolean backup(String database,String deposit){
		if(database==null){
			database="";
		}
		System.out.println("表名："+database);
		System.out.println("路径名："+deposit);
		BaseUtil.backup(database, deposit);
		boolean sos = true;
		return sos;
	}
	//数据库还原
	@RequestMapping("/restore")
	public@ResponseBody boolean restore(String deposit){
		BaseUtil.restore("shunge", deposit);		
		boolean sos = true;
		return sos;
	}
	//查找数据库中全部表名
	@RequestMapping("/findAllTable")
	public String findAllTable(Model model,String name){
		List<String> tableList = enterpriseService.findAllTable("csams");	
		model.addAttribute("tableList",tableList);
		return "jsp/sonpage/maintenance/maintenanceson/maintenance_son1";	
	}
}

