package com.fanke.fksupermarket.po;

/**
 * 数据图形化
 * 
 * @author Fk
 *
 */
public class Monthly {
	private int month;
	private double total;

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public Monthly() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Monthly(int month, double total) {
		super();
		this.month = month;
		this.total = total;
	}
}
