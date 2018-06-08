package com.lixueyuan.po;

public class Manager {
	private int MA_id;//系统管理员编号
	private int R_id;//角色编号
	private int C_id;//角色编号
	private String MA_num;//系统管理员学号
	private String MA_pwd;//系统管理员密码
	private String MA_name;//系统管理员名字
	private String MA_sex;//系统管理员性别
	private String MA_class;//系统管理员班级
	private Community community;//系统管理员班级
	private String MA_position;//系统管理员职位
	private String MA_tel;//系统管理员电话
	public Manager() {
		super();
	}
	public Manager(int mA_id, int r_id, int c_id, String mA_num, String mA_pwd,
			String mA_name, String mA_sex, String mA_class,Community community, String mA_position,
			String mA_tel) {
		super();
		MA_id = mA_id;
		R_id = r_id;
		C_id = c_id;
		MA_num = mA_num;
		MA_pwd = mA_pwd;
		MA_name = mA_name;
		MA_sex = mA_sex;
		MA_class = mA_class;
		community=community;
		MA_position = mA_position;
		MA_tel = mA_tel;
	}
	public int getMA_id() {
		return MA_id;
	}
	public void setMA_id(int mA_id) {
		MA_id = mA_id;
	}
	public int getR_id() {
		return R_id;
	}
	public void setR_id(int r_id) {
		R_id = r_id;
	}
	public int getC_id() {
		return C_id;
	}
	public void setC_id(int c_id) {
		C_id = c_id;
	}
	public String getMA_num() {
		return MA_num;
	}
	public void setMA_num(String mA_num) {
		MA_num = mA_num;
	}
	public String getMA_pwd() {
		return MA_pwd;
	}
	public void setMA_pwd(String mA_pwd) {
		MA_pwd = mA_pwd;
	}
	public String getMA_name() {
		return MA_name;
	}
	public void setMA_name(String mA_name) {
		MA_name = mA_name;
	}
	public String getMA_sex() {
		return MA_sex;
	}
	public void setMA_sex(String mA_sex) {
		MA_sex = mA_sex;
	}
	public String getMA_class() {
		return MA_class;
	}
	public void setMA_class(String mA_class) {
		MA_class = mA_class;
	}
	public String getMA_position() {
		return MA_position;
	}
	public void setMA_position(String mA_position) {
		MA_position = mA_position;
	}
	public String getMA_tel() {
		return MA_tel;
	}
	public void setMA_tel(String mA_tel) {
		MA_tel = mA_tel;
	}
	public Community getCommunity() {
		return community;
	}
	public void setCommunity(Community community) {
		this.community = community;
	}

}
