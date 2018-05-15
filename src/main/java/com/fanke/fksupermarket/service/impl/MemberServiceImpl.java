package com.fanke.fksupermarket.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fanke.fksupermarket.mapper.MemberMapper;
import com.fanke.fksupermarket.po.Member;
import com.fanke.fksupermarket.service.IMemberService;
import com.fanke.fksupermarket.util.BeanUtil;
import com.fanke.fksupermarket.util.PagedResult;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service
public class MemberServiceImpl implements IMemberService {

	@Autowired
	MemberMapper memberMapper;

	@Override
	public Member getMemberByphone(String m_phone) {
		// TODO Auto-generated method stub
		return memberMapper.getMemberByphone(m_phone);
	}

	@Override
	public void addMember(Member member) {
		// TODO Auto-generated method stub
		memberMapper.addMember(member);
	}

	@Override
	public PagedResult<Member> findAllMember(Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;

		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
		Page pg = PageHelper.startPage(pageNo, pageSize);

		PagedResult<Member> result = BeanUtil.toPagedResult(memberMapper.findAllMember());
		int p = (int) result.getPages();

		// 当前页码不能小于1，且不能大于总页数
		if (pageNo <= 1) {
			pageNo = 1;
		}
		if (pageNo > p) {
			pageNo = p;
		}

		// startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
		Page page = PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.toPagedResult(memberMapper.findAllMember());
	}

	@Override
	public List<Member> conditionalQuery(Member member) {
		// TODO Auto-generated method stub
		return memberMapper.conditionalQuery(member);
	}

	@Override
	public void delMemberById(Integer m_id) {
		// TODO Auto-generated method stub
		memberMapper.delMemberById(m_id);
	}

	@Override
	public Member findMemberById(Integer m_id) {
		// TODO Auto-generated method stub
		return memberMapper.findMemberById(m_id);
	}

	@Override
	public void updateMember(Member member) {
		// TODO Auto-generated method stub
		memberMapper.updateMember(member);
	}

}
