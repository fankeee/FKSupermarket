package com.lixueyuan.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.lixueyuan.mapper.GoodsMapper;
import com.lixueyuan.po.Goods;
import com.lixueyuan.service.GoodsService;
import com.lixueyuan.util.BeanUtil;
import com.lixueyuan.util.PagedResult;

@Service("GoodsService")
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	private GoodsMapper goodsMapper;

	//1根据id查询
	@Override
	public Goods findGoodsById(int id) {
		return goodsMapper.findGoodsById(id);
	}

	//2查询所有
	@Override
	public PagedResult<Goods> findAllGoods(Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null ? 1 : pageNo;// 当前页
		pageSize = pageSize == null ? 5 : pageSize;// 条数
		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个
		PageHelper.startPage(pageNo, pageSize);
		PagedResult<Goods> goods = BeanUtil.toPagedResult(goodsMapper.findAllGoods());
		int Pages = (int) goods.getPages();
		pageNo = pageNo < 1 ? 1 : pageNo;
		pageNo = pageNo > Pages ? Pages : pageNo;
		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.toPagedResult(goodsMapper.findAllGoods());
	}

	//3添加物品信息
	@Override
	public void addGoods(Goods goods) {
		goodsMapper.addGoods(goods);
		
	}

	//4删除物品
	@Override
	public void delGoods(int id) {
		goodsMapper.delGoods(id);
		
	}

	//5修改物品信息
	@Override
	public void updateGoods(Goods goods) {
		goodsMapper.updateGoods(goods);
		
	}

	//6模糊查询
	@Override
	public List<Goods> findLikeNameGoods(Map map) {
		return goodsMapper.findLikeNameGoods(map);
	}
	//7根据活动编号查询物品详细
	public List<Goods> findDetailGoods(int id){
		return goodsMapper.findDetailGoods(id);
	}

}
