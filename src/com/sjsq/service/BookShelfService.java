package com.sjsq.service;

import com.sjsq.po.BookShelf;

import java.util.List;



public interface BookShelfService {


    //按照用户名检索书架

    public List<BookShelf> selectBookShelf(Integer userid);


    //加入书架

    public boolean addBookShelf(BookShelf bookShelf);



    //移出书架

    public boolean removeBookShelf(Integer userid,Integer bookid);

}
