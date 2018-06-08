package com.lixueyuan.service;


import java.util.List;
import java.util.Map;

import com.lixueyuan.po.Activity;
import com.lixueyuan.po.Goods;
import com.lixueyuan.util.PagedResult;

public interface ActivityService {
	// 1根据id查询
	public Activity findActivityById(int id);

	// 2查询所有未审核活动信息
	public PagedResult<Activity> findAllActivity(Integer pageNo,Integer pageSize);

	// 3模糊查询未审核活动信息
	public List<Activity> findLikeNameActivity(Map map);

	// 4添加活动信息
	public void addActivity(Activity activity);

	// 5删除活动信息
	public void delActivity(int id);

	// 6修改活动信息
	public void updateActivity(Activity activity);
	
	// 7查询所有已审核活动信息
	public PagedResult<Activity> findAllCActivity(Integer pageNo,Integer pageSize);
	
	// 8模糊查询已审核活动信息
	public List<Activity> findLikeNameCActivity(Map map);
	
	// 9审批
	public void updateActivityNById(String remark,int id);
	
	// 10审批
	public void updateActivityById(int id);
	
	//11首页显示
	public List<Activity> findshow();
	
	// 查询所有物品
	public List<Goods> findAllGoods();

	// 添加活动物品
	public boolean addActivityGoods(Integer aC_id, String[] arrNums, String[] arrIds);
}
