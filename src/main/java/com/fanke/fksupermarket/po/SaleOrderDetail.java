package com.fanke.fksupermarket.po;

import java.io.Serializable;

/**
 * 商品销售单明细
 * 
 * @author Fk
 *
 */
public class SaleOrderDetail implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// Sod_id 销售单明细编号 int
	private int sod_id;

	// G_id 商品编号 int
	private int g_id;

	// Sod_number 销售数量 int
	private int sod_number;

	// S_id 销售单编号 int
	private int s_id;

	public SaleOrderDetail() {
		super();
	}

	public SaleOrderDetail(int sod_id, int g_id, int sod_number, int s_id) {
		super();
		this.sod_id = sod_id;
		this.g_id = g_id;
		this.sod_number = sod_number;
		this.s_id = s_id;
	}

	public int getSod_id() {
		return sod_id;
	}

	public void setSod_id(int sod_id) {
		this.sod_id = sod_id;
	}

	public int getG_id() {
		return g_id;
	}

	public void setG_id(int g_id) {
		this.g_id = g_id;
	}

	public int getSod_number() {
		return sod_number;
	}

	public void setSod_number(int sod_number) {
		this.sod_number = sod_number;
	}

	public int getS_id() {
		return s_id;
	}

	public void setS_id(int s_id) {
		this.s_id = s_id;
	}

	@Override
	public String toString() {
		return "SaleOrderDetail [sod_id=" + sod_id + ", g_id=" + g_id + ", sod_number=" + sod_number + ", s_id=" + s_id
				+ "]";
	}

}
