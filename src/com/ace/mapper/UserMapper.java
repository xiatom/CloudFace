package com.ace.mapper;

import java.util.List;

import com.ace.model.User;

public interface UserMapper {
	public User checkUser(User user);
   	public List<User> getUsers();
	public User getUserById(int id);
	public void modifyUser(User user);
	public void delUser(int id);
	public void addUser(User user);
}
