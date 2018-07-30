package com.ebookstore.controller;


import com.ebookstore.model.Cart;
import com.ebookstore.model.Customer;
import com.ebookstore.model.Users;
import com.ebookstore.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

// This controller is in charge of handling any events that control the user account
@Controller
public class AccountController
{

    // customerService accesses the database of customers
    @Autowired
    private CustomerService customerService;

    // This methods returns the profile page of the login user
    @RequestMapping("/account/viewCustomer/")
    public String getUserName(@AuthenticationPrincipal User activeUser, Model model)
    {
        System.out.println(activeUser.toString());
        // get customer's username of currently active user
        Customer customer = customerService.getCustomerByUsername(activeUser.getUsername());
        // add customer to model
        model.addAttribute(customer);

        // view customer account
        return "viewCustomer";
    }

    @RequestMapping("/account/viewCustomer/editCustomer/{id}")
    public String editCustomer(@PathVariable("id") int id, Model model) {
        Customer customer = customerService.getCustomerById(id);

        model.addAttribute("customer", customer);

        return "editCustomer";
    }

    @RequestMapping(value="/account/viewCustomer/editCustomer", method = RequestMethod.POST)
    public String editCustomerPost(@Valid @ModelAttribute("customer") Customer customer, BindingResult result,
                                   HttpServletRequest request)
    {
        System.out.println("Hello");
        if(result.hasErrors()) {
            System.out.println(result.getFieldError());
            return "editCustomer";
        }
        System.out.println("Bye");

        customerService.editCustomer(customer);

        return "redirect:/";
    }
}
