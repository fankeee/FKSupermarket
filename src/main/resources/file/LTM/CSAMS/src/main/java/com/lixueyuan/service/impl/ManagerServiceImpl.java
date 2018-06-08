package com.lixueyuan.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.lixueyuan.mapper.ManagerMapper;
import com.lixueyuan.po.Manager;
import com.lixueyuan.service.ManagerService;
import com.lixueyuan.util.BeanUtil;
import com.lixueyuan.util.PagedResult;

@Service
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	private ManagerMapper managerMapper;

	// 1根据id查询
	@Override
	public Manager findManagerById(int id) {
		return managerMapper.findManagerById(id);
	}

	// 2查询所有
	@Override
	public PagedResult<Manager> findAllManager(Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null ? 1 : pageNo;// 当前页
		pageSize = pageSize == null ? 5 : pageSize;// 条数
		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个
		PageHelper.startPage(pageNo, pageSize);
		PagedResult<Manager> manager = BeanUtil.toPagedResult(managerMapper.findAllManager());
		int Pages = (int) manager.getPages();
		pageNo = pageNo < 1 ? 1 : pageNo;
		pageNo = pageNo > Pages ? Pages : pageNo;
		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.toPagedResult(managerMapper.findAllManager());
	}

	// 3模糊查询
	@Override
	public List<Manager> findLikeNameManager(Map map) {

		return managerMapper.findLikeNameManager(map);
	}

	// 4添加社团联系人
	@Override
	public void addManager(Manager manager) {
		managerMapper.addManager(manager);

	}

	// 5删除社团联系人
	@Override
	public void delManager(int id) {
		managerMapper.delManager(id);

	}

	// 6修改社团联系人
	@Override
	public void updateManager(Manager manager) {
		managerMapper.updateManager(manager);

	}

	// 7根据学号查找
	@Override
	public Manager findManagerByNum(String num) {
		return managerMapper.findManagerByNum(num);
	}

	// 8修改密码
	public void updateManagerPwd(String MA_pwd, String MA_num) {
		managerMapper.updateManagerPwd(MA_pwd, MA_num);
	}

	@Override
	public Set<String> getRoles(String MA_num) {
		// TODO Auto-generated method stub
		return managerMapper.getRoles(MA_num);
	}
}
