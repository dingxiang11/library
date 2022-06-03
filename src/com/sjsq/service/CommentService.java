package com.sjsq.service;

import com.sjsq.po.Comment;

import java.util.List;


public interface CommentService {

    //添加留言
    public boolean addComment(Comment comment);


    //展示留言
    public List<Comment> selectComment(Integer bookid);

}
