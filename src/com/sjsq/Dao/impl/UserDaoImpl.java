package com.sjsq.Dao.impl;

import com.sjsq.Dao.UserDao;
import com.sjsq.po.User;
import com.sjsq.utils.BaseDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//实现UserDao接口
public class UserDaoImpl implements UserDao {
    //用户登录
    @Override
    public User login(User user) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            //1.获取数据库连接
            con = BaseDao.getConnection();
            //2.写sql
            String sql = "select * from user where username = ? and password = ?";

            //3.预处理
            ps = con.prepareStatement(sql);

            //4.执行SQL(设置参数)
            ps.setObject(1,user.getUsername());
            ps.setObject(2,user.getPassword());
            rs = ps.executeQuery();
            User currentUser = new User();
            if(rs.next()){
                //从结果集里获取对应字段的值

                currentUser.setUserid(rs.getInt("userid"));
                currentUser.setUsername(rs.getString("username"));
                currentUser.setPassword(rs.getString("password"));
                currentUser.setEmail(rs.getString("email"));
                currentUser.setPhone(rs.getString("phone"));
                currentUser.setIsadmin(rs.getInt("isadmin"));

                //返回对象的值
                return currentUser;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    //用户注册
    @Override
    public boolean register(User user) {
        String sql = "insert into user values(0,?,?,?,?,0)";
        //写list，转数组
        List<Object> list = new ArrayList<>();
        list.add(user.getUsername());
        list.add(user.getPassword());
        list.add(user.getEmail());
        list.add(user.getPhone());

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if (flag){
            return true;
        }else {
            return false;
        }
    }
    //查询多个用户信息
    @Override
    public List<User> selectUser(String sql, Object[] arr) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = BaseDao.getConnection();
            ps = con.prepareStatement(sql);
            if (arr != null){
                for (int i = 0; i < arr.length; i++) {
                    ps.setObject(i+1,arr[i]);
                }
            }

            rs = ps.executeQuery();
            List<User> list = new ArrayList<>();
            while (rs.next()){
                User user = new User();
                user.setUserid(rs.getInt("userid"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setIsadmin(rs.getInt("isadmin"));

                list.add(user);
            }
            return list;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //关闭连接
            BaseDao.close(con,ps,rs);
        }
        return null;
    }
    //按编号查询用户
    @Override
    public User getUser(Integer userid) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = BaseDao.getConnection();
            String sql = "select * from user where userid = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,userid);
            rs = ps.executeQuery();
            while(rs.next()){
                User user = new User();
                user.setUserid(rs.getInt("userid"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setIsadmin(rs.getInt("isadmin"));
                return user;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            BaseDao.close(con,ps,rs);
        }
        return null;
    }

    //新增用户
    @Override
    public boolean addUser(User user) {
        String sql = "insert into user values(0,?,?,?,?,?)";
        List<Object> list = new ArrayList<>();
        list.add(user.getUsername());
        list.add(user.getPassword());
        list.add(user.getEmail());
        list.add(user.getPhone());
        list.add(user.getIsadmin());

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if (flag){
            return true;
        }else {
            return false;
        }
    }

    //修改用户
    @Override
    public boolean updateUser(User user) {
        String sql = "update user set username=?,password=?,email=?,phone=?,isadmin=? where userid = ?";
        List<Object> list = new ArrayList<>();
        list.add(user.getUsername());
        list.add(user.getPassword());
        list.add(user.getEmail());
        list.add(user.getPhone());
        list.add(user.getIsadmin());
        list.add(user.getUserid());

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if (flag){
            return true;
        }else {
            return false;
        }
    }

    //删除用户
    @Override
    public boolean deleteUser(Integer userid) {
        String sql = "delete from user where userid = ?";
        List<Object> list = new ArrayList<>();
        list.add(userid);

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if (flag){
            return true;
        }else {
            return false;
        }
    }
}
