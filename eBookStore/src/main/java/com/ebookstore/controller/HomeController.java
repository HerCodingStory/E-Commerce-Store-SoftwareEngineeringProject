package com.ebookstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController
{
    // This method takes you to the home page
    @RequestMapping("/")
    public String home()
    {
        return "home";
    }

}
