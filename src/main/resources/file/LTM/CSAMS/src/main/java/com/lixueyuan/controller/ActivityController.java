package com.lixueyuan.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lixueyuan.po.Activity;
import com.lixueyuan.po.Goods;
import com.lixueyuan.service.ActivityService;
import com.lixueyuan.util.PagedResult;

@Controller
@RequestMapping(value = "/Activity")
public class ActivityController {
	@Autowired
	private ActivityService activityService;

	// 1根据id查询
	@RequestMapping("/findActivityById")
	public @ResponseBody Activity findActivityById(Model model, String AC_id) {
		System.out.println("用户传过来的id值：" + AC_id);
		int id = Integer.parseInt(AC_id);
		Activity activity = activityService.findActivityById(id);
		System.out.println("查到的值："+activity.getAC_theme());
		return activity;
	}

	// 2查询所有未审核活动信息(分页)
	@RequestMapping("/findAllActivity")
	public String findAllActivity(Model model, String type, Integer pageNo,
			Integer pageSize) {
		System.out.println("===========查询所有未审核活动信息==============");
		System.out.println("传到type的值：" + type);
		PagedResult<Activity> pagedResult = (PagedResult<Activity>) activityService
				.findAllActivity(pageNo, pageSize);
		model.addAttribute("pagedResult", pagedResult);
		List<Activity> activityList = pagedResult.getDataList();
		System.out.println("当前页码：" + pageNo);
		System.out.println("总页数：" + pageSize);
		System.out.println(pagedResult.getPages());
		model.addAttribute("activityList", activityList);
		return "jsp/sonpage/activity/activityson/findActivity";
	}

	// 3模糊查询未审核活动信息
	@RequestMapping("/findLikeNameActivity")
	public String findLikeNameActivity(String AC_id, String AC_theme,
			Model model, String type) {
		System.out.println("===========模糊查询未审核活动信息============");
		System.out.println("AC_id:" + AC_id);
		System.out.println("AC_theme:" + AC_theme);
		//String AC_id=ac_id;
		//String AC_theme=ac_theme;
		Map map = new HashMap();
		map.put("AC_id", AC_id);
		map.put("AC_theme", AC_theme);
		List<Activity> activityList = activityService.findLikeNameActivity(map);
		model.addAttribute("activityList", activityList);
		if (type.equals("show")) {
			if (("").equals(AC_id) && ("").equals(AC_theme)) {
				System.out.println("========输入为空跳转查询所有的方法=========");
				return "forward:findAllActivity.action?type";
			}
			return "jsp/sonpage/activity/activityson/findActivity";
		}
		return "";
	}

	// 4添加活动信息
	@RequestMapping("/addActivity")
	public String addActivity(HttpServletRequest request, Activity activity) {
		System.out.println("=========添加活动信息==========");
		activityService.addActivity(activity);
		// 查询所有物品
		List<Goods> goodsList = activityService.findAllGoods();
		request.getSession().setAttribute("goodsList", goodsList);
		// 将刚添加的活动id保存，供添加活动物品时使用
		request.getSession().setAttribute("AC_id", activity.getAC_id());
		// 跳转到添加物品
		return "redirect:../jsp/sonpage/activity/activityson/addActivityGoods.jsp";
	}

	// 5删除活动信息
	@RequestMapping("/delActivity")
	public String delActivity(int AC_id) {
		System.out.println("============根据id删除活动信息============");
		System.out.println("页面传值：" + AC_id);
		activityService.delActivity(AC_id);
		return "forward:findAllCActivity.action?type=show1";
	}

	// 6修改活动信息
	@RequestMapping("/updateActivity")
	public String updateActivity(Activity activity){
		System.out.println("===========updateActivity==============");
		System.out.println("活动编号："+activity.getAC_theme());
		activityService.updateActivity(activity);
		return "forward:findAllCActivity.action?type=show";
	}

	// 7查询所有已审核活动信息(分页)
	@RequestMapping("/findAllCActivity")
	public String findAllCActivity(Model model, String type, Integer pageNo,
			Integer pageSize) {
		System.out.println("===========查询所有已审核活动信息==============");
		System.out.println("传到type的值：" + type);
		PagedResult<Activity> pagedResult = (PagedResult<Activity>) activityService
				.findAllCActivity(pageNo, pageSize);
		model.addAttribute("pagedResult", pagedResult);
		List<Activity> activityList = pagedResult.getDataList();
		System.out.println("当前页码：" + pageNo);
		System.out.println("总页数：" + pageSize);
		System.out.println(pagedResult.getPages());
		model.addAttribute("activityList", activityList);
		if (type.equals("show1")) {
			return "jsp/sonpage/activity/activityson/delActivity";
		}
		if (type.equals("show")) {
			return "jsp/sonpage/activity/activityson/findCActivity";
		}
		return "forward:findAllCActivity.action?type=show";
	}

	// 8模糊查询已审核活动信息
	@RequestMapping("/findLikeNameCActivity")
	public String findLikeNameCActivity(String AC_id, String AC_theme,
			Model model, String type) {
		System.out.println("===========模糊查询已审核活动信息============");
		//String AC_id=id;
		//String AC_theme=theme;
		System.out.println("AC_id:" + AC_id);
		System.out.println("AC_theme:" + AC_theme);
		Map map = new HashMap();
		map.put("AC_id", AC_id);
		map.put("AC_theme", AC_theme);
		List<Activity> activityList = activityService
				.findLikeNameCActivity(map);
		model.addAttribute("activityList", activityList);
		if (type.equals("show")) {
			if (("").equals(AC_id) && ("").equals(AC_theme)) {
				return "forward:findAllCActivity.action?type";
			}
			return "jsp/sonpage/activity/activityson/findCActivity";
		}
		if (type.equals("show1")) {
			if (("").equals(AC_id) && ("").equals(AC_theme)) {
				return "forward:findAllCActivity.action?type";
			}
			return "jsp/sonpage/activity/activityson/delActivity";
		}
		return "";
	}

	// 8批量删除已审批活动信息
	@RequestMapping("/delItem")
	public @ResponseBody boolean delItem(Model model, String ids) {
		System.out.println("==========批量删除已审批活动信息==========");
		System.out.println("ids:" + ids);
		// 用数组接收获取的选中集合
		String[] str = ids.split("_");
		for (int i = 0; i < str.length; i++) {
			int id = Integer.parseInt(str[i]);
			activityService.delActivity(id);
			System.out.println("删除的方法执行了");
		}
		// return "forward:findAllMember.action?type=show2";
		return true;

	}
	
	//审批(同意)
	@RequestMapping("/updateActivityById")
	public @ResponseBody boolean updateActivityById(String id){
		System.out.println("===========updateActivityById==============");
		int AC_id=Integer.parseInt(id);
		activityService.updateActivityById(AC_id);
		return true;
	}
	
	//审批(不同意)
	@RequestMapping("/updateActivityNById")
	public @ResponseBody boolean updateActivityNById(String id,String AC_remark){
		System.out.println("===========updateActivityNById==============");
		int AC_id=Integer.parseInt(id);
		activityService.updateActivityNById(AC_remark,AC_id);
		return true;
	}
	
	//首页显示
	@RequestMapping("/show")
	public String show(HttpServletRequest request,Model model){
		System.out.println("===========show==============");
		List<Activity> activityList=activityService.findshow();
		request.getSession().setAttribute("activityList", activityList);
		return "redirect:../jsp/sonpage/index.jsp";
	}

	// 添加活动物品
	@RequestMapping("/addActivityGoods")
	@ResponseBody
	public boolean addActivityGoods(HttpServletRequest request, String strnums, String strids) {
		System.out.println("数量：" + strnums);
		System.out.println("ID：" + strids);
		String[] arrNums = strnums.split(",");
		String[] arrIds = strids.split(",");
		if (arrNums.length < 1 || arrIds.length < 1) {
			return false;
		} else {
			// 获取活动ID
			System.out.println(request.getSession().getAttribute("AC_id"));
			Integer AC_id = (Integer) request.getSession().getAttribute("AC_id");
			boolean result = activityService.addActivityGoods(AC_id, arrNums, arrIds);
			return result;
		}

	}
}
