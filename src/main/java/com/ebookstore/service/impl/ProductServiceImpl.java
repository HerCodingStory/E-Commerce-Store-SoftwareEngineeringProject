package com.ebookstore.service.impl;

import com.ebookstore.dao.ProductDao;
import com.ebookstore.model.Cart;
import com.ebookstore.model.CartItem;
import com.ebookstore.model.Product;
import com.ebookstore.service.CartService;
import com.ebookstore.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService
{
    @Autowired
    private ProductDao productDao;

    @Autowired
    private CartService cartService;

    public Product getProductById (int productId) {
        return productDao.getProductById(productId);
    }

    public List<Product> getProductList () {
        return productDao.getProductList();
    }

    public void addProduct(Product product) {
        productDao.addProduct(product);
    }

    public void editProduct(Product product) {
        productDao.editProduct(product);
    }

    public void deleteProduct(Product product) {
        productDao.deleteProduct(product);
    }


}
