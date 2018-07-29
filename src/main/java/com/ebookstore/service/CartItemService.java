package com.ebookstore.service;

import com.ebookstore.model.Cart;
import com.ebookstore.model.CartItem;

public interface CartItemService
{
    void addCartItem(CartItem cartItem);

    void saveCartItem(CartItem cartItem);

    void removeCartItem(CartItem cartItem);

    void removeSavedCartItem(CartItem cartItem);

    void removeAllCartItems(Cart cart);

    CartItem getCartItemByProductId (int productId);
}
