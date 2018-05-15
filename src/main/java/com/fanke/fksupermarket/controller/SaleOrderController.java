package com.fanke.fksupermarket.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fanke.fksupermarket.po.Goods;
import com.fanke.fksupermarket.po.Monthly;
import com.fanke.fksupermarket.po.SaleOrder;
import com.fanke.fksupermarket.po.SaleOrderDetail;
import com.fanke.fksupermarket.service.IGoodsService;
import com.fanke.fksupermarket.service.ISaleOrderDetailService;
import com.fanke.fksupermarket.service.ISaleOrderService;
import com.fanke.fksupermarket.util.PagedResult;

import net.sf.json.JSONArray;

/**
 * 销售订单
 * 
 * @author Fk
 *
 */
@Controller
@RequestMapping("SaleOrderController")
public class SaleOrderController {

	@Autowired
	ISaleOrderService saleOrderService;
	@Autowired
	ISaleOrderDetailService saleOrderDetailService;
	@Autowired
	IGoodsService goodsService;

	/**
	 * 查询所有销售单
	 * 
	 * @param model
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("getAllSaleorder")
	public String getAllSaleorder(Model model, Integer pageNo, @RequestParam(defaultValue = "10") Integer pageSize) {
		// 调用service接口获取分页结果
		PagedResult<SaleOrder> pageResult = saleOrderService.getAllSaleorder(pageNo, pageSize);
		// 保存分页结果
		model.addAttribute("saleOrderPagedResult", pageResult);
		// 从分页结果中获取销售单数据
		List<SaleOrder> saleOrderList = pageResult.getDataList();
		// 保存销售单数据
		if (saleOrderList.size() > 0)
			model.addAttribute("saleOrderList", saleOrderList);
		else
			model.addAttribute("saleOrderList", null);
		return "subPage/statistics/statisticsson/statistics_son3";
	}

	/**
	 * 多条件拼接查询
	 * 
	 * @param model
	 * @param id
	 * @param uid
	 * @param startdate
	 * @param enddate
	 * @return
	 */
	@RequestMapping("conditionalQuery")
	public String conditionalQuery(Model model, String id, String uid, String startdate, String enddate) {
		// 将查询条件保存到Map集合中
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("uid", uid);
		map.put("startdate", startdate);
		map.put("enddate", enddate);

		// 调用service接口获取条件查询结果
		List<SaleOrder> saleOrderList = saleOrderService.conditionalQuery(map);
		System.out.println("===============" + saleOrderList.size());
		// 保存条件查询结果
		if (saleOrderList.size() > 0)
			model.addAttribute("saleOrderList", saleOrderList);
		else
			model.addAttribute("saleOrderList", "");
		return "subPage/statistics/statisticsson/statistics_son3";
	}

	/**
	 * 按月查询销售信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("monthlyStatistics")
	public String monthlyStatistics(HttpServletRequest request) {
		List<Monthly> mlist = saleOrderService.monthlyStatistics();
		JSONArray jsonArr = JSONArray.fromObject(mlist);
		request.getSession().setAttribute("mlist", jsonArr);
		request.getSession().setAttribute("kind", "销售额");
		return "subPage/statistics/statisticsson/statistics_son2";
	}

	/**
	 * 插入销售单
	 */
	@RequestMapping("/addSaleOrder")
	@ResponseBody
	@Transactional
	public boolean addSaleOrder(Integer u_id, String objte, String strsid, String strnum) {
		String[] gid = null;
		String[] gnu = null;
		gid = strsid.split(",");
		gnu = strnum.split(",");

		float amount = Float.parseFloat(objte);
		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setU_id(u_id);
		saleOrder.setS_totalAmount(amount);
		//saleOrder.setS_saleDate(new Date().toString());
		// 插入销售单
		boolean result1 = saleOrderService.addSaleOrder(saleOrder);
		// 获取到插入销售订单的编号
		int sid = saleOrder.getS_id();

		int gsid = 0;
		int gnum = 0;
		SaleOrderDetail saleOrderDetail = null;
		Goods goods = null;
		boolean result2 = false;
		boolean result3 = false;
		for (int i = 0; i < gnu.length; i++) {
			// 商品编号
			gsid = Integer.parseInt(gid[i]);
			// 商品数量
			gnum = Integer.parseInt(gnu[i]);

			// 获取商品库存
			goods = goodsService.getInventoryByGid(gsid);
			// 判断库存量是否大于等于销售量
			if (goods != null && goods.getG_inventory() >= gnum) {
				saleOrderDetail = new SaleOrderDetail();
				saleOrderDetail.setG_id(gsid);
				saleOrderDetail.setS_id(sid);
				saleOrderDetail.setSod_number(gnum);

				// 添加销售订单明细
				result2 = saleOrderDetailService.addSaleOrderDetail(saleOrderDetail);

				// 从库存中减去销售数量
				goods.setG_inventory(goods.getG_inventory() - gnum);
				result3 = goodsService.updateInventory(goods);
			} else {
				break;
			}

		}

		if (result1 && result2 && result3)
			return true;
		else
			return false;
	}

}
