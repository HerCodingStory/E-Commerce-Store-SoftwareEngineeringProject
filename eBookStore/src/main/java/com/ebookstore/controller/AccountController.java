package com.ebookstore.controller;

import com.ebookstore.model.Customer;
import com.ebookstore.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccountController
{
    @Autowired
    private CustomerService customerService;

    // This methods returns the profile page of the login user
    @RequestMapping("/account/viewCustomer/")
    public String getUserName(@AuthenticationPrincipal User activeUser,  Model model)
    {
        Customer customer = customerService.getCustomerByUsername(activeUser.getUsername());
        model.addAttribute(customer);

        return "viewCustomer";
    }

}
