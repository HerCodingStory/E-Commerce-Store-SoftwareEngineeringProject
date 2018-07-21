package com.ebookstore.dao.impl;

import com.ebookstore.dao.CommentDao;
import com.ebookstore.model.Comment;
import com.ebookstore.model.Customer;
import com.ebookstore.model.Product;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CommentDaoImpl implements CommentDao
{
    @Autowired
    private SessionFactory sessionFactory;

    public void addComment(Comment comment) {
        Session session = sessionFactory.getCurrentSession();
        if (comment.getNickname().isEmpty())
        {
            comment.setNickname("Anonymous");
        }
        session.saveOrUpdate(comment);
        session.flush();
    }

    public Comment getCommentById(int commentId) {
        Session session = sessionFactory.getCurrentSession();
        Comment comment = (Comment) session.get(Comment.class, commentId);
        session.flush();

        return comment;
    }

    public List<Comment> getCommentListByProduct(int productId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Comment WHERE Productid = " + productId);
        List<Comment> comments = ((Query) query).list();
        session.flush();

        return comments;
    }

    public void deleteComment(Comment comment) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(comment);
        session.flush();
    }

    public void editComment(Comment comment) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(comment);
        session.flush();
    }
}
