package com.ebookstore.dao;

import com.ebookstore.model.Customer;

import java.util.List;

public interface CustomerDao
{
    void addCustomer(Customer customer);

    Customer getCustomerById(int customerId);

    List<Customer> getAllCustomers();

    Customer getCustomerByUsername(String username);

    void editCustomer(Customer customer);

    void deleteCustomer(int id);

}
