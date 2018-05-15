package com.fanke.fksupermarket.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fanke.fksupermarket.mapper.SaleOrderDetailMapper;
import com.fanke.fksupermarket.po.SaleOrderDetail;
import com.fanke.fksupermarket.service.ISaleOrderDetailService;

@Service
public class SaleOrderDetailServiceImpl implements ISaleOrderDetailService {

	@Autowired
	SaleOrderDetailMapper saleOrderDetailMapper;

	@Override
	public List<SaleOrderDetail> getSaleOrderDetailById(Integer s_id) {
		// TODO Auto-generated method stub
		return saleOrderDetailMapper.getSaleOrderDetailById(s_id);
	}

	@Override
	public boolean addSaleOrderDetail(SaleOrderDetail saleOrderDetail) {
		// TODO Auto-generated method stub
		int result = saleOrderDetailMapper.addSaleOrderDetail(saleOrderDetail);
		if (result > 0)
			return true;
		else
			return false;
	}

}
