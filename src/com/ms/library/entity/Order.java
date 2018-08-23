package com.ms.library.entity;

import java.util.Date;

public class Order {

	private String id;
	private String book_id;
	private String user_id;
	private Date borrowdate;
	private Date expiredate;
	private Double price;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getBorrowdate() {
		return borrowdate;
	}
	public void setBorrowdate(Date borrowdate) {
		this.borrowdate = borrowdate;
	}
	public Date getExpiredate() {
		return expiredate;
	}
	public void setExpiredate(Date expiredate) {
		this.expiredate = expiredate;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Order(String id, String book_id, String user_id, Date borrowdate, Date expiredate, Double price) {
		super();
		this.id = id;
		this.book_id = book_id;
		this.user_id = user_id;
		this.borrowdate = borrowdate;
		this.expiredate = expiredate;
		this.price = price;
	}
	public Order() {
		super();
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", book_id=" + book_id + ", user_id=" + user_id + ", borrowdate=" + borrowdate
				+ ", expiredate=" + expiredate + ", price=" + price + "]";
	}
	
}
