package com.ebookstore.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import java.io.Serializable;

@Entity
public class Bought implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id

    @OneToOne
    private int customerid;

    private int productid;

    public int getCustomerid() { return customerid; }

    public void setCustomerid(int customerid) { this.customerid = customerid; }

    public int getProductid() { return productid; }

    public void setProductid(int productid) { this.productid = productid; }
}
