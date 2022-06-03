package com.sjsq.service.impl;

import com.sjsq.Dao.CommentDao;
import com.sjsq.Dao.impl.CommentDaoImpl;
import com.sjsq.po.Comment;
import com.sjsq.service.CommentService;

import java.util.List;

public class CommentServiceImpl implements CommentService {

    private CommentDao commentDao = new CommentDaoImpl();
    @Override
    public boolean addComment(Comment comment) {
        return commentDao.addComment(comment);
    }

    @Override
    public List<Comment> selectComment(Integer bookid) {
        return commentDao.selectComment(bookid);
    }
}
