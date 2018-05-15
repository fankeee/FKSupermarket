package com.fanke.fksupermarket.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fanke.fksupermarket.mapper.GoodsMapper;
import com.fanke.fksupermarket.po.Goods;
import com.fanke.fksupermarket.po.SaleOrder;
import com.fanke.fksupermarket.service.IGoodsService;
import com.fanke.fksupermarket.util.BeanUtil;
import com.fanke.fksupermarket.util.PagedResult;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service
public class GoodsServiceImpl implements IGoodsService {

	@Autowired
	GoodsMapper goodsMapper;

	@Override
	public Goods findGoodsById(int g_id) {
		// TODO Auto-generated method stub

		return goodsMapper.findGoodsById(g_id);
	}

	@Override
	public Goods getInventoryByGid(int gsid) {
		// TODO Auto-generated method stub
		return goodsMapper.findGoodsById(gsid);
	}

	@Override
	public boolean updateInventory(Goods goods) {
		// TODO Auto-generated method stub
		int result = goodsMapper.updateGoods(goods);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public PagedResult<Goods> findAllGoods(Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;

		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
		Page pg = PageHelper.startPage(pageNo, pageSize);

		PagedResult<Goods> result = BeanUtil.toPagedResult(goodsMapper.findAllGoods());
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
		return BeanUtil.toPagedResult(goodsMapper.findAllGoods());
	}

	@Override
	public List<Goods> conditionalQuery(Map<Object, Object> conditionalMap) {
		// TODO Auto-generated method stub
		return goodsMapper.conditionalQuery(conditionalMap);
	}

	@Override
	public void updateGoods(Goods goods) {
		// TODO Auto-generated method stub
		goodsMapper.updateGoods(goods);
	}

	@Override
	public void deleteGoodsById(Integer g_id) {
		// TODO Auto-generated method stub
		goodsMapper.deleteGoodsById(g_id);
	}

}
