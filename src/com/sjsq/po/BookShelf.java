package com.sjsq.po;

import java.util.Date;


//书架类
public class BookShelf {
    private Integer id;
    private Integer userid;
    private Integer bookid;
    private String bookname;
    private String booklink;
    private Date adddate;
    private Date removedate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Date getAdddate() {
        return adddate;
    }

    public void setAdddate(Date adddate) {
        this.adddate = adddate;
    }

    public Date getRemovedate() {
        return removedate;
    }

    public void setRemovedate(Date removedate) {
        this.removedate = removedate;
    }

    @Override
    public String toString() {
        return "BookShelf{" +
                "id=" + id +
                ", userid=" + userid +
                ", bookid=" + bookid +
                ", bookname='" + bookname + '\'' +
                ", booklink='" + booklink + '\'' +
                ", adddate=" + adddate +
                ", removedate=" + removedate +
                '}';
    }
}
