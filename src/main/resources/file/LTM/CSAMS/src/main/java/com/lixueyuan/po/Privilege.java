package com.lixueyuan.po;

public class Privilege {
	private int id;//权限编号
	private String name;//权限名称
	public Privilege() {
		super();
	}
	public Privilege(int id, String name) {
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
