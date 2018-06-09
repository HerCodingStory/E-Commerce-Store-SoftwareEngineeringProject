package com.ebookstore.dao.impl;

import com.ebookstore.dao.CustomerDao;
import com.ebookstore.model.*;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CustomerDaoImpl implements CustomerDao
{
    @Autowired
    private SessionFactory sessionFactory;

    public void addCustomer(Customer customer) {
        Session session  = sessionFactory.getCurrentSession();

        customer.getShippingAddress().setCustomer(customer);
        customer.getCreditCard().setCustomer(customer);

        session.saveOrUpdate(customer);
        session.saveOrUpdate(customer.getShippingAddress());
        session.saveOrUpdate(customer.getCreditCard());

        Users newUser = new Users();
        newUser.setUsername(customer.getUsername());
        newUser.setPassword(customer.getPassword());
        newUser.setEnabled(true);
        newUser.setCustomerId(customer.getCustomerId());

        Authorities newAuthority = new Authorities();

        newAuthority.setUsername(customer.getUsername());
        newAuthority.setAuthority("ROLE_USER");
        session.saveOrUpdate(newUser);
        session.saveOrUpdate(newAuthority);

        //Cart newcar = new Cart();
        session.saveOrUpdate(customer);
        session.flush();
    }

    public void editCustomer(Customer customer) {
        Session session  = sessionFactory.getCurrentSession();

        Users user = (Users) session.get(Users.class, customer.getCustomerId());
        Authorities auth = (Authorities) session.get(Authorities.class, customer.getCustomerId());
        //ShippingAddress shipAdd = (ShippingAddress) session.get(ShippingAddress.class, customer.getCustomerId());
        //CreditCard cCard = (CreditCard) session.get(CreditCard.class, customer.getCustomerId());

        session.saveOrUpdate(customer);
        session.saveOrUpdate(customer.getCreditCard());
        session.saveOrUpdate(customer.getShippingAddress());
        auth.setUsername(customer.getUsername());
        user.setUsername(customer.getUsername());
        user.setPassword(customer.getPassword());
        session.flush();
    }

    public Customer getCustomerById(int customerId) {
        Session session = sessionFactory.getCurrentSession();
        return (Customer) session.get(Customer.class, customerId);
    }

    public List<Customer> getAllCustomers() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Customer");
        List<Customer> customerList = ((Query) query).list();

        return customerList;
    }

    public Customer getCustomerByUsername(String username) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Customer WHERE username = ?");
        query.setString(0, username);

        return (Customer) query.uniqueResult();
    }

    public void deleteCustomer(int id)
    {
        Session session = sessionFactory.getCurrentSession();
        session.delete(getCustomerById(id));
        session.flush();
    }
}
