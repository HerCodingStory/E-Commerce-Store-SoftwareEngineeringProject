package com.ebookstore.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
public class Comment implements Serializable
{
    @Id
    @GeneratedValue
    private int commentId;

    @Column(nullable = false, length = 20)
    private String commentTitle;

    private String nickname = "Anonymous";

    @Column(nullable = false, length = 500)
    private String comment;

    @Column(nullable = false)
    private Date time = new Date();

    @ManyToOne
    @JoinColumn(name="productId")
    private Product product;

    @Column(nullable = false, length = 20)
    private double rating = 0.0;

    //@ManyToOne
    //@JoinColumn(name="customerId")
    //private Customer customer;

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getCommentTitle() {
        return commentTitle;
    }

    public void setCommentTitle(String commentTitle) {
        this.commentTitle = commentTitle;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }
}
