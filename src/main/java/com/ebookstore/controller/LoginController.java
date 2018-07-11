package com.ebookstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

// This controller is in charge of the login page
@Controller
public class LoginController
{
    // This method takes you to the login page. It also returns messages depending on the case
    @RequestMapping("/login")
    public String login(@RequestParam(value="error", required = false) String error,
                        @RequestParam(value="logout", required = false) String logout, Model model)
    {
        // if user entered the wrong info this error will trigger
        if (error != null)
        {
            model.addAttribute("error", "Invalid username and password!");
        }

        // if user logouts, this msg will trigger
        if (logout != null)
        {
            model.addAttribute("msg", "You have been logged out successfully!");
        }

        // else view login page
        return "login";
    }
}

