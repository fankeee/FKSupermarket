package com.lixueyuan.mapper;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.lixueyuan.po.Community;


public interface CommunityMapper {
	//1根据id查询
	public Community findCommunityById(int id);
	//2查询所有
	public List<Community> findAllCommunity();
	//3模糊查询
	public List<Community> findLikeNameCommunity(Map map);
	//4添加社团联系人
	public void addCommunity(Community community);
	//5删除社团联系人
	public void delCommunity(int id);
	//6修改社团联系人
	public void updateCommunity(Community community);
	//7根据学号查找
	public Community findCommunityByNum(String num);
	//8修改密码
	public void updateCommunityPwd(String newPwd,String num);
	//9查询所有(分页显示)
	List<Community> findCommunity();
	//10获取权限名称
	public Set<String> getRoles(String c_num);
}
