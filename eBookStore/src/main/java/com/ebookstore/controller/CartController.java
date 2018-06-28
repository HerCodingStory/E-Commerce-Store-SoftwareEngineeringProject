package com.ebookstore.controller;

import com.ebookstore.model.Customer;
import com.ebookstore.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

// This controller is in charge of handling any events that handle control of the shopping cart
@Controller
@RequestMapping("/customer/cart")
public class CartController
{
    // customerService accesses the database of customers
    @Autowired
    private CustomerService customerService;

    // This method gets the cart of the login customer
    @RequestMapping
    public String getCart(@AuthenticationPrincipal User activeUser){
        // get customer's username of the currently active user
        Customer customer = customerService.getCustomerByUsername(activeUser.getUsername());
        // get cardId of that customer
        int cartId = customer.getCart().getCartId();

        // redirect website to that customer's card
        return "redirect:/customer/cart/"+ cartId;
    }

    // This method gets the cardId and adds it to the model
    @RequestMapping("/{cartId}")
    public String getCartRedirect(@PathVariable(value = "cartId") int cartId, Model model) {
        // add the cartId to the model
        model.addAttribute("cartId", cartId);

        // view cart
        return "cart";
    }
}
