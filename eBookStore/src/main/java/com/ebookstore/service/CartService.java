package com.ebookstore.service;

import com.ebookstore.model.Cart;
import com.ebookstore.model.SavedItems;

public interface CartService
{
    Cart getCartById (int cartId);

    SavedItems getSavedItemsByProductId (int productId);

    void update(Cart cart);

    void updateSavedItems(SavedItems savedItems);

    void removeSavedCartItem(SavedItems savedItems);
}
