package com.lixueyuan.mapper;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lixueyuan.po.Manager;

public interface ManagerMapper {
	// 1根据id查询
	public Manager findManagerById(int id);

	// 2查询所有(分页显示)
	public List<Manager> findAllManager();

	// 3模糊查询
	public List<Manager> findLikeNameManager(Map map);

	// 4添加系统管理员
	public void addManager(Manager manager);

	// 5删除系统管理员
	public void delManager(int id);

	// 6修改系统管理员
	public void updateManager(Manager manager);
	
	// 7根据学号查找
	public Manager findManagerByNum(String num); 
	
	// 8修改密码
	public void updateManagerPwd(String MA_pwd,String MA_num);
	
	// 9获取权限名称
	public Set<String> getRoles(String MA_num);
}
