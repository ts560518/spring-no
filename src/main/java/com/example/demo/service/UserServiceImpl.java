package com.example.demo.service;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.UserDao;
import com.example.demo.vo.User;
import com.example.demo.vo.UserCoupon;
import com.example.demo.exception.DuplicatedUserIdException;
import com.example.demo.exception.PasswordMismatchException;
import com.example.demo.exception.UserNotFoundException;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	
	@Override
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}
	
	@Override
	public User getUserById(String userId) {
		return userDao.getUserById(userId);
	}
	
	@Override
	public boolean isExistUserId(String userId) {
		return userDao.getUserById(userId) != null;
	}
	
	@Override
	public User getLoginedUserInfo(String userId, String password) {
		// 아이디로 사용자 정보조회
		User user = userDao.getUserById(userId);
		// 사용자정보가 존재하지 않으면 예외발생
		if (user == null) {
			throw new UserNotFoundException("아이디 ["+userId+"]");
		}

		String secretPassword = DigestUtils.sha256Hex(password);
		// 비밀번호가 일치하지 않으면 예외발생
		if (!user.getPassword().equals(secretPassword)) {
			throw new PasswordMismatchException();
		}
		
		return user;
	}
	
	@Override
	public void addNewUser(User user) {
		User savedUser = userDao.getUserById(user.getId());
		if (savedUser != null) {
			throw new DuplicatedUserIdException("아이디 ["+user.getId()+"]가 이미 존재함");
		}
		String secretPassword = DigestUtils.sha256Hex(user.getPassword());
		user.setPassword(secretPassword);
		
		userDao.insertUser(user);
	}
	
	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	@Override
	public int getUserNo() {
		return userDao.getUserNo();
	}

	@Override
	public void addNewUserRole(int userNo) {
		userDao.addNewUserRole(userNo);
	}
	
	@Override
	public void insertUserCouponHistory(UserCoupon userCoupon) {
		userDao.insertUserCouponHistory(userCoupon);
	}
	
	@Override
	public String getUserAbleStatusById(String userId) {
		return userDao.getUserAbleStatusById(userId);
	}
}
