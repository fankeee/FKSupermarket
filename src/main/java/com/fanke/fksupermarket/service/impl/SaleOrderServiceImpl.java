package com.fanke.fksupermarket.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fanke.fksupermarket.mapper.SaleOrderMapper;
import com.fanke.fksupermarket.po.Monthly;
import com.fanke.fksupermarket.po.SaleOrder;
import com.fanke.fksupermarket.service.ISaleOrderService;
import com.fanke.fksupermarket.util.BeanUtil;
import com.fanke.fksupermarket.util.PagedResult;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service
public class SaleOrderServiceImpl implements ISaleOrderService {

	@Autowired
	SaleOrderMapper saleOrderMapper;

	@Override
	public PagedResult<SaleOrder> getAllSaleorder(Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;

		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
		Page pg = PageHelper.startPage(pageNo, pageSize);

		PagedResult<SaleOrder> result = BeanUtil.toPagedResult(saleOrderMapper.getAllSaleOrder());
		int p = (int) result.getPages();

		// 当前页码不能小于1，且不能大于总页数
		if (pageNo <= 1) {
			pageNo = 1;
		}
		if (pageNo > p) {
			pageNo = p;
		}

		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
		Page page = PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.toPagedResult(saleOrderMapper.getAllSaleOrder());
	}

	@Override
	public List<SaleOrder> conditionalQuery(HashMap<String, Object> map) {
		// TODO Auto-generated method stub

		return saleOrderMapper.conditionalQuery(map);
	}

	@Override
	public List<Monthly> monthlyStatistics() {
		// TODO Auto-generated method stub
		return saleOrderMapper.monthlyStatistics();
	}

	@Override
	public boolean addSaleOrder(SaleOrder saleOrder) {
		// TODO Auto-generated method stub
		System.out.println("SaleOrderServiceImpl-->>addSaleOrder");
		//int result = 
				saleOrderMapper.addSaleOrder(saleOrder);
		//if (result > 0)
			return true;
		//else
			//return false;
	}

}
