package com.lixueyuan.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lixueyuan.po.Activity;


public interface ActivityMapper {
	//1根据id查询
	public Activity findActivityById(int id);
	//2查询所有未审核活动（分页）
	public List<Activity> findAllActivity();
	//3模糊查询
	public List<Activity> findLikeNameActivity(Map map);
	//4添加活动信息
	public void addActivity(Activity activity);
	//5删除活动信息
	public void delActivity(int id);
	//6修改活动信息
	public void updateActivity(Activity activity);
	// 7查询所有已审核活动信息
	public List<Activity> findAllCActivity();
	// 8模糊查询已审核活动信息
	public List<Activity> findLikeNameCActivity(Map map);
	// 9审批(不同意)
	public void updateActivityNById(String remark,int id);
	// 10审批
	public void updateActivityById(int id);
	//11首页显示
	public List<Activity> findshow();
}
