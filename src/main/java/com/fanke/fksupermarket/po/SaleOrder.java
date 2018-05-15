package com.fanke.fksupermarket.po;

import java.io.Serializable;
import java.util.Date;

/**
 * 商品销售单
 * 
 * @author Fk
 *
 */
public class SaleOrder implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// S_id 销售单编号 int
	private int s_id;

	// S_totalAmount 总金额 float
	private float s_totalAmount;

	// S_saleDate 销售时间 date
	private String s_saleDate;

	// U_id 收银员编号 int
	private int u_id;

	/**
	 * 无参构造方法
	 */
	public SaleOrder() {
		super();
	}

	/**
	 * 有参构造方法
	 * 
	 * @param s_id
	 * @param s_totalAmount
	 * @param s_saleDate
	 * @param u_id
	 */
	public SaleOrder(int s_id, float s_totalAmount, String s_saleDate, int u_id) {
		super();
		this.s_id = s_id;
		this.s_totalAmount = s_totalAmount;
		this.s_saleDate = s_saleDate;
		this.u_id = u_id;
	}

	public int getS_id() {
		return s_id;
	}

	public void setS_id(int s_id) {
		this.s_id = s_id;
	}

	public float getS_totalAmount() {
		return s_totalAmount;
	}

	public void setS_totalAmount(float s_totalAmount) {
		this.s_totalAmount = s_totalAmount;
	}

	public String getS_saleDate() {
		return s_saleDate;
	}

	public void setS_saleDate(String s_saleDate) {
		this.s_saleDate = s_saleDate;
	}

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

	@Override
	public String toString() {
		return "SaleOrder [s_id=" + s_id + ", s_totalAmount=" + s_totalAmount + ", s_saleDate=" + s_saleDate + ", u_id="
				+ u_id + "]";
	}

}
