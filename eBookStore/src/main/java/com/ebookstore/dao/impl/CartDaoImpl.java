package com.ebookstore.dao.impl;

import com.ebookstore.dao.CartDao;
import com.ebookstore.model.Cart;
import com.ebookstore.model.SavedItems;
import com.ebookstore.service.CustomerOrderService;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;

@Repository
@Transactional
public class CartDaoImpl implements CartDao
{
    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private CustomerOrderService customerOrderService;

    public Cart getCartById (int cartId) {
        Session session = sessionFactory.getCurrentSession();
        return (Cart) session.get(Cart.class, cartId);
    }

    public SavedItems getSavedItemsByProductId (int productId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from SavedItems where productId = ?");
        query.setInteger(0, productId);
        session.flush();

        return (SavedItems) query.uniqueResult();
    }

    public void update(Cart cart) {
        int cartId = cart.getCartId();
        double grandTotal = customerOrderService.getCustomerOrderGrandTotal(cartId);
        cart.setGrandTotal(grandTotal);

        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(cart);
    }

    public void updateSavedItems(SavedItems savedItems) {
        int savedItemsId = savedItems.getSavedItemsId();

        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(savedItems);
    }
/*
    public SavedItems validateSavedItems(int savedItemsId) throws IOException {
        SavedItems savedItems = getSavedItemsById(savedItemsId);
        if(savedItems==null||savedItems.getSavedItems().size()==0) {
            throw new IOException(savedItemsId+"");
        }
        updateSavedItems(savedItems);
        return savedItems;
    }
*/
    public Cart validate(int cartId) throws IOException {
        Cart cart=getCartById(cartId);
        if(cart==null||cart.getCartItems().size()==0) {
            throw new IOException(cartId+"");
        }
        update(cart);
        return cart;
    }

    public void removeSavedCartItem (SavedItems savedItems) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(savedItems);
        session.flush();
    }
}
