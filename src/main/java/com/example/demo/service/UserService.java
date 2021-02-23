package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import com.example.demo.vo.User;

@Transactional
public interface UserService {

	List<User> getAllUsers();
}
