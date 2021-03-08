package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import com.example.demo.vo.User;
import com.example.demo.vo.UserCoupon;

@Transactional
public interface UserService {

	List<User> getAllUsers();
	User getUserById(String userId);
	boolean isExistUserId(String userId);
	User getLoginedUserInfo(String userId, String password);
	void addNewUser(User user);
	void updateUser(User user);
	int getUserNo();
	void addNewUserRole(int userNo);
	void insertUserCouponHistory(UserCoupon userCoupon);
	String getUserAbleStatusById(String userId);
}
