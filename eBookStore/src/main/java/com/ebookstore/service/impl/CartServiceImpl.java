package com.ebookstore.service.impl;

import com.ebookstore.dao.CartDao;
import com.ebookstore.model.Cart;
import com.ebookstore.model.SavedItems;
import com.ebookstore.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService
{
    @Autowired
    private CartDao cartDao;

    public Cart getCartById(int cartId) {
        return cartDao.getCartById(cartId);
    }

    public SavedItems getSavedItemsById(int savedItemsId) {
        return cartDao.getSavedItemsById(savedItemsId);
    }

    public void update(Cart cart) {
        cartDao.update(cart);
    }

    public void updateSavedItems(SavedItems savedItems) {
        cartDao.updateSavedItems(savedItems);
    }
}
