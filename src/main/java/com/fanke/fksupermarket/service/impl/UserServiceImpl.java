package com.fanke.fksupermarket.service.impl;

import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fanke.fksupermarket.mapper.UserMapper;
import com.fanke.fksupermarket.po.Member;
import com.fanke.fksupermarket.po.User;
import com.fanke.fksupermarket.service.IUserService;
import com.fanke.fksupermarket.util.BeanUtil;
import com.fanke.fksupermarket.util.PagedResult;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

/**
 * 用户业务实现类
 * 
 * @author Fk
 *
 */
@Service
public class UserServiceImpl implements IUserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public Boolean checkUserID(int userID) {
		// TODO Auto-generated method stub
		User result = userMapper.findUserById(userID);
		if (result != null)
			return true;
		else
			return false;
	}

	@Override
	public Set<String> getRoles(Integer userId) {
		// TODO Auto-generated method stub
		return userMapper.getRoles(userId);
	}

	@Override
	public User getByUsername(String username) {
		// TODO Auto-generated method stub
		return userMapper.getByUsername(username);
	}

	@Override
	public User getByUid(int uid) {
		// TODO Auto-generated method stub
		return userMapper.findUserById(uid);
	}

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		userMapper.addUser(user);
	}

	@Override
	public List<User> conditionalQuery(User user) {
		// TODO Auto-generated method stub
		return userMapper.conditionalQuery(user);
	}

	@Override
	public PagedResult<User> findAllUser(Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;

		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
		Page pg = PageHelper.startPage(pageNo, pageSize);

		PagedResult<User> result = BeanUtil.toPagedResult(userMapper.findAllUser());
		int p = (int) result.getPages();

		// 当前页码不能小于1，且不能大于总页数
		if (pageNo <= 1) {
			pageNo = 1;
		}
		if (pageNo > p) {
			pageNo = p;
		}

		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
		Page page = PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.toPagedResult(userMapper.findAllUser());
	}

	@Override
	public void deleteUserById(Integer u_id) {
		// TODO Auto-generated method stub
		userMapper.deleteUserById(u_id);
	}

	@Override
	public User findUserById(Integer u_id) {
		// TODO Auto-generated method stub
		return userMapper.findUserById(u_id);
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		userMapper.updateUser(user);

	}

}
