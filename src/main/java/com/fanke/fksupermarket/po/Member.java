package com.fanke.fksupermarket.po;

import java.io.Serializable;
import java.util.Date;

/**
 * 会员
 * 
 * @author Fk
 *
 */
public class Member implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// M_id 会员编号 int
	private int m_id;

	// M_name 会员姓名 Varchar(10)
	private String m_name;

	// M_integral 会员积分 int
	private int m_integral;

	// M_date 开户时间 date
	private Date m_date;

	// M_phone 联系方式 Varchar(15)
	private String m_phone;

	public Member() {
		super();
	}

	public Member(int m_id, String m_name, int m_integral, Date m_date, String m_phone) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_integral = m_integral;
		this.m_date = m_date;
		this.m_phone = m_phone;
	}

	public int getM_id() {
		return m_id;
	}

	public void setM_id(int m_id) {
		this.m_id = m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public int getM_integral() {
		return m_integral;
	}

	public void setM_integral(int m_integral) {
		this.m_integral = m_integral;
	}

	public Date getM_date() {
		return m_date;
	}

	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	@Override
	public String toString() {
		return "Member [m_id=" + m_id + ", m_name=" + m_name + ", m_integral=" + m_integral + ", m_date=" + m_date
				+ ", m_phone=" + m_phone + "]";
	}

}
