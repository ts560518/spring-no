package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.User;
import com.example.demo.vo.UserCoupon;

@Mapper
public interface UserDao {

	List<User> getAllUsers();
	User getUserById(String userId);
	User getUserByNo(int userNo);
	void updateUser(User user);
	void insertUser(User user);
	int getUserNo();
	void addNewUserRole(int userNo);
}
