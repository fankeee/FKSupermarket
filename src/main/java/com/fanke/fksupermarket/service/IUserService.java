package com.fanke.fksupermarket.service;

import java.util.List;
import java.util.Set;

import com.fanke.fksupermarket.po.User;
import com.fanke.fksupermarket.util.PagedResult;

/**
 * 用户业务接口
 * 
 * @author Fk
 *
 */
public interface IUserService {

	/**
	 * 检查用户名是否存在
	 * 
	 * @param username
	 * @return
	 */
	public Boolean checkUserID(int userID);

	/**
	 * 获取角色名
	 * 
	 * @param username
	 * @return
	 */
	public Set<String> getRoles(String username);

	/**
	 * 根据用户名查询用户
	 * 
	 * @param username
	 * @return
	 */
	public User getByUsername(String username);

	/**
	 * 根据用户ID查询
	 * 
	 * @return
	 */
	public User getByUid(int uid);

	/**
	 * 添加用户
	 * 
	 * @param user
	 */
	public void addUser(User user);

	/**
	 * 按条件查询
	 * 
	 * @return
	 */
	public List<User> conditionalQuery(User user);

	/**
	 * 查询所有用户
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public PagedResult<User> findAllUser(Integer pageNo, Integer pageSize);

	/**
	 * 根据ID删除用户
	 * 
	 * @param u_id
	 */
	public void deleteUserById(Integer u_id);

	/**
	 * 根据查询用户
	 * 
	 * @param u_id
	 * @return
	 */
	public User findUserById(Integer u_id);

	/**
	 * 修改用户
	 * 
	 * @param user
	 */
	public void updateUser(User user);

}
