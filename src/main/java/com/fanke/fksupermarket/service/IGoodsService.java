package com.fanke.fksupermarket.service;

import java.util.List;
import java.util.Map;

import com.fanke.fksupermarket.po.Goods;
import com.fanke.fksupermarket.util.PagedResult;

public interface IGoodsService {

	/**
	 * 根据商品ID查询
	 * 
	 * @param g_id
	 * @return
	 */
	Goods findGoodsById(int g_id);

	/**
	 * 获取商品库存量
	 * 
	 * @param gsid
	 * @return
	 */
	Goods getInventoryByGid(int gsid);

	/**
	 * 更新库存量
	 * 
	 * @param goods
	 * @return
	 */
	boolean updateInventory(Goods goods);

	/**
	 * 分页查询所有商品
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	PagedResult<Goods> findAllGoods(Integer pageNo, Integer pageSize);

	/**
	 * 条件查询
	 * 
	 * @param conditionalMap
	 * @return
	 */
	List<Goods> conditionalQuery(Map<Object, Object> conditionalMap);

	/**
	 * 更新商品信息
	 * 
	 * @param goods
	 */
	void updateGoods(Goods goods);

	/**
	 * 删除商品信息
	 * 
	 * @param g_id
	 */
	void deleteGoodsById(Integer g_id);

}
