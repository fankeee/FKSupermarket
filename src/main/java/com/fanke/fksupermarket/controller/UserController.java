package com.fanke.fksupermarket.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fanke.fksupermarket.po.User;
import com.fanke.fksupermarket.service.IUserService;
import com.fanke.fksupermarket.util.PagedResult;

@Controller
@RequestMapping("/UserController")
public class UserController {

	@Autowired
	IUserService userService;

	private static Logger log = LoggerFactory.getLogger(UserController.class);

	/**
	 * 检查用户ID是否存在
	 * 
	 * @param username
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/checkUserID")
	@ResponseBody
	public boolean checkUserID(int username) throws IOException {

		return userService.checkUserID(username);
	}

	/**
	 * 账号登录
	 * 
	 * @param model
	 * @param username
	 *            用户名
	 * @param password
	 *            密码
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/accountLogin")
	@ResponseBody
	public boolean accountLogin(HttpServletRequest request, int username, String password) throws IOException {

		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(Integer.toString(username), password);
		try {
			subject.login(token);
			User user = userService.getByUid(username);
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("error", "");
			log.debug("UserController-->>accountLogin-->>登录成功");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.getSession().setAttribute("error", "用户名或密码错误！");
			log.debug("UserController-->>accountLogin-->>登录失败");
			return false;
		}
	}

	/**
	 * 登出
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(Model model) {

		Subject subject = SecurityUtils.getSubject();
		// subject.getPrincipal().toString());

		subject.logout();
		log.debug("UserController-->>logout-->>logout成功");
		return "redirect:/index.jsp";
	}

	/**
	 * 添加员工
	 */
	@RequestMapping("addUser")
	@ResponseBody
	public User addUser(User user) {
		userService.addUser(user);
		return user;
	}

	/**
	 * 查询所有员工
	 * 
	 * @return
	 */
	@RequestMapping("findAllUser")
	public String findAllUser(Model model, Integer pageNo, @RequestParam(defaultValue = "10") Integer pageSize) {
		PagedResult<User> pagedResult = userService.findAllUser(pageNo, pageSize);
		model.addAttribute("pagedResult", pagedResult);
		List<User> userList = pagedResult.getDataList();
		model.addAttribute("userList", userList);
		return "subPage/clerk/clerkson/clerk_son2";
	}

	/**
	 * 条件查询
	 * 
	 * @return
	 */
	@RequestMapping("conditionalQuery")
	public String conditionalQuery(Model model, Integer u_id2, String u_name2) {
		User user = new User();
		if (u_id2 != null)
			user.setU_id(u_id2);
		if (u_name2 != null && u_name2 != "")
			user.setU_name(u_name2);
		List<User> userList = userService.conditionalQuery(user);
		model.addAttribute("userList", userList);
		return "subPage/clerk/clerkson/clerk_son2";
	}

	/**
	 * 根据ID删除
	 * 
	 * @param u_id
	 * @return
	 */
	@RequestMapping("deleteUserById")
	public String deleteUserById(Integer u_id) {
		userService.deleteUserById(u_id);
		return "redirect:findAllUser.action";
	}

	/**
	 * 根据ID查询
	 * 
	 * @param u_id
	 * @return
	 */
	@RequestMapping("findUserById")
	@ResponseBody
	public User findUserById(Integer u_id) {
		return userService.findUserById(u_id);
	}

	/**
	 * 修改用户
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("updateUser")
	public String updateUser(User user) {
		userService.updateUser(user);
		return "redirect:findAllUser.action";
	}
}
