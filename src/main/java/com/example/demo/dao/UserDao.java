package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.User;

@Mapper
public interface UserDao {

	List<User> getAllUsers();
}
