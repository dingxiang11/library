package com.sjsq.po;

import java.sql.Time;
import java.util.Date;


//留言表
public class Comment {

    private Integer commentid;
    private Integer userid;
    private String username;
    private Integer bookid;
    private String bookname;
    private String comment;
    private Date time;

    public Integer getCommentid() {
        return commentid;
    }

    public void setCommentid(Integer commentid) {
        this.commentid = commentid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "commentid=" + commentid +
                ", userid=" + userid +
                ", username='" + username + '\'' +
                ", bookid=" + bookid +
                ", bookname='" + bookname + '\'' +
                ", comment='" + comment + '\'' +
                ", time=" + time +
                '}';
    }
}