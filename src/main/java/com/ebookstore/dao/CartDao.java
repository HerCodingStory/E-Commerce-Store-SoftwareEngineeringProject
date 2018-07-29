package com.ebookstore.dao;

import com.ebookstore.model.Cart;
import com.ebookstore.model.SavedItems;

import java.io.IOException;

public interface CartDao
{
    Cart getCartById (int cartId);

    SavedItems getSavedItemsByProductId (int productId);

    Cart validate(int cartId) throws IOException;

    //SavedItems validateSavedItems(int savedItemsId) throws IOException;

    void update(Cart cart);

    void updateSavedItems(SavedItems savedItems);

    void removeSavedCartItem (SavedItems savedItems);
}
