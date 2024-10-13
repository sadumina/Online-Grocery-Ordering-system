package com.cart;

public class Cart {
	private int id;
	private String name;
	private double price;
	private int quantity;
	
	public Cart(String name, double price, int quantity) {
		super();
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}
	
	public double getTotalPrice() {
		return this.price * this.quantity;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public double getPrice() {
		return price;
	}

	public int getQuantity() {
		return quantity;
	}

}
