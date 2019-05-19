package com.ace.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.mapper.UserMapper;
import com.ace.model.User;
import com.ace.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper m;
	
	@Override
	public User checkUser(User user){
		return m.checkUser(user);
	}
	
	@Override
	public List<User> getUsers(){
		return m.getUsers();
	}
	
	@Override
	public User getUserById(int id){
		return m.getUserById(id);
	}

	public void modifyUser(User user){
		m.modifyUser(user);
	}

	@Override
	public void delUser(int id) {
		m.delUser(id);
	}

	@Override
	public void addUser(User user) {
		// TODO 自动生成的方法存根
		m.addUser(user);
	}
}
