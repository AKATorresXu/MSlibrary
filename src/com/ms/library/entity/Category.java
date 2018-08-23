package com.ms.library.entity;

public class Category {
	private String id;
	private String category;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Category(String id, String category) {
		super();
		this.id = id;
		this.category = category;
	}
	public Category() {
		super();
	}
	
}
