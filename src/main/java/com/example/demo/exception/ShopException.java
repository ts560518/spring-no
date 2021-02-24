package com.example.demo.exception;

public class ShopException extends RuntimeException {
	
	public ShopException() {}

	public ShopException(String message) {
		super(message);
	}
	
	public ShopException(String message, Throwable cause) {
		super(message, cause);
	}
}
