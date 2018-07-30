package com.ebookstore.dao.impl;

import com.ebookstore.dao.CustomerOrderDao;
import com.ebookstore.model.CustomerOrder;
import com.ebookstore.model.Product;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CustomerOrderDaoImpl implements CustomerOrderDao
{
    @Autowired
    private SessionFactory sessionFactory;

    public void addCustomerOrder(CustomerOrder customerOrder) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(customerOrder);
        session.flush();
    }

    public List<Product> getProductListByCustomer(int customerId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT productId, customerId\n" +
                                            "  FROM CUSTOMERORDER  JOIN CARTITEM \n" +
                                            "    ON CUSTOMERORDER.cartId = CARTITEM.cartId\n" +
                                            "WHERE customerId = " + customerId + ";\n");
        List<Product> products = ((Query) query).list();
        session.flush();

        return products;
    }
}
