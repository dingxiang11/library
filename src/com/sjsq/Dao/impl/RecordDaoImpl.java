package com.sjsq.Dao.impl;

import com.sjsq.Dao.RecordDao;
import com.sjsq.po.Record;
import com.sjsq.utils.BaseDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RecordDaoImpl implements RecordDao {

    //查询所有记录
    @Override
    public List<Record> selectRecords() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Record> list = new ArrayList<>();
        try {
            //1.连接数据库
            con = BaseDao.getConnection();
            //2.预编译
            String sql = "select * from record";
            ps = con.prepareStatement(sql);
            //3.执行sql
            rs = ps.executeQuery();
            while(rs.next()){
                Record record = new Record();
                record.setBorrowid(rs.getInt("borrowid"));
                record.setUserid(rs.getInt("userid"));
                record.setBookid(rs.getInt("bookid"));
                record.setBookname(rs.getString("bookname"));
                record.setBooklink(rs.getString("booklink"));
                record.setBorrowtime(rs.getTime("borrowtime"));

                list.add(record);
            }

            return list;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            BaseDao.close(con,ps,rs);
        }
        return null;
    }

    //按照用户查询借阅记录
    @Override
    public List<Record> selectRecord(Integer userid) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Record> list = new ArrayList<>();
        try {
            //1.连接数据库
            con = BaseDao.getConnection();
            //2.预编译
            String sql = "select * from record where userid = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,userid);
            //3.执行sql
            rs = ps.executeQuery();
            while(rs.next()){
                Record record = new Record();
                record.setBorrowid(rs.getInt("borrowid"));
                record.setUserid(rs.getInt("userid"));
                record.setBookid(rs.getInt("bookid"));
                record.setBookname(rs.getString("bookname"));
                record.setBooklink(rs.getString("booklink"));
                record.setBorrowtime(rs.getTime("borrowtime"));

                list.add(record);
            }

            return list;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            BaseDao.close(con,ps,rs);
        }
        return null;
    }

    //插入借阅记录
    @Override
    public boolean addRecord(Record record) {
        String sql = "insert into record values (0,?,?,?,?,now())";
        List<Object> list = new ArrayList<>();
        list.add(record.getUserid());
        list.add(record.getBookid());
        list.add(record.getBookname());
        list.add(record.getBooklink());

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if (flag){
            return true;
        }else {
            return false;
        }
    }

    //删除借阅记录(管理员操作)
    @Override
    public boolean deleteRecord(Integer borrowid) {
        String sql = "delete from record where borrowid = ?";
        List<Object> list = new ArrayList<>();
        list.add(borrowid);

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if (flag){
            return true;
        }else {
            return false;
        }
    }
}
