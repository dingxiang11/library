package com.sjsq.Dao.impl;

import com.sjsq.Dao.BookShelfDao;
import com.sjsq.po.BookShelf;
import com.sjsq.po.Record;
import com.sjsq.utils.BaseDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookShelfDaoImpl implements BookShelfDao {

    //查询个人书架
    @Override
    public List<BookShelf> selectBookShelf(Integer userid) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            //连接数据库
            con = BaseDao.getConnection();
            //预编译
            String sql = "select * from bookshelf where userid = ?";
            ps = con.prepareStatement(sql);
            if (userid != null){
                //传入sql参数
                ps.setObject(1,userid);
            }
            //执行sql
            rs = ps.executeQuery();
            //保存查询出来的数据到list
            List<BookShelf> list = new ArrayList<>();
            while (rs.next()){
                BookShelf bookShelf = new BookShelf();
                bookShelf.setId(rs.getInt("id"));
                bookShelf.setUserid(rs.getInt("userid"));
                bookShelf.setBookid(rs.getInt("bookid"));
                bookShelf.setBookname(rs.getString("bookname"));
                bookShelf.setBooklink(rs.getString("booklink"));
                bookShelf.setAdddate(rs.getDate("adddate"));
                bookShelf.setRemovedate(rs.getDate("removedate"));

                list.add(bookShelf);
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

    //添加书籍到书架
    @Override
    public boolean addBookShelf(BookShelf bookShelf) {
        String sql = "insert into bookshelf values (0,?,?,?,null,now(),null)";
        List<Object> list = new ArrayList<>();
        list.add(bookShelf.getUserid());
        list.add(bookShelf.getBookid());
        list.add(bookShelf.getBookname());

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if (flag){
            return true;
        }else {
            return false;
        }
    }

    //删除书籍
    @Override
    public boolean removeBookShelf(Integer userid, Integer bookid) {
        String sql = "delete from bookshelf where userid = ? and bookid = ?";
        List<Object> list = new ArrayList<>();
        list.add(userid);
        list.add(bookid);


        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if (flag){
            return true;
        }else {
            return false;
        }
    }
}
