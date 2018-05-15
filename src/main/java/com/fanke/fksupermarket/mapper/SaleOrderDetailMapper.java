package com.fanke.fksupermarket.mapper;

import java.util.List;

import com.fanke.fksupermarket.po.SaleOrderDetail;

public interface SaleOrderDetailMapper {

	/**
	 * 根据ID查询销售订单详细
	 * 
	 * @param s_id
	 * @return
	 */
	public List<SaleOrderDetail> getSaleOrderDetailById(Integer s_id);

	/**
	 * 添加销售订单明细
	 * 
	 * @param saleOrderDetail
	 * @return
	 */
	public int addSaleOrderDetail(SaleOrderDetail saleOrderDetail);

}
