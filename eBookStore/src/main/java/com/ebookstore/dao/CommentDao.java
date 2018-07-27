package com.ebookstore.dao;

import com.ebookstore.model.Comment;

import java.util.List;

public interface CommentDao
{
    void addComment(Comment comment);

    Comment getCommentById(int commentId);

    List<Comment> getCommentListByProduct(int productId);

    void deleteComment(Comment comment);

    void editComment(Comment comment);
}
