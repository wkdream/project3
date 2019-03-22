package com.mappers;

import java.util.List;

import com.pojo.Page;
import com.pojo.User;

public interface UserMapper {
	public List<User> findAll();
	public void delUser(String u_id);
	public void addUser(User user);
	public void updateUser(User user);
	public User findUserByName(String u_name);
	public List<User> getAllUserByPage(Page page);
	public List<User> findListUserByName(String u_name);
	public List<User> findListUserById(int u_id);
	public List<User> getAllUserByPagedelete(Page page);
	public void updatePassword(User user);
}
