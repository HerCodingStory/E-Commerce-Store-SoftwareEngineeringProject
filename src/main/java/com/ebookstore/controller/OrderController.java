package com.ebookstore.controller;

import com.ebookstore.model.Cart;
import com.ebookstore.model.Customer;
import com.ebookstore.model.CustomerOrder;
import com.ebookstore.service.CartService;
import com.ebookstore.service.CustomerOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

// This controller is in charge of handling any events that control the customers orders
@Controller
public class OrderController
{
    // cartService accesses the database of carts
    @Autowired
    private CartService cartService;

    // customerOrderService accesses the database of customers orders
    @Autowired
    private CustomerOrderService customerOrderService;


    @RequestMapping("/order/{cartId}")
    public String createOrder(@PathVariable("cartId") int cartId) {
        CustomerOrder customerOrder = new CustomerOrder();
        Cart cart=cartService.getCartById(cartId);
        customerOrder.setCart(cart);

        Customer customer = cart.getCustomer();
        customerOrder.setCustomer(customer);
        customerOrder.setCreditCard(customer.getCreditCard());
        customerOrder.setShippingAddress(customer.getShippingAddress());

        customerOrderService.addCustomerOrder(customerOrder);

        return "redirect:/checkout?cartId="+cartId;
    }
}
