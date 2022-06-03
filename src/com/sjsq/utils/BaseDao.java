package com.sjsq.utils;

import java.sql.*;

//数据库工具类
public class BaseDao {
    private static String driver = "com.mysql.cj.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost/jsp_library_management?serverTimezone=UTC";
    private static String user = "root";
    private static String password = "root";

    //获取数据库连接
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        //加载数据库驱动
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url,user,password);
        return con;
    }

    //关闭数据库连接
    public static void close(Connection con, PreparedStatement ps, ResultSet rs){
        if (rs != null){
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (ps != null){
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null){
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
    //增删改查的方法
    public static boolean addUpdateDelete(String sql,Object[] arr){
        Connection con = null;
        PreparedStatement ps = null;
        try {
            //第一步，获取连接
            con = BaseDao.getConnection();
            //第二步，预处理
            ps = con.prepareStatement(sql);
            //第三步，获取参数
            if (arr != null&& arr.length != 0){
                for (int i = 0; i < arr.length; i++) {
                    ps.setObject(i+1,arr[i]);
                }
            }
            //返回处理条数
            int count = ps.executeUpdate();
            //判断是否执行成功
            if (count > 0){
                return true;
            }else {
                return false;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //测试
    public static void main(String[] args) {
        try {
            System.out.println(BaseDao.getConnection());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
