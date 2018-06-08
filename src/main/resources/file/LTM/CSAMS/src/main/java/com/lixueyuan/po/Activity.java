package com.lixueyuan.po;

public class Activity {
	private int AC_id;//活动信息编号
	private String AC_theme;//活动主题
	private String AC_organize;//主办单位
	private String AC_undertaker;//承办单位
	private String AC_people;//申请人
	private String AC_tel;//申请人
	private String AC_time;//活动时间
	private String AC_location;//活动地点
	private double AC_money;//活动经费
	private String AC_remark;//审批意见̬
	
	public Activity() {
		super();
	}

	public Activity(int ac_id, String ac_theme, String ac_organize,
			String ac_undertaker, String ac_people, String ac_tel,String ac_time,
			String ac_location,double ac_money,String ac_remark) {
		super();
		AC_id = ac_id;
		AC_theme = ac_theme;
		AC_organize = ac_organize;
		AC_undertaker = ac_undertaker;
		AC_people = ac_people;
		AC_tel=ac_tel;
		AC_time = ac_time;
		AC_location=ac_location;
		AC_money = ac_money;
		AC_remark=ac_remark;
	}

	public int getAC_id() {
		return AC_id;
	}

	public void setAC_id(int ac_id) {
		AC_id = ac_id;
	}

	public String getAC_theme() {
		return AC_theme;
	}

	public void setAC_theme(String ac_theme) {
		AC_theme = ac_theme;
	}

	public String getAC_organize() {
		return AC_organize;
	}

	public void setAC_organize(String ac_organize) {
		AC_organize = ac_organize;
	}

	public String getAC_undertaker() {
		return AC_undertaker;
	}

	public void setAC_undertaker(String ac_undertaker) {
		AC_undertaker = ac_undertaker;
	}

	public String getAC_people() {
		return AC_people;
	}

	public void setAC_people(String ac_people) {
		AC_people = ac_people;
	}

	public String getAC_time() {
		return AC_time;
	}

	public void setAC_time(String ac_time) {
		AC_time = ac_time;
	}

	public double getAC_money() {
		return AC_money;
	}

	public void setAC_money(double ac_money) {
		AC_money = ac_money;
	}

	public String getAC_remark() {
		return AC_remark;
	}

	public void setAC_remark(String ac_remark) {
		AC_remark = ac_remark;
	}

	public String getAC_location() {
		return AC_location;
	}

	public void setAC_location(String aC_location) {
		AC_location = aC_location;
	}

	public String getAC_tel() {
		return AC_tel;
	}

	public void setAC_tel(String aC_tel) {
		AC_tel = aC_tel;
	}
	
}
