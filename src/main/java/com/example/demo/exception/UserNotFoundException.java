package com.example.demo.exception;

public class UserNotFoundException extends ShopException {

	public UserNotFoundException(String message) {
		super(message);
	}
	
	public UserNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}
}
