package com.fanke.fksupermarket.mapper;

import java.util.List;

import com.fanke.fksupermarket.po.Member;

public interface MemberMapper {

	/**
	 * 根据手机号查询会员
	 * 
	 * @param m_phone
	 * @return
	 */
	public Member getMemberByphone(String m_phone);

	/**
	 * 添加会员
	 * 
	 * @param member
	 */
	public void addMember(Member member);

	/**
	 * 查询所有会员
	 * 
	 * @return
	 */
	public List<Member> findAllMember();

	/**
	 * 多条件查询
	 * 
	 * @param member
	 * @return
	 */
	public List<Member> conditionalQuery(Member member);

	/**
	 * 根据ID删除
	 * 
	 * @param m_id
	 */
	public void delMemberById(Integer m_id);

	/**
	 * 根据ID查询
	 * 
	 * @param m_id
	 * @return
	 */
	public Member findMemberById(Integer m_id);

	/**
	 * 根据ID修改
	 * 
	 * @param member
	 * @return
	 */
	public void updateMember(Member member);

}
