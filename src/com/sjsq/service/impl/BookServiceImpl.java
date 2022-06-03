package com.sjsq.service.impl;

import com.sjsq.Dao.BookDao;
import com.sjsq.Dao.impl.BookDaoImpl;
import com.sjsq.po.Book;
import com.sjsq.service.BookService;

import java.util.ArrayList;
import java.util.List;

//book的service实现层
public class BookServiceImpl implements BookService {
    private BookDao bookDao = new BookDaoImpl();
    //按照书籍名查找图书信息
    @Override
    public List<Book> select(String bookname) {
        StringBuffer sql = new StringBuffer("select * from book where 1 = 1");
        List<Object> list = new ArrayList<>();
        if (bookname != null){
            sql.append(" and bookname = ?");
            list.add(bookname);
        }
        return bookDao.select(sql.toString(),list.toArray());
    }

    @Override
    public Book getBook(Integer bookid) {
        return bookDao.getBook(bookid);
    }

    @Override
    public boolean addBook(Book book) {
        return bookDao.addBook(book);
    }

    @Override
    public boolean updateBook(Book book) {
        return bookDao.updateBook(book);
    }

    @Override
    public boolean deleteBook(Integer bookid) {
        return bookDao.deleteBook(bookid);
    }
}
