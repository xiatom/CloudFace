package com.ace.service;

import java.util.List;

import com.ace.model.User;

public interface UserService {
	public User checkUser(User user);
	public List<User> getUsers();
	public User getUserById(int id);
	public void modifyUser(User user);
	public void delUser(int id);
	public void addUser(User user);
}
