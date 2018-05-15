package com.fanke.fksupermarket.service;

import java.util.List;

import com.fanke.fksupermarket.po.SaleOrderDetail;

public interface ISaleOrderDetailService {

	/**
	 * 通过ID查看销售订单详细
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
	public boolean addSaleOrderDetail(SaleOrderDetail saleOrderDetail);

}
