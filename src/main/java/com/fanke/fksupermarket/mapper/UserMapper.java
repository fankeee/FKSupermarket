package com.fanke.fksupermarket.mapper;

import java.util.List;
import java.util.Set;

import com.fanke.fksupermarket.po.User;

/**
 * 用户接口
 * 
 * @author Fk
 *
 */
public interface UserMapper {

	/**
	 * 根据用户ID查询
	 * 
	 * @param userID
	 * @return
	 */
	public User findUserById(int userID);

	/**
	 * 根据用户ID和密码查询
	 * 
	 * @param user
	 * @return
	 */
	public User findByIdAndPwd(User user);

	/**
	 * 获取角色名
	 * 
	 * @param username
	 * @return
	 */
	public Set<String> getRoles(String username);

	/**
	 * 根据用户名获取用户
	 * 
	 * @param username
	 * @return
	 */
	public User getByUsername(String username);

	/**
	 * 添加用户
	 * 
	 * @param user
	 */
	public void addUser(User user);

	/**
	 * 查询所有用户
	 * 
	 * @return
	 */
	public List<User> conditionalQuery(User user);

	/**
	 * 查询所有用户
	 * 
	 * @return
	 */
	public List<User> findAllUser();

	/**
	 * 根据ID删除用户
	 * 
	 * @param u_id
	 */
	public void deleteUserById(Integer u_id);

	/**
	 * 修改用户
	 * 
	 * @param user
	 */
	public void updateUser(User user);
}
