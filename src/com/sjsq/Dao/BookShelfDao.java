package com.sjsq.Dao;

import com.sjsq.po.BookShelf;

import java.util.List;

//书架接口
public interface BookShelfDao {
    //按照用户名检索书架
    public List<BookShelf> selectBookShelf(Integer userid);

    //加入书架
    public boolean addBookShelf(BookShelf bookShelf);

    //移除书架
    public boolean removeBookShelf(Integer userid,Integer bookid);
}


