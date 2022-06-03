package com.sjsq.Dao;

import com.sjsq.po.Comment;

import java.util.List;

//评论接口
public interface CommentDao {
    //添加评论
    public boolean addComment(Comment comment);

    //查询评论
    public List<Comment> selectComment(Integer bookid);
}