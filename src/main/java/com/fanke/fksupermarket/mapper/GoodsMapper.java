package com.fanke.fksupermarket.mapper;

import java.util.List;
import java.util.Map;

import com.fanke.fksupermarket.po.Goods;

/**
 * 商品接口
 * 
 * @author Fk
 *
 */
public interface GoodsMapper {

	/**
	 * 根据商品ID查询
	 * 
	 * @param g_id
	 * @return
	 */
	public Goods findGoodsById(int g_id);

	/**
	 * 获取商品库存量
	 * 
	 * @param gsid
	 * @return
	 */
	public Goods getInventoryByGid(int gsid);

	/**
	 * 更新商品信息
	 * 
	 * @param goods
	 * @return
	 */
	public int updateGoods(Goods goods);

	/**
	 * 查询所有商品
	 * 
	 * @return
	 */
	public List<Goods> findAllGoods();

	/**
	 * 条件查询
	 * 
	 * @param conditionalMap
	 * @return
	 */
	public List<Goods> conditionalQuery(Map<Object, Object> conditionalMap);

	/**
	 * 根据ID删除商品信息
	 * 
	 * @param g_id
	 */
	public void deleteGoodsById(Integer g_id);
}
