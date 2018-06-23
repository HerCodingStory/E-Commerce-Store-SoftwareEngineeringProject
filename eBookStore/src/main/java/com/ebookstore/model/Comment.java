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
    private String comment;
    private Date time;
    private String ip;

    @OneToOne
    @JoinColumn(name="productId")
    private Product product;

    @OneToOne
    @JoinColumn(name="customerId")
    private Customer customer;

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

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
