package com.ebookstore.dao;

import com.ebookstore.model.Cart;
import com.ebookstore.model.SavedItems;

import java.io.IOException;

public interface CartDao
{
    Cart getCartById (int cartId);

    SavedItems getSavedItemsById (int savedItemsId);

    Cart validate(int cartId) throws IOException;

    SavedItems validateSavedItems(int savedItemsId) throws IOException;

    void update(Cart cart);

    void updateSavedItems(SavedItems savedItems);
}
