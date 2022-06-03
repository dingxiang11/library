package com.sjsq.Dao.impl;

import com.sjsq.Dao.BookDao;
import com.sjsq.po.Book;
import com.sjsq.utils.BaseDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDaoImpl implements BookDao {
    @Override
    public List<Book> select(String sql, Object[] arr) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            //1.连接数据库
            con = BaseDao.getConnection();
            //2.预编译
            ps = con.prepareStatement(sql);
            if (arr != null){
                for (int i = 0; i < arr.length; i++) {
                    //传入sql的参数
                    ps.setObject(i+1,arr[i]);
                }
            }
            //3.执行sql
            rs = ps.executeQuery();
            //4.保存查询出来的数据到list
            List<Book> list = new ArrayList<>();
            while (rs.next()){
                Book book = new Book();
                book.setBookid(rs.getInt("bookid"));
                book.setBookname(rs.getString("bookname"));
                book.setPrice(rs.getDouble("price"));
                book.setAuthor(rs.getString("author"));
                book.setPublish(rs.getString("publish"));
                book.setCategoryid(rs.getInt("categoryid"));
                book.setBooklink(rs.getString("booklink"));
                book.setDeadline(rs.getDate("deadline"));

                list.add(book);
            }
            return list;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //关闭资源,避免出现异常
            BaseDao.close(con,ps,rs);
        }
        return null;
    }

    @Override
    public Book getBook(Integer bookid) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            //1.连接数据库
            con = BaseDao.getConnection();
            //2.预编译
            String sql = "select * from book where bookid = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,bookid);
            //3.执行sql
            rs = ps.executeQuery();
            while (rs.next()){
                Book book = new Book();
                book.setBookid(rs.getInt("bookid"));
                book.setBookname(rs.getString("bookname"));
                book.setPrice(rs.getDouble("price"));
                book.setAuthor(rs.getString("author"));
                book.setPublish(rs.getString("publish"));
                book.setCategoryid(rs.getInt("categoryid"));
                book.setBooklink(rs.getString("booklink"));
                book.setDeadline(rs.getDate("deadline"));

                return book;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //关闭资源，避免出现异常
            BaseDao.close(con,ps,rs);
        }
        return null;
    }

    //新增图书
    @Override
    public boolean addBook(Book book) {
        String sql = "insert into book values (0,?,?,?,?,?,?,now())";
        List<Object> list = new ArrayList<>();
        list.add(book.getBookname());
        list.add(book.getPrice());
        list.add(book.getAuthor());
        list.add(book.getPublish());
        list.add(book.getCategoryid());
        list.add(book.getBooklink());

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if (flag){
            return true;
        }else {
            return false;
        }
    }

    //更新图书
    @Override
    public boolean updateBook(Book book) {
        String sql = "update book set bookname=?,price=?,author=?,publish = ?,categoryid = ?,booklink = ? where bookid = ?";
        List<Object> list = new ArrayList<>();
        list.add(book.getBookname());
        list.add(book.getPrice());
        list.add(book.getAuthor());
        list.add(book.getPublish());
        list.add(book.getCategoryid());
        list.add(book.getBooklink());
        list.add(book.getBookid());

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if (flag){
            return true;
        }else {
            return false;
        }
    }

    //删除图书
    @Override
    public boolean deleteBook(Integer bookid) {
        String sql = "delete from book where bookid = ?";
        List<Object> list = new ArrayList<>();
        list.add(bookid);

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if (flag){
            return true;
        }else {
            return false;
        }
    }
}
