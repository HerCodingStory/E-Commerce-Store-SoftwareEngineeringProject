package com.ebookstore.service;

import com.ebookstore.model.CustomerOrder;

public interface CustomerOrderService
{
    void addCustomerOrder(CustomerOrder customerOrder);

    double getCustomerOrderGrandTotal(int cartId);
}
