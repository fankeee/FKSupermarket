package com.lixueyuan.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.lixueyuan.mapper.ActgGoodsMapper;
import com.lixueyuan.mapper.ActivityMapper;
import com.lixueyuan.mapper.GoodsMapper;
import com.lixueyuan.po.ActgGoods;
import com.lixueyuan.po.Activity;
import com.lixueyuan.po.Goods;
import com.lixueyuan.service.ActivityService;
import com.lixueyuan.util.BeanUtil;
import com.lixueyuan.util.PagedResult;

@Service("ActivityService")
public class ActivityServiceImpl implements ActivityService{
	@Autowired
	private ActivityMapper activityMapper;
	@Autowired
	private ActgGoodsMapper actgGoodsMapper;
	
	@Autowired
	private GoodsMapper goodsMapper;

	// 1根据id查询
	@Override
	public Activity findActivityById(int id) {
		// TODO Auto-generated method stub
		return activityMapper.findActivityById(id);
	}

	// 2查询所有未审核活动信息
	@Override
	public PagedResult<Activity> findAllActivity(Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null ? 1 : pageNo;// 当前页
		pageSize = pageSize == null ? 5 : pageSize;// 条数
		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个
		PageHelper.startPage(pageNo, pageSize);
		PagedResult<Activity> activity = BeanUtil.toPagedResult(activityMapper.findAllActivity());
		int Pages = (int) activity.getPages();
		pageNo = pageNo < 1 ? 1 : pageNo;
		pageNo = pageNo > Pages ? Pages : pageNo;
		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.toPagedResult(activityMapper.findAllActivity());
	}

	// 3模糊查询
	@Override
	public List<Activity> findLikeNameActivity(Map map) {
		return activityMapper.findLikeNameActivity(map);
	}

	// 4添加活动信息
	@Override
	public void addActivity(Activity activity) {
		activityMapper.addActivity(activity);
	}

	// 5删除活动信息
	@Override
	public void delActivity(int id) {
		activityMapper.delActivity(id);
	}

	// 6修改活动信息
	@Override
	public void updateActivity(Activity activity) {
		activityMapper.updateActivity(activity);
	}

	// 7查询所有已审核活动信息
	@Override
	public PagedResult<Activity> findAllCActivity(Integer pageNo,Integer pageSize) {
		pageNo = pageNo == null ? 1 : pageNo;// 当前页
		pageSize = pageSize == null ? 5 : pageSize;// 条数
		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个
		PageHelper.startPage(pageNo, pageSize);
		PagedResult<Activity> activity = BeanUtil.toPagedResult(activityMapper.findAllActivity());
		int Pages = (int) activity.getPages();
		pageNo = pageNo < 1 ? 1 : pageNo;
		pageNo = pageNo > Pages ? Pages : pageNo;
		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.toPagedResult(activityMapper.findAllCActivity());
	}

	// 8模糊查询已审核活动信息
	@Override
	public List<Activity> findLikeNameCActivity(Map map) {
		// TODO Auto-generated method stub
		return activityMapper.findLikeNameCActivity(map);
	}

	@Override
	public void updateActivityNById(String remark,int id) {
		activityMapper.updateActivityNById(remark,id);
		
	}

	@Override
	public void updateActivityById(int id) {
		activityMapper.updateActivityById(id);
		
	}

	@Override
	public List<Activity> findshow() {
		
		return activityMapper.findshow();
	}

	@Override
	public List<Goods> findAllGoods() {
		// TODO Auto-generated method stub
		return goodsMapper.findAllGoods();
	}

	@Override
	public boolean addActivityGoods(Integer AC_id, String[] arrNums, String[] arrIds) {
		// TODO Auto-generated method stub
		int res = 0;
		boolean result = false;
		ActgGoods actgGoods = null;
		for (int i = 0; i < arrIds.length; i++) {
			actgGoods = new ActgGoods(Integer.valueOf(arrIds[i]), AC_id, Integer.valueOf(arrNums[i]));
			res = actgGoodsMapper.addActivityGoods(actgGoods);
			if(res<1){
				result = false;
				break;
			}else{
				result = true;
			}
		}
		return result;
	}

}
