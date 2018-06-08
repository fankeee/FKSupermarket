package com.lixueyuan.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lixueyuan.po.Manager;
import com.lixueyuan.service.ManagerService;
import com.lixueyuan.util.PagedResult;

@Controller
@RequestMapping(value = "/Manager")
public class ManagerController {
	@Autowired
	private ManagerService managerService;

	// 1根据id查询
	@RequestMapping("/findManagerById")
	public @ResponseBody Manager findManagerById(Model model,String ma_id){
		System.out.println("===============findManagerById=================");
		System.out.println("MA_id:"+ma_id);
		int id=Integer.parseInt(ma_id);
		Manager manager=managerService.findManagerById(id);
		System.out.println("manager:"+manager.getMA_name());
		model.addAttribute("manager", manager);
		return manager;
	}
	// 2查询所有(分页显示)
	@RequestMapping("/findAllManager")
	public String findAllManager(Model model, String type, Integer pageNo,
			Integer pageSize) {
		System.out.println("===========findAllManager==============");
		System.out.println("传到type的值：" + type);
		PagedResult<Manager> pagedResult = (PagedResult<Manager>) managerService
				.findAllManager(pageNo, pageSize);
		model.addAttribute("pagedResult", pagedResult);
		List<Manager> managerList = pagedResult.getDataList();
		System.out.println("当前页码：" + pageNo);
		System.out.println("总页数：" + pageSize);
		System.out.println(pagedResult.getPages());
		model.addAttribute("managerList", managerList);
		if (type.equals("show1")) {
			return "jsp/sonpage/manager/managerson/findManager";
		}
		if (type.equals("show2")) {
			return "jsp/sonpage/manager/managerson/delManager";
		}
		return "";
	}

	// 3模糊查询
	@RequestMapping("/findLikeNameManager")
	public String findLikeNameManager(String ma_id, String ma_name,
			Model model, String type) {
		System.out.println("===========模糊查询系统管理员信息============");
		//String ma_id=id;
		//String ma_name=name;
		System.out.println("ma_id:" + ma_id);
		System.out.println("ma_name:" + ma_name);
		System.out.println("type:" + type);
		Map map = new HashMap();
		map.put("ma_id", ma_id);
		map.put("ma_name", ma_name);
		List<Manager> managerList = managerService.findLikeNameManager(map);
		model.addAttribute("managerList", managerList);
		if (type.equals("show1")) {
			System.out.println("===========从查询管理员信息页面===========");
			if (("").equals(ma_id) && ("").equals(ma_name)) {
				System.out.println("1没有传值");
				return "forward:findAllManager.action?type";
			}
			System.out
					.println("===================跳回查询页面======================");
			return "jsp/sonpage/manager/managerson/findManager";
		}
		if (type.equals("show2")) {
			System.out.println("===========从删除管理员信息页面===========");
			if (("").equals(ma_id) && ("").equals(ma_name)) {
				System.out.println("2没有传值");
				return "forward:findAllManager.action?type";
			}
			System.out
					.println("===================跳回删除页面======================");
			return "jsp/sonpage/manager/managerson/delManager";
		}
		return "";
	}

	// 4添加系统管理员
	@RequestMapping("/addManager")
	public String addManager(Manager manager) {
		System.out.println("=========添加系统管理员=========");
		System.out.println("姓名：" + manager.getMA_name());
		managerService.addManager(manager);
		return "jsp/sonpage/manager/managerson/addManager";
	}

	// 5删除系统管理员
	@RequestMapping("/delManager")
	public String delManager(String MA_id) {
		System.out.println("===========删除系统管理员===========");
		System.out.println("MA_id:" + MA_id);
		int id = Integer.parseInt(MA_id);
		managerService.delManager(id);
		return "forward:findAllManager.action?type=show2";
	}

	// 6修改系统管理员
	@RequestMapping("/updateManager")
	public String updateManager(Manager manager) {
		System.out.println("=========修改系统管理员=========");
		System.out.println("名字："+manager.getMA_name());
		managerService.updateManager(manager);
		return "forward:findAllManager.action?type=show1";
	}

	// 8批量删除管理员信息
	@RequestMapping("/delItem")
	public @ResponseBody boolean delItem(Model model, String ids) {
		System.out.println("==========批量删除已审批活动信息==========");
		System.out.println("ids:" + ids);
		// 用数组接收获取的选中集合
		String[] str = ids.split("_");
		for (int i = 0; i < str.length; i++) {
			int id = Integer.parseInt(str[i]);
			managerService.delManager(id);
			System.out.println("删除的方法执行了");
		}
		// return "forward:findAllMember.action?type=show2";
		return true;

	}
	//9登陆（根据学号查找）
	@RequestMapping("/findManagerByNum")
	public @ResponseBody boolean findManagerByNum(HttpSession session,String num,String pwd){
		System.out.println("===============findManagerByNum=================");
		System.out.println("num:"+num);

		Subject subject = SecurityUtils.getSubject();
		subject.getSession().setAttribute("userType", "Manager");
		// 保存至令牌环中，供MyRealm做验证
		UsernamePasswordToken token = new UsernamePasswordToken(num, pwd);
		// 保存用户类型供MyRealm获取
		
		try {
			// 跳转到MyRealm 做登录用户名和密码验证
			subject.login(token);
			session.setAttribute("num", num);
			session.setAttribute("role", "2");
			System.out.println("ManagerController-->>findManagerByNum-->>登录成功");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("ManagerController-->>findManagerByNum-->>登录失败");
			return false;
		}
		
//		Manager manager=managerService.findManagerByNum(num);
//		System.out.println("manager:"+manager.getMA_pwd());
//		String MA_pwd=manager.getMA_pwd();
//		session.setAttribute("num", num);
//		session.setAttribute("role", "2");
//		if(MA_pwd.equals(pwd)){
//			System.out.println("返回值是真");
//			return true;
//		}else{
//			return false;
//		}
	}
	
	// 登出
	@RequestMapping("/logout")
	public String logout(Model model) {
		
		Subject subject = SecurityUtils.getSubject();
		System.out.println("==========>>>>>>>>logout>>>>>>======"+subject.getPrincipal().toString());
		subject.logout();
		System.out.println("****************logout成功*************");
		return "/jsp/sonpage/login";
	}
	
	//9修改密码
	@RequestMapping("/updateManagerPwd")
	public @ResponseBody boolean updateManagerPwd(Model model,String num,String oldPwd,String newPwd){
		System.out.println("===============updateManagerPwd=================");
		System.out.println("旧密码："+oldPwd);
		System.out.println("新密码："+newPwd);
		String MA_pwd=newPwd;
		String MA_num=num;
		Manager manager=managerService.findManagerByNum(num);
		String pwd=manager.getMA_pwd();
		if(pwd.equals(oldPwd)){
			managerService.updateManagerPwd(MA_pwd,MA_num);
			return true;
		}else{
			return false;
		}
	}
}
