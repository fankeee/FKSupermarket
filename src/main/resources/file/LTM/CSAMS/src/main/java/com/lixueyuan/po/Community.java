package com.lixueyuan.po;

public class Community {
	private int C_id;//社团编号
	private int R_id;//社团负责人角色
	private String C_name;//社团名称
	private String C_people;//社团联系人姓名
	private String C_num;//社团联系人学号
	private String C_pwd;//社团联系人密码
	private String C_sex;//性别
	private String C_class;//社团联系人班级
	private String C_tel;//社团联系人电话
	private String C_qq;//社团联系人qq
	private String C_introduce;//社团联系人姓名
	public Community() {
		super();
	}
	public Community(int c_id,int r_id, String c_name, String c_people, String c_num,
			String c_pwd, String c_sex, String c_class, String c_tel,
			String c_qq, String c_introduce) {
		super();
		C_id = c_id;
		R_id=r_id;
		C_name = c_name;
		C_people = c_people;
		C_num = c_num;
		C_pwd = c_pwd;
		C_sex = c_sex;
		C_class = c_class;
		C_tel = c_tel;
		C_qq = c_qq;
		C_introduce = c_introduce;
	}
	public int getC_id() {
		return C_id;
	}
	public void setC_id(int c_id) {
		C_id = c_id;
	}
	public String getC_name() {
		return C_name;
	}
	public void setC_name(String c_name) {
		C_name = c_name;
	}
	public String getC_people() {
		return C_people;
	}
	public void setC_people(String c_people) {
		C_people = c_people;
	}
	public String getC_num() {
		return C_num;
	}
	public void setC_num(String c_num) {
		C_num = c_num;
	}
	public String getC_pwd() {
		return C_pwd;
	}
	public void setC_pwd(String c_pwd) {
		C_pwd = c_pwd;
	}
	public String getC_sex() {
		return C_sex;
	}
	public void setC_sex(String c_sex) {
		C_sex = c_sex;
	}
	public String getC_class() {
		return C_class;
	}
	public void setC_class(String c_class) {
		C_class = c_class;
	}
	public String getC_tel() {
		return C_tel;
	}
	public void setC_tel(String c_tel) {
		C_tel = c_tel;
	}
	public String getC_qq() {
		return C_qq;
	}
	public void setC_qq(String c_qq) {
		C_qq = c_qq;
	}
	public String getC_introduce() {
		return C_introduce;
	}
	public void setC_introduce(String c_introduce) {
		C_introduce = c_introduce;
	}
	public int getR_id() {
		return R_id;
	}
	public void setR_id(int r_id) {
		R_id = r_id;
	}
	
	
}
