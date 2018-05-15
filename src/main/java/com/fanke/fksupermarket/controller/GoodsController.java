package com.fanke.fksupermarket.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fanke.fksupermarket.po.Goods;
import com.fanke.fksupermarket.po.SaleOrder;
import com.fanke.fksupermarket.service.IGoodsService;
import com.fanke.fksupermarket.util.PagedResult;

@Controller
@RequestMapping("GoodsController")
public class GoodsController {

	@Autowired
	IGoodsService goodsService;

	/**
	 * 根据ID查询商品
	 * 
	 * @param g_id
	 * @return
	 */
	@RequestMapping("findGoodsById")
	@ResponseBody
	public Goods findGoodsById(String g_id) {
		return goodsService.findGoodsById(Integer.valueOf(g_id));
	}

	/**
	 * 分页查询所有商品
	 * 
	 * @param model
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("findAllGoods")
	public String findAllGoods(Model model, Integer pageNo, @RequestParam(defaultValue = "10") Integer pageSize) {
		// 调用service接口获取分页结果
		PagedResult<Goods> pageResult = goodsService.findAllGoods(pageNo, pageSize);
		// 保存分页结果
		model.addAttribute("pagedResult", pageResult);
		// 从分页结果中获取销售单数据
		List<Goods> goodsList = pageResult.getDataList();
		// 保存销售单数据
		model.addAttribute("goodsList", goodsList);
		return "subPage/store/storeson/store_son1";
	}

	/**
	 * 条件查询
	 * 
	 * @return
	 */
	@RequestMapping("conditionalQuery")
	public String conditionalQuery(Model model, String g_name2) {
		Map<Object, Object> conditionalMap = new HashMap<Object, Object>();
		conditionalMap.put("g_name", g_name2);
		List<Goods> goodsList = goodsService.conditionalQuery(conditionalMap);
		model.addAttribute("goodsList", goodsList);
		return "subPage/store/storeson/store_son1";
	}

	/**
	 * 修改商品信息
	 * 
	 * @param g_id
	 * @param g_name
	 * @param g_purchasePrice
	 * @param g_sellingPrice
	 * @param g_unit
	 * @param g_productionDate
	 * @param g_shelfLife
	 * @param g_inventory
	 * @param pro_id
	 * @param g_productionAddress
	 * @param c_id
	 * @return
	 */
	@RequestMapping("updateGoods")
	public String updateGoods(Integer g_id, String g_name, Float g_purchasePrice, Float g_sellingPrice, String g_unit,
			String g_productionDate, String g_shelfLife, Integer g_inventory, Integer pro_id,
			String g_productionAddress, Integer c_id) {
		System.out.println(g_id+","+g_name+","+g_purchasePrice+","+g_sellingPrice+","
			+g_unit+","+g_productionDate+","+g_shelfLife+","+","+g_inventory+","+","
				+pro_id+","+g_productionAddress+","+c_id);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Goods goods = null;
		try {
			goods = new Goods(g_id, g_name, g_purchasePrice, g_sellingPrice, g_unit, sdf.parse(g_productionDate),
					g_shelfLife, g_inventory, pro_id, g_productionAddress, c_id);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		goodsService.updateGoods(goods);

		return "redirect:findAllGoods.action";
	}

	/**
	 * 根据ID删除
	 * 
	 * @return
	 */
	@RequestMapping("deleteGoodsById")
	public String deleteGoodsById(Integer g_id) {
		goodsService.deleteGoodsById(g_id);
		return "redirect:findAllGoods.action";
	}
}
