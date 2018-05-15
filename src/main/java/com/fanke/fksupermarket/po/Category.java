package com.fanke.fksupermarket.po;

import java.io.Serializable;

/**
 * 商品类别
 * 
 * @author Fk
 *
 */
public class Category implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// C_id 商品类别编号 int
	private int c_id;

	// C_name 商品类别名称 Varchar(20)
	private String c_name;

	public Category() {
		super();
	}

	public Category(int c_id, String c_name) {
		super();
		this.c_id = c_id;
		this.c_name = c_name;
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	@Override
	public String toString() {
		return "Category [c_id=" + c_id + ", c_name=" + c_name + "]";
	}

}
