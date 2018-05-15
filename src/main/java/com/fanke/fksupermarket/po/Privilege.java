package com.fanke.fksupermarket.po;

import java.io.Serializable;

/**
 * 权限表
 * 
 * @author Fk
 *
 */
public class Privilege implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// Pri_id 权限编号 int
	private int pri_id;

	// Pri_name 权限名称 varchar(50)
	private String pri_name;

	/**
	 * 
	 */
	public Privilege() {
		super();
	}

	/**
	 * @param pri_id
	 * @param pri_name
	 */
	public Privilege(int pri_id, String pri_name) {
		super();
		this.pri_id = pri_id;
		this.pri_name = pri_name;
	}

	public int getPri_id() {
		return pri_id;
	}

	public void setPri_id(int pri_id) {
		this.pri_id = pri_id;
	}

	public String getPri_name() {
		return pri_name;
	}

	public void setPri_name(String pri_name) {
		this.pri_name = pri_name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Privilege [pri_id=" + pri_id + ", pri_name=" + pri_name + "]";
	}

}
