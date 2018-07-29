package com.ebookstore.model;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

@Entity
public class Rating implements Serializable
{
    @Id
    @GeneratedValue
    private int ratingId;

    @Size(min=1, max=5)
    private int rating;

    private Date time;

    //private Customer customer;
    @ManyToOne
    @JoinColumn(name="productId")
    private Product product;

    @ManyToOne
    @JoinColumn(name="customerId")
    private Customer customer;

    public int getRatingId() {
        return ratingId;
    }

    public void setRatingId(int ratingId) {
        this.ratingId = ratingId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
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
}
