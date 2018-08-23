package com.ms.library.entity;

public class Book {
	private String id;
	private String bookname;
	private String author;
	private String category_id;
	private double bookprice;
	private double borrowprice;
	private long borrowcount;
	private long restcount;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public double getBookprice() {
		return bookprice;
	}
	public void setBookprice(double bookprice) {
		this.bookprice = bookprice;
	}
	public double getBorrowprice() {
		return borrowprice;
	}
	public void setBorrowprice(double borrowprice) {
		this.borrowprice = borrowprice;
	}
	public long getBorrowcount() {
		return borrowcount;
	}
	public void setBorrowcount(int borrowcount) {
		this.borrowcount = borrowcount;
	}
	@Override
	public String toString() {
		return "Book [id=" + id + ", bookname=" + bookname + ", author=" + author + ", category_id=" + category_id
				+ ", bookprice=" + bookprice + ", borrowprice=" + borrowprice + ", borrowcount=" + borrowcount
				+ ", restcount=" + restcount + "]";
	}
	public long getRestcount() {
		return restcount;
	}
	public void setRestcount(int restcount) {
		this.restcount = restcount;
	}
	public Book(String id, String bookname, String author, String category_id, double bookprice, double borrowprice,
			int borrowcount, int restcount) {
		super();
		this.id = id;
		this.bookname = bookname;
		this.author = author;
		this.category_id = category_id;
		this.bookprice = bookprice;
		this.borrowprice = borrowprice;
		this.borrowcount = borrowcount;
		this.restcount = restcount;
	}
	public Book() {
		super();
	}
	
}
