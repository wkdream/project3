package com.pojo;

public class Bill {
	private String b_id;
	private String b_name;
	private int b_quantity;
	private String b_checkmoney;
	private String b_money;
	private String b_miao;
	private String b_time;
	private Provider provider;
	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getB_money() {
		return b_money;
	}

	public void setB_money(String b_money) {
		this.b_money = b_money;
	}

	public String getB_miao() {
		return b_miao;
	}

	public void setB_miao(String b_miao) {
		this.b_miao = b_miao;
	}
	
	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public int getB_quantity() {
		return b_quantity;
	}

	public void setB_quantity(int b_quantity) {
		this.b_quantity = b_quantity;
	}

	public String getB_checkmoney() {
		return b_checkmoney;
	}

	public void setB_checkmoney(String b_checkmoney) {
		this.b_checkmoney = b_checkmoney;
	}

	public String getB_time() {
		return b_time;
	}

	public void setB_time(String b_time) {
		this.b_time = b_time;
	}

	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}

}
