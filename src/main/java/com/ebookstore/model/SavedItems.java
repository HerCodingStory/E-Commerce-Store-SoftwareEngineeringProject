package com.ebookstore.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
public class SavedItems implements Serializable
{
    private static final long serialVersionUID = 3940548625296145582L;

    @Id
    @GeneratedValue
    private int savedItemsId;

    @ManyToOne
    @JoinColumn(name = "cartId")
    @JsonIgnore
    private Cart cart;

    @ManyToOne
    @JoinColumn(name = "productId")
    private Product product;

    public int getSavedItemsId() {
        return savedItemsId;
    }

    public void setSavedItemsId(int savedItemsId) {
        this.savedItemsId = savedItemsId;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
