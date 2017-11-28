package com.sys.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sys.dao.UserMapper;
import com.sys.entity.User;
import com.sys.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;

	public List<User> getAllUser() {
		return userMapper.getAllUser();
	}

	
	
}
