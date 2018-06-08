package com.lixueyuan.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.lixueyuan.mapper.CommunityMapper;
import com.lixueyuan.po.Community;
import com.lixueyuan.service.CommunityService;
import com.lixueyuan.util.BeanUtil;
import com.lixueyuan.util.PagedResult;

@Service("AdminService")
public class CommunityServiceImpl implements CommunityService {
	@Autowired
	private CommunityMapper communityMapper;

	// 1根据id查询
	@Override
	public Community findCommunityById(int id) {
		return communityMapper.findCommunityById(id);
	}

	// 2查询所有
	@Override
	public PagedResult<Community> findAllCommunity(Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null ? 1 : pageNo;// 当前页
		pageSize = pageSize == null ? 5 : pageSize;// 条数
		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个
		PageHelper.startPage(pageNo, pageSize);
		PagedResult<Community> admin = BeanUtil.toPagedResult(communityMapper.findAllCommunity());
		int Pages = (int) admin.getPages();
		pageNo = pageNo < 1 ? 1 : pageNo;
		pageNo = pageNo > Pages ? Pages : pageNo;
		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.toPagedResult(communityMapper.findAllCommunity());
	}

	// 3模糊查询
	@Override
	public List<Community> findLikeNameCommunity(Map map) {
		System.out.println("==========findLikeNameAdmin============");

		return communityMapper.findLikeNameCommunity(map);
	}

	// 4添加社团联系人
	@Override
	public void addCommunity(Community community) {
		communityMapper.addCommunity(community);

	}

	// 5删除社团联系人
	@Override
	public void delCommunity(int id) {
		communityMapper.delCommunity(id);

	}

	// 6修改社团联系人
	@Override
	public void updateCommunity(Community community) {
		communityMapper.updateCommunity(community);

	}

	// 7根据学号查找
	@Override
	public Community findCommunityByNum(String num) {
		return communityMapper.findCommunityByNum(num);
	}

	// 8修改密码
	public void updateCommunityPwd(String newPwd, String num) {
		System.out.println(newPwd);
		System.out.println(num);
		communityMapper.updateCommunityPwd(newPwd, num);
	}

	@Override
	public List<Community> findAllCommunity() {
		// TODO Auto-generated method stub
		return communityMapper.findAllCommunity();
	}

	@Override
	public PagedResult<Community> findCommunity(Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null ? 1 : pageNo;// 当前页
		pageSize = pageSize == null ? 5 : pageSize;// 条数
		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个
		PageHelper.startPage(pageNo, pageSize);
		PagedResult<Community> admin = BeanUtil.toPagedResult(communityMapper.findCommunity());
		int Pages = (int) admin.getPages();
		pageNo = pageNo < 1 ? 1 : pageNo;
		pageNo = pageNo > Pages ? Pages : pageNo;
		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.toPagedResult(communityMapper.findCommunity());
	}

	@Override
	public Set<String> getRoles(String c_num) {
		// TODO Auto-generated method stub
		return communityMapper.getRoles(c_num);
	}

}
