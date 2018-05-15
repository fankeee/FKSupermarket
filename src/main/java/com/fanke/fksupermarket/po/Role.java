package com.fanke.fksupermarket.po;

import java.io.Serializable;

/**
 * 角色表
 * 
 * @author Fk
 *
 */
public class Role implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// R_id 角色编号 int
	private int r_id;

	// R_name 用户职称 varchar(50)
	private String r_name;

	// Pri_id 权限编号 int
	private int pri_id;

	public Role() {
		super();
	}

	public Role(int r_id, String r_name, int pri_id) {
		super();
		this.r_id = r_id;
		this.r_name = r_name;
		this.pri_id = pri_id;
	}

	public int getR_id() {
		return r_id;
	}

	public void setR_id(int r_id) {
		this.r_id = r_id;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public int getPri_id() {
		return pri_id;
	}

	public void setPri_id(int pri_id) {
		this.pri_id = pri_id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Role [r_id=" + r_id + ", r_name=" + r_name + ", pri_id=" + pri_id + "]";
	}

}
