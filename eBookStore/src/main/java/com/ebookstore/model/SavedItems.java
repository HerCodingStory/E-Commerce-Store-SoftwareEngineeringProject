package com.ebookstore.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

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

    @OneToMany(mappedBy = "savedItems", cascade = CascadeType.ALL)
    private List<CartItem> savedItems;

    @OneToOne
    @JoinColumn(name = "customerId")
    @JsonIgnore
    private Customer customer;

    private double grandTotal;


    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public double getGrandTotal() {
        return grandTotal;
    }

    public void setGrandTotal(double grandTotal) {
        this.grandTotal = grandTotal;
    }

    public List<CartItem> getSavedItems() {
        return savedItems;
    }

    public void setSavedItems(List<CartItem> savedItems) {
        this.savedItems = savedItems;
    }

    public int getSavedItemsId() {
        return savedItemsId;
    }

    public void setSavedItemsId(int savedItemsId) {
        this.savedItemsId = savedItemsId;
    }
}
