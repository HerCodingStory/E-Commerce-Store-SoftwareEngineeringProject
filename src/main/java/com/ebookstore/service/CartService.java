package com.ebookstore.service;

import com.ebookstore.model.Cart;

public interface CartService
{
    Cart getCartById (int cartId);

    void update(Cart cart);
}
