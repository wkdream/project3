package com.pojo;

public class Provider {
	private String p_id;
	private String p_describe;
	public String getP_describe() {
		return p_describe;
	}
	public void setP_describe(String p_describe) {
		this.p_describe = p_describe;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_touch() {
		return p_touch;
	}
	public void setP_touch(String p_touch) {
		this.p_touch = p_touch;
	}
	public String getP_phone() {
		return p_phone;
	}
	public void setP_phone(String p_phone) {
		this.p_phone = p_phone;
	}
	public String getP_address() {
		return p_address;
	}
	public void setP_address(String p_address) {
		this.p_address = p_address;
	}
	private String p_name;
	private String p_touch;
	private String p_phone;
	private String p_address;
	@Override
	public String toString() {
		return "Provider [p_id=" + p_id + ", p_describe=" + p_describe + ", p_name=" + p_name + ", p_touch=" + p_touch
				+ ", p_phone=" + p_phone + ", p_address=" + p_address + "]";
	}
	

}
