package com.ebookstore.dao;

import com.ebookstore.model.Product;

import java.util.List;

public interface ProductDao
{
        void addProduct(Product product);

        Product getProductById(int id);

        List<Product> getProductList();

        void deleteProduct(Product product);

        void editProduct(Product product);

        List<Product> sortBooksByAuthor();

        List<Product> sortBooksByTitle();

        List<Product> sortBooksByPrice();

        List<Product> sortBooksByReleaseDate();

        List<Product> sortBooksByRating();

        List<Product> sortBooksByTopSellers();

        List<Product> getAllProductsByAuthor(String author);

        List<Product> searchProduct(String searchText);






}

