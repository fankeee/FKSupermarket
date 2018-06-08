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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;













import com.lixueyuan.po.Manager;
import com.lixueyuan.po.Member;
import com.lixueyuan.service.MemberService;
import com.lixueyuan.util.PagedResult;

@Controller
@RequestMapping(value="/Member")
public class MemberCotroller {
	@Autowired
	private MemberService memberService;
	//1根据id查询会员信息
	@RequestMapping("/findMemberById")
	public @ResponseBody Member findMemberById(Model model,String m_id){
		System.out.println("===============findMemberById=================");
		System.out.println("m_id:"+m_id);
		int id=Integer.parseInt(m_id);
		Member member=memberService.findMemberById(id);
		System.out.println("member:"+member.getM_name());
		//model.addAttribute("member", member);
		return member;
	}
	//2查询所有会员信息
	@RequestMapping("/findAllMember")
	public String findAllMember(Model model,String type,Integer pageNo,Integer pageSize){
		System.out.println("===========findAllMember==============");
		System.out.println("传到type的值："+type);
		PagedResult<Member> pagedResult= memberService.findAllMember(pageNo, pageSize);
		model.addAttribute("pagedResult", pagedResult);
		List<Member> memberList=pagedResult.getDataList();
		System.out.println("当前页码："+pageNo);
		System.out.println("条数："+pageSize);
		System.out.println("总页面数目："+pagedResult.getPages());
		model.addAttribute("memberList", memberList);
		if(type.equals("show1")){
			return "jsp/sonpage/member/memberson/findMember";
		}
		if(type.equals("show2")){
			return "jsp/sonpage/member/memberson/delMember";
		}
		return "";
	}
	//3根据名字模糊查询
	@RequestMapping(value ="/findLikeNameMember")
	public String findLikeNameMember(String m_id, String m_name, Model model,String type){
		System.out.println("===========模糊查询会员信息============");
		System.out.println("m_id:"+m_id);
		System.out.println("m_name:"+m_name);
		System.out.println("type:"+type);
		//String m_id=id;
		//String m_name=name;
		Map map = new HashMap();
		map.put("m_id", m_id);
		map.put("m_name", m_name);
		List<Member> memberList=memberService.findLikeNameMember(map);
		model.addAttribute("memberList", memberList);
		if (type.equals("show1")) {
			System.out.println("===========从查询会员信息页面===========");
			if(("").equals(m_id) && ("").equals(m_name)){
				System.out.println("1没有传值");
				return "forward:findAllMember.action?type";
			}
			System.out.println("===================跳回查询页面======================");
			return "jsp/sonpage/member/memberson/findMember";
		}
		if (type.equals("show2")) {
			System.out.println("===========从删除会员信息品页面===========");
			if(("").equals(m_id) && ("").equals(m_name)){
				System.out.println("2没有传值");
				return "forward:findAllMember.action?type";
			}
			System.out.println("===================跳回删除页面======================");
			return "jsp/sonpage/member/memberson/delMember";
		}
		return "";
	}
	//4添加会员
	@RequestMapping("/addMember")
	public String addMember(Member member,String type){
		System.out.println("===============addMember=================");
		memberService.addMember(member);
		if(type.equals("show3")){
			return "forward:/Community/findAllCommunity.action?type";
		}else if(type.equals("show")){
			return "jsp/sonpage/member/memberson/addMember";
		}else if(type.equals("show1")){
			return "jsp/sonpage/regist";
		}
		return "";
	}
	//4添加会员
	@RequestMapping("/addMember1")
	public @ResponseBody boolean addMember1(String m_num,String m_pwd,String m_name,String m_sex,String m_class){
		System.out.println("===============addMember=================");
		Member member=new Member();
		member.setM_num(m_num);
		member.setM_pwd(m_pwd);
		member.setM_name(m_name);
		member.setM_sex(m_sex);
		member.setM_class(m_class);
		
		memberService.addMember(member);
		return true;
	}
	//5根据id删除会员
	@RequestMapping("/delMember")
	public String delMember(String m_id,String type){
		System.out.println("=============delMember==================");
		System.out.println("m_id:"+m_id);
		System.out.println("type:"+type);
		int id=Integer.parseInt(m_id);
		memberService.delMember(id);
		return "redirect:findAllMember.action?type=show2";
	}
	//6修改会员信息
	@RequestMapping("/updateMember")
	public String updateMember(Member member){
		System.out.println("==========修改会员信息==========");
		memberService.updateMember(member);
		return "redirect:findAllMember.action?type=show1";
	}
	//7批量删除
	@RequestMapping("/delItem")
	public @ResponseBody boolean delItem(Model model, String ids) {
		System.out.println("==========批量删除会员==========");
		System.out.println("ids:"+ids);
		// 用数组接收获取的选中集合
		String[] str = ids.split("_");
		for (int i = 0; i < str.length; i++) {
			int id = Integer.parseInt(str[i]);
			memberService.delMember(id);
			System.out.println("删除的方法执行了");
		}
		//return "forward:findAllMember.action?type=show2";
		return true;
		
	}
	//8登陆（根据学号查找）
	@RequestMapping("/findMemberByNum")
	public @ResponseBody boolean findMemberByNum(HttpSession session,String num,String pwd){
		System.out.println("===============findMemberByNum=================");
		System.out.println("num:"+num);
		
		Subject subject = SecurityUtils.getSubject();
		subject.getSession().setAttribute("userType", "Member");
		// 保存至令牌环中，供MyRealm做验证
		UsernamePasswordToken token = new UsernamePasswordToken(num, pwd);
		// 保存用户类型供MyRealm获取
		
		try {
			// 跳转到MyRealm 做登录用户名和密码验证
			subject.login(token);
			session.setAttribute("num", num);
			session.setAttribute("role", "3");
			System.out.println("MemberCotroller-->>findMemberByNum-->>登录成功");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("MemberCotroller-->>findMemberByNum-->>登录失败");
			return false;
		}
		
//		Member member=memberService.findMemberByNum(num);
//		System.out.println("manager:"+member.getM_pwd());
//		String m_pwd=member.getM_pwd();
//		session.setAttribute("num", num);
//		session.setAttribute("role", "3");
//		if(m_pwd.equals(pwd)){
//			System.out.println("返回值是真");
//			return true;
//		}else{
//			return false;
//		}
	}
	//9修改密码
	@RequestMapping("/updateMemberPwd")
	public @ResponseBody boolean updateMemberPwd(Model model,String num,String oldPwd,String newPwd){
		System.out.println("===============updateManagerPwd=================");
		System.out.println("旧密码："+oldPwd);
		System.out.println("新密码："+newPwd);
		String M_pwd=newPwd;
		String M_num=num;
		Member manager=memberService.findMemberByNum(num);
		String pwd=manager.getM_pwd();
		if(pwd.equals(oldPwd)){
			memberService.updateMemberPwd(M_pwd,M_num);
			return true;
		}else{
			return false;
		}
	}
}
