package com.ms.library.entity;



public class User {

	private String id;
	private String username;
	private String password;
	private String sex;
	private double balance;
	private String tel;	
	private int type;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public User(String id, String username, String password, String sex, double balance, String tel, int type) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.sex = sex;
		this.balance = balance;
		this.tel = tel;
		this.type = type;
	}
	public User() {
		super();
	}
	@Override
	public String toString() {
		if(type==1)
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", sex=" + sex + ", balance="
				+ balance + ", tel=" + tel + ", 管理员";
		else
			return "User [id=" + id + ", username=" + username + ", password=" + password + ", sex=" + sex + ", balance="
			+ balance + ", tel=" + tel + ", 普通用户";
	}

}
