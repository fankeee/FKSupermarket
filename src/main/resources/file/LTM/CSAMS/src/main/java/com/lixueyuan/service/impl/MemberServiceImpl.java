package com.lixueyuan.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.lixueyuan.mapper.MemberMapper;
import com.lixueyuan.po.Member;
import com.lixueyuan.service.MemberService;
import com.lixueyuan.util.BeanUtil;
import com.lixueyuan.util.PagedResult;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;

	// 1根据id查询会员信息
	@Override
	public Member findMemberById(int id) {
		System.out.println("==============MemberService===============");
		Member member=memberMapper.findMemberById(id);
		System.out.println(member.getM_name());
		return member;
	}

	// 2查询所有会员信息
	@Override
	public PagedResult<Member> findAllMember(Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null ? 1 : pageNo;// 当前页
		pageSize = pageSize == null ? 5 : pageSize;// 条数
		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个
		PageHelper.startPage(pageNo, pageSize);
		PagedResult<Member> member = BeanUtil.toPagedResult(memberMapper.findAllMember());
		int Pages = (int) member.getPages();
		pageNo = pageNo < 1 ? 1 : pageNo;
		pageNo = pageNo > Pages ? Pages : pageNo;
		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个
		PageHelper.startPage(pageNo, pageSize);
		System.out.println("service："+pageNo);
		System.out.println("service："+pageSize);
		return BeanUtil.toPagedResult(memberMapper.findAllMember());
	}

	// 3根据名字模糊查询
	@Override
	public List<Member> findLikeNameMember(Map map) {
		
		return memberMapper.findLikeNameMember(map);
	}

	// 4添加会员
	@Override
	public void addMember(Member member) {
		memberMapper.addMember(member);
	}

	// 5根据id删除会员
	@Override
	public void delMember(int id) {
		memberMapper.delMember(id);

	}

	// 6修改会员信息
	@Override
	public void updateMember(Member member) {
		memberMapper.updateMember(member);
	}

	@Override
	public void updateMemberPwd(String MA_pwd, String MA_num) {
		memberMapper.updateMemberPwd(MA_pwd, MA_num);
		
	}

	@Override
	public Member findMemberByNum(String num) {
		return memberMapper.findMemberByNum(num);
	}

	@Override
	public Set<String> getRoles(String m_num) {
		// TODO Auto-generated method stub
		return memberMapper.getRoles(m_num);
	}
}


