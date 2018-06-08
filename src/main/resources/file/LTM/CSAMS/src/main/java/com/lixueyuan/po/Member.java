package com.lixueyuan.po;

public class Member {
	private int M_id;//会员编号
	private int C_id;//会员所属社团编号
	private int R_id;//会员角色编号
	private String M_num;//会员学号
	private String M_pwd;//登陆密码
	private String M_name;//会员姓名
	private String M_sex;//会员性别
	private String M_class;//会员班级
	private Community community;
	private String M_tel;//会员电话
	private String M_qq;//会员qq
	public Member() {
		super();
	}
	public Member(int m_id, int c_id, int r_id,String m_num,String m_pwd, String m_name, String m_sex,
			String m_class,Community community, String m_tel, String m_qq) {
		super();
		M_id = m_id;
		C_id = c_id;
		R_id = r_id;
		M_num=m_num;
		M_pwd=m_pwd;
		M_name = m_name;
		M_sex = m_sex;
		community=community;
		M_class = m_class;
		M_tel = m_tel;
		M_qq = m_qq;
	}
	public int getM_id() {
		return M_id;
	}
	public void setM_id(int m_id) {
		M_id = m_id;
	}
	public int getC_id() {
		return C_id;
	}
	public void setC_id(int c_id) {
		C_id = c_id;
	}
	public int getR_id() {
		return R_id;
	}
	public void setR_id(int r_id) {
		R_id = r_id;
	}
	public String getM_name() {
		return M_name;
	}
	public void setM_name(String m_name) {
		M_name = m_name;
	}
	public String getM_sex() {
		return M_sex;
	}
	public void setM_sex(String m_sex) {
		M_sex = m_sex;
	}
	public String getM_class() {
		return M_class;
	}
	public void setM_class(String m_class) {
		M_class = m_class;
	}
	public String getM_tel() {
		return M_tel;
	}
	public void setM_tel(String m_tel) {
		M_tel = m_tel;
	}
	public String getM_qq() {
		return M_qq;
	}
	public void setM_qq(String m_qq) {
		M_qq = m_qq;
	}
	public Community getCommunity() {
		return community;
	}
	public void setCommunity(Community community) {
		this.community = community;
	}
	public String getM_num() {
		return M_num;
	}
	public void setM_num(String m_num) {
		M_num = m_num;
	}
	public String getM_pwd() {
		return M_pwd;
	}
	public void setM_pwd(String m_pwd) {
		M_pwd = m_pwd;
	}
}
