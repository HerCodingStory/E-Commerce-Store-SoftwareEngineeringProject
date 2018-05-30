package com.ebookstore.controller;

import com.ebookstore.dao.ProductDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ebookstore.model.Product;
import org.springframework.web.bind.annotation.PathVariable;



@Controller
public class AdminController
{

    @Autowired
    private ProductDao productDao;


    @RequestMapping("/admin")
    public String adminPage()
    {
        return "admin";
    }


}
