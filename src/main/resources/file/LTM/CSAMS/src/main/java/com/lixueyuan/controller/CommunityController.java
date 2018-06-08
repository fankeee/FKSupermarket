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

import com.lixueyuan.po.Community;
import com.lixueyuan.po.Manager;
import com.lixueyuan.po.Member;
import com.lixueyuan.service.CommunityService;
import com.lixueyuan.util.PagedResult;

@Controller
@RequestMapping(value = "/Community")
public class CommunityController {

	@Autowired
	private CommunityService communityService;

	// 1根据id查询
	@RequestMapping("/findCommunityById")
	public @ResponseBody Community findCommunityById(Model model, String c_id) {
		System.out.println("===============findMemberById=================");
		System.out.println("c_id:" + c_id);
		int id = Integer.parseInt(c_id);
		Community community = communityService.findCommunityById(id);
		System.out.println("community:" + community.getC_name());
		// model.addAttribute("member", member);
		return community;
	}

	// 2查询所有(分页查询)
	@RequestMapping("/findAllCommunity")
	public String findAllCommunity(Model model, String type, Integer pageNo,
			Integer pageSize) {
		System.out.println("===========findAllAdmin==============");
		System.out.println("传到type的值：" + type);
		PagedResult<Community> pagedResult = (PagedResult<Community>) communityService
				.findAllCommunity(pageNo, pageSize);
		model.addAttribute("pagedResult", pagedResult);
		List<Community> communityList = pagedResult.getDataList();
		System.out.println("当前页码：" + pageNo);
		System.out.println("总页数：" + pageSize);
		System.out.println(pagedResult.getPages());
		model.addAttribute("communityList", communityList);
		if (type.equals("show1")) {
			System.out.println("===========进入删除社团联系人页面===========");
			return "jsp/sonpage/community/communityson/delcommunity";
		}
		if (type.equals("show2")) {
			return "jsp/sonpage/community/communityson/updatecommunity";
		}
		
		if (type.equals("show4")) {
			return "jsp/sonpage/member/memberson/addMember";
		}
		return "";
	}
	
	@RequestMapping("/findAllCu")
	public String findAllCu(Model model, String type, Integer pageNo,
			Integer pageSize) {
		System.out.println("===========findAllAdmin==============");
		System.out.println("传到type的值：" + type);
		PagedResult<Community> pagedResult = (PagedResult<Community>) communityService
				.findAllCommunity(pageNo, pageSize);
		model.addAttribute("pagedResult", pagedResult);
		List<Community> communityList = pagedResult.getDataList();
		System.out.println("当前页码：" + pageNo);
		System.out.println("总页数：" + pageSize);
		System.out.println(pagedResult.getPages());
		model.addAttribute("communityList", communityList);
		return "jsp/sonpage/community/communityson/findcommunity";
	}

	// 3模糊查询
	@RequestMapping("/findLikeNameCommunity")
	public String findLikeNameCommunity(String c_name, String c_people, Model model,
			String type) {
		System.out.println("===========模糊查询===========");
		//String a_id = id;
		//String a_name = name;
		System.out.println("c_name:" + c_name);
		System.out.println("c_people:" + c_people);
		Map map = new HashMap();
		map.put("c_name", c_name);
		map.put("c_people", c_people);
		List<Community> communityList = communityService.findLikeNameCommunity(map);
		model.addAttribute("communityList", communityList);
		// 修改联系人（页面）
		if (type.equals("show2")) {
			if (("").equals(c_name) && ("").equals(c_people)) {
				System.out.println("2没有传值");
				return "forward:findAllCommunity.action?type";
			}
			System.out.println("=====================");
			return "jsp/sonpage/community/communityson/updatecommunity";
		}
		// 删除联系人（页面）
		if (type.equals("show1")) {
			if (("").equals(c_name) && ("").equals(c_people)) {
				System.out.println("1没有传值");
				return "forward:findAllCommunity.action?type";
			}
			System.out.println("=========返回删除联系人页面============");
			return "jsp/sonpage/community/communityson/delcommunity";
		}
		// 查询联系人（页面）
		if (type.equals("show")) {
			if (("").equals(c_name) && ("").equals(c_people)) {
				System.out.println("没有传值");
				return "forward:findAllCommunity.action?type";
			}
			System.out.println("=========返回删除联系人页面============");
			return "jsp/sonpage/community/communityson/findcommunity";
		}
		return "";
	}

	// 4添加社团信息
	@RequestMapping("/addCommunity")
	public String addCommunity(Community community) {
		System.out.println("===========添加社团信息=============");
		communityService.addCommunity(community);
		return "jsp/sonpage/community/communityson/addcommunity";
	}

	// 5删除社团
	@RequestMapping("/delCommunity")
	public String delCommunity(String c_id) {
		System.out.println("========删除社团联系人========");
		System.out.println("页面传值：" + c_id);
		int id = Integer.parseInt(c_id);
		communityService.delCommunity(id);
		return "forward:findAllCommunity.action?type=show1";
	}

	// 6修改社团联系人
	@RequestMapping("/updateCommunity")
	public String updateCommunity(Community community) {
		System.out.println("==========修改社团联系人==========");
		communityService.updateCommunity(community);
		return "forward:findAllCommunity.action?type=show2";
	}

	// 7批量删除社团联系人
	@RequestMapping("/delItem")
	public @ResponseBody boolean delItem(Model model, String ids) {
		System.out.println("==========批量删除已审批活动信息==========");
		System.out.println("ids:" + ids);
		// 用数组接收获取的选中集合
		String[] str = ids.split("_");
		for (int i = 0; i < str.length; i++) {
			int id = Integer.parseInt(str[i]);
			communityService.delCommunity(id);
			System.out.println("删除的方法执行了");
		}
		// return "forward:findAllMember.action?type=show2";
		return true;

	}

	// 8登陆（根据学号查找）
	@RequestMapping("/findCommunityByNum")
	public @ResponseBody boolean findCommunityByNum(HttpSession session, String num,String pwd) {
		System.out.println("===============findAdminByNum=================");
		System.out.println("num:" + num);
		
		Subject subject = SecurityUtils.getSubject();
		subject.getSession().setAttribute("userType", "Community");
		// 保存至令牌环中，供MyRealm做验证
		UsernamePasswordToken token = new UsernamePasswordToken(num, pwd);
		// 保存用户类型供MyRealm获取
		
		try {
			// 跳转到MyRealm 做登录用户名和密码验证
			subject.login(token);
			session.setAttribute("num", num);
			session.setAttribute("role", "1");
			System.out.println("CommunityController-->>findCommunityByNum-->>登录成功");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("CommunityController-->>findCommunityByNum-->>登录失败");
			return false;
		}
		
//		Community community=communityService.findCommunityByNum(num);
//		System.out.println("manager:" + community.getC_name());
//		session.setAttribute("num", num);
//		session.setAttribute("role", "2");
//		String a_pwd=community.getC_pwd();
//		if(a_pwd.equals(pwd)){
//			return true;
//		}else{
//			return false;
//		}
	}
	
	//9修改密码
	@RequestMapping("/updateCommunityPwd")
	public @ResponseBody boolean updateCommunityPwd(Model model,String num,String oldPwd,String newPwd){
		System.out.println("===============updateCommunityPwd=================");
		System.out.println("新密码："+newPwd);
		System.out.println("num："+num);
		Community community=communityService.findCommunityByNum(num);
		String pwd=community.getC_pwd();
		if(pwd.equals(oldPwd)){
			communityService.updateCommunityPwd(newPwd,num);
			return true;
		}else{
			return false;
		}
	}
	//查询所有
	@RequestMapping("/findAllCommunity1")
	public String findAllCommunity1(Model model, String type) {
		System.out.println("===========findAllAdmin==============");
		System.out.println("传到type的值：" + type);
		List<Community> communityList=communityService.findAllCommunity();
		model.addAttribute("communityList", communityList);
		if(type.equals("show2")){
			return "jsp/sonpage/member/memberson/addMember";
		}
		if(type.equals("show1")){
			return "jsp/sonpage/manager/managerson/addManager";
		}
		return "";
	}
	// 查询所有协会(分页查询)
	@RequestMapping("/findCommunity")
	public String findCommunity(Model model, String type, Integer pageNo,
			Integer pageSize) {
		System.out.println("===========findAllAdmin==============");
		System.out.println("传到type的值：" + type);
		PagedResult<Community> pagedResult = (PagedResult<Community>) communityService
				.findCommunity(pageNo, pageSize);
		model.addAttribute("pagedResult", pagedResult);
		List<Community> communityList = pagedResult.getDataList();
		System.out.println("当前页码：" + pageNo);
		System.out.println("总页数：" + pageSize);
		System.out.println(pagedResult.getPages());
		model.addAttribute("communityList", communityList);
		return "jsp/sonpage/member/memberson/inCommunity";
	}
}
