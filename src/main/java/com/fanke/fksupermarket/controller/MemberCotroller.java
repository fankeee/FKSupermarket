package com.fanke.fksupermarket.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fanke.fksupermarket.po.Member;
import com.fanke.fksupermarket.service.IMemberService;
import com.fanke.fksupermarket.util.PagedResult;

@Controller
@RequestMapping("MemberCotroller")
public class MemberCotroller {

	@Autowired
	IMemberService memberService;

	/**
	 * 根据手机号查询会员
	 * 
	 * @param m_phone
	 * @return
	 */
	@RequestMapping("getMemberByphone")
	@ResponseBody
	public Member getMemberByphone(String m_phone) {

		return memberService.getMemberByphone(m_phone);
	}

	/**
	 * 添加会员
	 */
	@RequestMapping("addMember")
	public String addMember(String m_name,Integer m_integral,String m_date,String m_phone) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = sdf.parse(m_date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Member member = new Member();
		member.setM_name(m_name);
		member.setM_integral(m_integral);
		member.setM_date(date);
		member.setM_phone(m_phone);
		memberService.addMember(member);

		return "redirect:findAllMember.action";
	}

	/**
	 * 查询所有会员
	 * 
	 * @param model
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/findAllMember")
	public String findAllMember(Model model, Integer pageNo, @RequestParam(defaultValue = "10") Integer pageSize) {

		PagedResult<Member> pagedResult = memberService.findAllMember(pageNo, pageSize);
		model.addAttribute("pagedResult", pagedResult);
		List<Member> memberList = pagedResult.getDataList();
		model.addAttribute("memberList", memberList);
		return "subPage/sale/saleson/sale_son2";
	}

	/**
	 * 多条件查询
	 */
	@RequestMapping("conditionalQuery")
	@ResponseBody
	public boolean conditionalQuery(HttpServletRequest request, Member member) {
		List<Member> memberList = memberService.conditionalQuery(member);
		request.getSession().setAttribute("memberList", memberList);
		return true;
	}

	/**
	 * 根据ID删除
	 * 
	 * @param m_id
	 */
	@RequestMapping("delMemberById")
	public String delMemberById(Integer m_id) {

		memberService.delMemberById(m_id);
		return "redirect:findAllMember.action";
	}

	/**
	 * 根据ID查询
	 * 
	 * @param m_id
	 * @return
	 */
	@RequestMapping("findMemberById")
	@ResponseBody
	public Member findMemberById(Integer m_id) {

		return memberService.findMemberById(m_id);
	}

	/**
	 * 根据ID修改
	 * 
	 * @param member
	 * @return
	 */
	@RequestMapping("updateMember")
	public String updateMember(Integer m_id2,String m_name,Integer m_integral,String m_date,String m_phone) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = sdf.parse(m_date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Member member = new Member(m_id2, m_name, m_integral, date, m_phone);
		memberService.updateMember(member);
		return "redirect:findAllMember.action";
	}
}
