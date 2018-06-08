package com.lixueyuan.po;

public class ActgGoods {
	private int g_id;
	private int ac_id;
	private int al_num;

	/**
	 * 
	 */
	public ActgGoods() {
		super();
	}

	/**
	 * @param g_id
	 * @param ac_id
	 * @param al_num
	 */
	public ActgGoods(int g_id, int ac_id, int al_num) {
		super();
		this.g_id = g_id;
		this.ac_id = ac_id;
		this.al_num = al_num;
	}

	public int getG_id() {
		return g_id;
	}

	public void setG_id(int g_id) {
		this.g_id = g_id;
	}

	public int getAc_id() {
		return ac_id;
	}

	public void setAc_id(int ac_id) {
		this.ac_id = ac_id;
	}

	public int getAl_num() {
		return al_num;
	}

	public void setAl_num(int al_num) {
		this.al_num = al_num;
	}

	@Override
	public String toString() {
		return "ActgGoods [g_id=" + g_id + ", ac_id=" + ac_id + ", al_num=" + al_num + "]";
	}

}
