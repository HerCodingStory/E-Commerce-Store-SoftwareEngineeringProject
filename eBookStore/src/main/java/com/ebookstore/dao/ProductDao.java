package com.ebookstore.dao;

import com.ebookstore.model.Product;

import java.util.List;

public interface ProductDao
{
        void addProduct(Product product);

        Product getProductById(String id);

        List<Product> getAllProducts();

        void deleteProduct(String id);

        List<Product> sortBooksByAuthor();

        List<Product> sortBooksByTitle();

        List<Product> sortBooksByPrice();

        List<Product> getAllProductsByAuthor(String author);

        List<Product> searchProduct(String searchText);

        //List<Product> sortBooksByBookRating();

        List<Product> sortBooksByReleaseDate();




}

