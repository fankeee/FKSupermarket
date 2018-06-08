package com.lixueyuan.po;

public class Goods {
	private int G_id;//物品编号
	private String G_name;//名称
	private String G_num;//物品数量
	private String AL_num;//物品详细单中的数量
	private int AC_id;//物品详细单中的活动编号
	public Goods() {
		super();
	}
	public Goods(int g_id, String g_name, String g_num) {
		super();
		G_id = g_id;
		G_name = g_name;
		G_num = g_num;
	}
	public int getG_id() {
		return G_id;
	}
	public void setG_id(int g_id) {
		G_id = g_id;
	}
	public String getG_name() {
		return G_name;
	}
	public void setG_name(String g_name) {
		G_name = g_name;
	}
	public String getG_num() {
		return G_num;
	}
	public void setG_num(String g_num) {
		G_num = g_num;
	}
	public String getAL_num() {
		return AL_num;
	}
	public void setAL_num(String al_num) {
		AL_num = al_num;
	}
	public int getAC_id() {
		return AC_id;
	}
	public void setAC_id(int aC_id) {
		AC_id = aC_id;
	}
	
}
