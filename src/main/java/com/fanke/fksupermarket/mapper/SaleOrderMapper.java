package com.fanke.fksupermarket.mapper;

import java.util.HashMap;
import java.util.List;

import com.fanke.fksupermarket.po.Monthly;
import com.fanke.fksupermarket.po.SaleOrder;

public interface SaleOrderMapper {

	/**
	 * 查询所有销售订单
	 * 
	 * @return
	 */
	public List getAllSaleOrder();

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
	public void addSaleOrder(SaleOrder saleOrder);

}
