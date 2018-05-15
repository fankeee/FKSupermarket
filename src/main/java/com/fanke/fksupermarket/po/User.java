package com.fanke.fksupermarket.po;

import java.io.Serializable;

/**
 * User
 * 
 * @author Fk
 *
 */
public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// U_id 用户编号 int
	private int u_id;

	// U_pwd 用户密码 varchar(30)
	private String u_pwd;

	// U_name 用户姓名 varchar(30)
	private String u_name;

	// U_age 用户年龄 int
	private int u_age;

	// U_sex 用户性别 Char(2)
	private String u_sex;

	// U_tel 用户电话 varchar(11)
	private String u_tel;

	// 角色ID
	private int r_id;

	public User() {
		super();
	}

	/**
	 * @param u_id
	 * @param u_pwd
	 * @param u_name
	 * @param u_age
	 * @param u_sex
	 * @param u_tel
	 * @param r_id
	 */
	public User(int u_id, String u_pwd, String u_name, int u_age, String u_sex, String u_tel, int r_id) {
		super();
		this.u_id = u_id;
		this.u_pwd = u_pwd;
		this.u_name = u_name;
		this.u_age = u_age;
		this.u_sex = u_sex;
		this.u_tel = u_tel;
		this.r_id = r_id;
	}

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

	public String getU_pwd() {
		return u_pwd;
	}

	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public int getU_age() {
		return u_age;
	}

	public void setU_age(int u_age) {
		this.u_age = u_age;
	}

	public String getU_sex() {
		return u_sex;
	}

	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
	}

	public String getU_tel() {
		return u_tel;
	}

	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}

	public int getR_id() {
		return r_id;
	}

	public void setR_id(int r_id) {
		this.r_id = r_id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "User [u_id=" + u_id + ", u_pwd=" + u_pwd + ", u_name=" + u_name + ", u_age=" + u_age + ", u_sex="
				+ u_sex + ", u_tel=" + u_tel + ", r_id=" + r_id + "]";
	}

}
