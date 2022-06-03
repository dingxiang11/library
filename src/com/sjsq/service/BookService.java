package com.sjsq.service;

import com.sjsq.po.Book;

import java.util.List;


//Book的Service层

public interface BookService {

    //查询图书信息

    public List<Book> select(String bookname);

    //根据图书编号进行查询

    public Book getBook(Integer id);


    //图书新增

    public boolean addBook(Book book);


    //图书修改

    public boolean updateBook(Book book);


    //删除图书

    public boolean deleteBook(Integer bookid);
}
