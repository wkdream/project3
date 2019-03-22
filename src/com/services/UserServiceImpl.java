package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mappers.UserMapper;
import com.pojo.Page;
import com.pojo.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		List<User> list = userMapper.findAll();
		return list;
	}
	@Override
	public void delUser(String u_id) {
		// TODO Auto-generated method stub
		userMapper.delUser(u_id);
		
	}

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		userMapper.addUser(user);
		
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		userMapper.updateUser(user);
		
	}

	@Override
	public User findUserByName(String u_name) {
		// TODO Auto-generated method stub
		User user = userMapper.findUserByName(u_name);
		return user;
	}
	@Override
	public List<User> getAllUserByPage(Page page) {
		// TODO Auto-generated method stub
		List<User> userByPage = userMapper.getAllUserByPage(page);
		return userByPage;
	}
	@Override
	public List<User> findListUserByName(String u_name) {
		// TODO Auto-generated method stub
		List<User> findListUserByName = userMapper.findListUserByName(u_name);
		return findListUserByName;
	}
	@Override
	public List<User> findListUserById(int u_id) {
		// TODO Auto-generated method stub
		List<User> list = userMapper.findListUserById(u_id);
		return list;
	}
	@Override
	public List<User> getAllUserByPagedelete(Page page) {
		// TODO Auto-generated method stub
		List<User> list=userMapper.getAllUserByPagedelete(page);
		return list;
	}
	@Override
	public void updatePassword(User user) {
		// TODO Auto-generated method stub
		userMapper.updatePassword(user);
	}

}
