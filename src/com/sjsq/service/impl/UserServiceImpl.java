package com.sjsq.service.impl;

import com.sjsq.Dao.UserDao;
import com.sjsq.Dao.impl.UserDaoImpl;
import com.sjsq.po.User;
import com.sjsq.service.UserService;

import java.util.ArrayList;
import java.util.List;

public class UserServiceImpl implements UserService {

    //定义dao对象
    private UserDao userDao = new UserDaoImpl();

    //查询用户信息
    @Override
    public List<User> selectUser(String username) {
        StringBuffer sql = new StringBuffer("select * from user where 1 = 1");
        List<Object> list = new ArrayList<>();
        if(username != null){
            sql.append(" and username = ?");
            list.add(username);
        }
        //交给dao层处理逻辑
        return userDao.selectUser(sql.toString(),list.toArray());

    }

    @Override
    public User getUser(Integer userid) {
        return userDao.getUser(userid);
    }

    @Override
    public boolean addUser(User user) {
        return userDao.addUser(user);
    }

    @Override
    public boolean updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public boolean deleteUser(Integer userid) {
        return userDao.deleteUser(userid);
    }

    @Override
    public User login(User user) {
        return userDao.login(user);
    }

    @Override
    public boolean register(User user) {
        return userDao.register(user);
    }
}
