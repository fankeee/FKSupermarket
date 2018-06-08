package com.lixueyuan.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lixueyuan.po.Goods;
import com.lixueyuan.po.Member;
import com.lixueyuan.service.GoodsService;
import com.lixueyuan.util.PagedResult;

@Controller
@RequestMapping(value="/Goods")
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	//1根据id查询
	@RequestMapping("/findGoodsById")
	public @ResponseBody Goods findGoodsById(Model model,String g_id){
		System.out.println("===============findGoodsById=================");
		System.out.println("g_id:"+g_id);
		int id=Integer.parseInt(g_id);
		Goods goods=goodsService.findGoodsById(id);
		System.out.println("member:"+goods.getG_name());
		return goods;
	}
	//2查询所有(分页)
	@RequestMapping("/findAllGoods")
	public String findAllGoods(Model model,String type,Integer pageNo,Integer pageSize){
		System.out.println("===========findAllGoods==============");
		System.out.println("传到type的值："+type);
		PagedResult<Goods> pagedResult= (PagedResult<Goods>) goodsService.findAllGoods(pageNo, pageSize);
		model.addAttribute("pagedResult", pagedResult);
		List<Goods> goodsList=pagedResult.getDataList();
		System.out.println("当前页码："+pageNo);
		System.out.println("总页数："+pageSize);
		System.out.println(pagedResult.getPages());
		model.addAttribute("goodsList", goodsList);
		if (type.equals("show3")) {
			return "jsp/sonpage/goods/goodsson/delGoods";
		}
		if (type.equals("show2")) {
			return "jsp/sonpage/goods/goodsson/findGoods";
		}
		return "";
	}
	//3添加物品信息
	@RequestMapping("/addGoods")
	public String addGoods(Goods goods){
		System.out.println("=========添加物品信息==========");
		goodsService.addGoods(goods);
		return "jsp/sonpage/goods/goodsson/addGoods";
	}
	//4删除物品
	@RequestMapping("/delGoods")
	public String delGoods(String g_id){
		System.out.println("=========删除物品信息==========");
		System.out.println("g_id:"+g_id);
		int id=Integer.parseInt(g_id);
		goodsService.delGoods(id);
		return "forward:findAllGoods.action?type=show3";
	}
	//5修改物品信息
	@RequestMapping("/updateGoods")
	public String updateGoods(Goods goods){
		System.out.println("=========修改物品信息==========");
		System.out.println("goods:"+goods.getG_name());
		goodsService.updateGoods(goods);
		return "forward:findAllGoods.action?type=show2";
	}
	//6模糊查询
	@RequestMapping("/findLikeNameGoods")
	public String findLikeNameGoods(String g_id, String g_name, Model model,String type){
		System.out.println("===========模糊查询物品信息============");
		//String g_id=id;
		//String g_name=name;
		System.out.println("g_id:"+g_id);
		System.out.println("g_name:"+g_name);
		System.out.println("type:"+type);
		Map map = new HashMap();
		map.put("g_id", g_id);
		map.put("g_name", g_name);
		List<Goods> goodsList=goodsService.findLikeNameGoods(map);
		model.addAttribute("goodsList", goodsList);
		if (type.equals("show2")) {
			System.out.println("===========从查询物品页面===========");
			if(("").equals(g_id) && ("").equals(g_name)){
				System.out.println("2没有传值");
				return "forward:findAllGoods.action?type";
			}
			System.out.println("=========================================");
			return "jsp/sonpage/goods/goodsson/findGoods";
		}
		else if (type.equals("show3")) {
			System.out.println("===========从删除物品页面===========");
			if(("").equals(g_id) && ("").equals(g_name)){
				System.out.println("3没有传值");
				return "forward:findAllGoods.action?type";
			}
			return "jsp/sonpage/goods/goodsson/delGoods";
		}
		return "";
	}
	//7根据活动编号查询物品详细
	@RequestMapping("/findDetailGoods")
	public String findDetailGoods(String AC_id, Model model,String type){
		System.out.println("============根据活动编号查询物品详细===========");
		System.out.println("AC_id:"+AC_id);
		System.out.println("type:"+type);
		int id=Integer.parseInt(AC_id);
		List<Goods> goodsList=goodsService.findDetailGoods(id);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("AC_id", AC_id);
		if(type.equals("show1")){
			System.out.println("=============返回查询已审核活动信息页面=============");
			return "jsp/sonpage/activity/activityson/findDetailGoods";
		}
		if(type.equals("show2")){
			System.out.println("=============返回查询未审核活动信息页面=============");
			return "jsp/sonpage/activity/activityson/findDetailGoods1";
		}
		if(type.equals("show3")){
			System.out.println("=============返回删除活动信息页面=============");
			return "jsp/sonpage/activity/activityson/findDetailGoods2";
		}
		return "";
	}
	//8批量删除物品
	@RequestMapping("/delItem")
	public @ResponseBody boolean delItem(Model model, String ids) {
		System.out.println("==========批量删除物品==========");
		System.out.println("ids:"+ids);
		// 用数组接收获取的选中集合
		String[] str = ids.split("_");
		for (int i = 0; i < str.length; i++) {
			int id = Integer.parseInt(str[i]);
			goodsService.delGoods(id);
			System.out.println("删除的方法执行了");
		}
		//return "forward:findAllMember.action?type=show2";
		return true;
		
	}

}
