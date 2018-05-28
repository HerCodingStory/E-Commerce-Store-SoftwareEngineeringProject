package com.ebookstore.controller;

import com.ebookstore.dao.ProductDao;
import com.ebookstore.model.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class HomeController
{
    private ProductDao productDao = new ProductDao();

    @RequestMapping("/")
    public String home()
    {
        return "home";
    }

    @RequestMapping("/productList")
    public String getProducts(Model model)
    {
        List<Product> products = productDao.getProductList();
        model.addAttribute("products", products);

        return "productList";
    }
}
