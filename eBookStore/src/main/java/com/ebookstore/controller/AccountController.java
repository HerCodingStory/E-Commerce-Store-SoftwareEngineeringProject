package com.ebookstore.controller;

import com.ebookstore.dao.CustomerDao;
import com.ebookstore.model.Customer;
import com.ebookstore.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@Controller
public class AccountController
{

    //@Autowired
    //private CustomerDao customerDao;

    @Autowired
    private CustomerService customerService;

    @RequestMapping("/account/viewCustomer/{customerId}")
    public String getUserAccount(@PathVariable int customerId, Model model) throws IOException
    {
        Customer customer = customerService.getCustomerById(customerId);

        model.addAttribute(customer);

        return "viewCustomer";

    }
    /*
    @RequestMapping
    public String getUserName(@AuthenticationPrincipal User activeUser)
    {
        Customer customer = customerService.getCustomerByUsername(activeUser.getUsername());
        int customerId = customer.getCustomerId();

        return "redirect:/account/viewCustomer/"+customerId;
    }

    /*

    @RequestMapping("/{customerId}")
    public String getCustomerRedirect(@PathVariable (value = "customerId") int customerId, Model model)
    {
        model.addAttribute("customerId", customerId);

        return "customer";
    }*/

}
