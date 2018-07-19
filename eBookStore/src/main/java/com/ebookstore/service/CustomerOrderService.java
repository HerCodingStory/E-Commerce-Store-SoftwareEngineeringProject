package com.ebookstore.service;

import com.ebookstore.model.CustomerOrder;
import com.ebookstore.model.Product;

import java.util.List;

public interface CustomerOrderService
{
    void addCustomerOrder(CustomerOrder customerOrder);

    double getCustomerOrderGrandTotal(int cartId);

}
