package com.lixueyuan.mapper;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.lixueyuan.po.Manager;
import com.lixueyuan.po.Member;

public interface MemberMapper {
	//1根据id查询会员信息
	public Member findMemberById(int id);
	//2查询所有会员信息
	public List<Member> findAllMember();
	//3根据名字模糊查询
	public List<Member> findLikeNameMember(Map map);
	//4添加会员
	public void addMember(Member member);
	//5根据id删除会员
	public void delMember(int id);
	//6修改会员信息
	public void updateMember(Member member);
	//7修改密码
	public void updateMemberPwd(String MA_pwd,String MA_num);
	//8根据学号查找
	public Member findMemberByNum(String num);
	//9获取权限名称
	public Set<String> getRoles(String M_num); 
}
