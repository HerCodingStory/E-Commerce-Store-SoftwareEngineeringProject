package com.ebookstore.controller;

import com.ebookstore.dao.ProductDao;
import com.ebookstore.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.List;

@Controller
public class HomeController
{
    @Autowired
    private ProductDao productDao;

    @RequestMapping("/")
    public String home()
    {
        return "home";
    }

    @RequestMapping("/productList")
    public String getProducts(Model model)
    {
        List<Product> products = productDao.getAllProducts();
        model.addAttribute("products", products);

        return "productList";
    }

    @RequestMapping("/productList/viewProduct/{productId}")
    public String viewProduct(@PathVariable String productId, Model model) throws IOException
    {
        Product product = productDao.getProductById(productId);

        model.addAttribute(product);

        return "viewProduct";
    }

}
