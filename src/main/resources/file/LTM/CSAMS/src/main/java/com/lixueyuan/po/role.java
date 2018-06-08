package com.lixueyuan.po;

public class role {
	private int id;//角色编号
	private String name;//角色名称
	public role() {
		super();
	}
	public role(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
