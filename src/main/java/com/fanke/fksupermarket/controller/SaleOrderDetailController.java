package com.fanke.fksupermarket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fanke.fksupermarket.po.SaleOrderDetail;
import com.fanke.fksupermarket.service.ISaleOrderDetailService;

@Controller
@RequestMapping("SaleOrderDetailController")
public class SaleOrderDetailController {

	@Autowired
	ISaleOrderDetailService sods;

	/**
	 * 通过ID查看销售订单详细
	 * 
	 * @param s_id
	 */
	@RequestMapping("getSaleOrderDetailById")
	public String getSaleOrderDetailById(Model model, Integer s_id) {
		List<SaleOrderDetail> sodList = sods.getSaleOrderDetailById(s_id);
		model.addAttribute("sodList", sodList);

		return "subPage/statistics/statisticsson/statisticgrandson/statistics_grandson3";
	}
}
