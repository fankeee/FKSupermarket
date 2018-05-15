package com.fanke.fksupermarket.service;

import java.util.HashMap;
import java.util.List;

import com.fanke.fksupermarket.po.Monthly;
import com.fanke.fksupermarket.po.SaleOrder;
import com.fanke.fksupermarket.util.PagedResult;

public interface ISaleOrderService {

	/**
	 * 查询所有销售订单
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public PagedResult<SaleOrder> getAllSaleorder(Integer pageNo, Integer pageSize);

	/**
	 * 多条件查询
	 * 
	 * @param map
	 * @return
	 */
	public List<SaleOrder> conditionalQuery(HashMap<String, Object> map);

	/**
	 * 按月查询销售信息
	 * 
	 * @return
	 */
	public List<Monthly> monthlyStatistics();

	/**
	 * 添加销售订单
	 * 
	 * @param saleOrder
	 * @return
	 */
	public boolean addSaleOrder(SaleOrder saleOrder);

}
