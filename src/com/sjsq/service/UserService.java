package com.sjsq.service;

import com.sjsq.po.User;

import java.util.List;

//Service层
public interface UserService {
    //查询用户信息
    public List<User> selectUser(String username);

    public User getUser(Integer userid);

    public boolean addUser(User user);

    public boolean updateUser(User user);

    public boolean deleteUser(Integer userid);
    //用户登录
    public User login(User user);
    //用户登录
    public boolean register(User user);
}

