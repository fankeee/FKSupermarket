package com.lixueyuan.service;

import java.util.List;
import java.util.Map;

import com.lixueyuan.po.Goods;
import com.lixueyuan.util.PagedResult;

public interface GoodsService {
	//1根据id查询
	public Goods findGoodsById(int id);
	//2查询所有(分页)
	public PagedResult<Goods> findAllGoods(Integer pageNumber,Integer pageSize);
	//3添加物品信息
	public void addGoods(Goods goods);
	//4删除物品
	public void delGoods(int id);
	//5修改物品信息
	public void updateGoods(Goods goods);
	//6模糊查询
	public List<Goods> findLikeNameGoods(Map map);
	//7根据活动编号查询物品详细
	public List<Goods> findDetailGoods(int id);
}
