package com.sjsq.po;

import java.util.Date;


//借阅记录实体类

public class Record {

    private Integer borrowid;
    private Integer userid;
    private Integer bookid;
    private String bookname;
    private String booklink;
    private Date borrowtime;

    public Integer getBorrowid() {
        return borrowid;
    }

    public void setBorrowid(Integer borrowid) {
        this.borrowid = borrowid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getBooklink() {
        return booklink;
    }

    public void setBooklink(String booklink) {
        this.booklink = booklink;
    }

    public Date getBorrowtime() {
        return borrowtime;
    }

    public void setBorrowtime(Date borrowtime) {
        this.borrowtime = borrowtime;
    }

    @Override
    public String toString() {
        return "Record{" +
                "borrowid=" + borrowid +
                ", userid=" + userid +
                ", bookid=" + bookid +
                ", bookname='" + bookname + '\'' +
                ", booklink='" + booklink + '\'' +
                ", borrowtime=" + borrowtime +
                '}';
    }
}

