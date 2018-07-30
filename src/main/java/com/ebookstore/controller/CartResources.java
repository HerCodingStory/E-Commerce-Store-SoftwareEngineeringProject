package com.ebookstore.controller;

import com.ebookstore.model.*;
import com.ebookstore.service.CartItemService;
import com.ebookstore.service.CartService;
import com.ebookstore.service.CustomerService;
import com.ebookstore.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class CartResources
{
    @Autowired
    private CartService cartService;

    @Autowired
    private CartItemService cartItemService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private ProductService productService;

    @RequestMapping("/rest/cart/{cartId}")
    public @ResponseBody
    Cart getCartById (@PathVariable(value = "cartId") int cartId) {
        return cartService.getCartById(cartId);
    }
    /*
        @RequestMapping("/rest/savedItems/{savedItemsId}")
        public @ResponseBody
        SavedItems getSavedItemsById (@PathVariable(value = "savedItemsId") int savedItemsId) {
            return cartService.getSavedItemsById(savedItemsId);
        }
    */
    @RequestMapping(value = "/rest/savedItems/save/{productId}", method = RequestMethod.PUT)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void saveItems(@PathVariable(value ="productId") int productId, @AuthenticationPrincipal User activeUser) {

        Customer customer = customerService.getCustomerByUsername(activeUser.getUsername());
        Cart cart = customer.getCart();
        Product product = productService.getProductById(productId);
        List<SavedItems> savedItems = cart.getSavedItems();

        for (int i=0; i<savedItems.size(); i++) {
            if(savedItems.get(i).getProduct().getProductId()==productId){
                return;
            }
        }

        SavedItems saveItem = new SavedItems();
        saveItem.setCart(cart);
        saveItem.setProduct(product);
        cartService.updateSavedItems(saveItem);
    }

    @RequestMapping(value = "/rest/savedItems/removeSaved/{productId}", method = RequestMethod.PUT)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void removeSavedItem (@PathVariable(value = "productId") int productId) {
        SavedItems savedItems = cartService.getSavedItemsByProductId(productId);
        cartService.removeSavedCartItem(savedItems);
    }

    @RequestMapping(value = "/rest/cart/add/{productId}", method = RequestMethod.PUT)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void addItem (@PathVariable(value ="productId") int productId, @AuthenticationPrincipal User activeUser) {

        Customer customer = customerService.getCustomerByUsername(activeUser.getUsername());
        Cart cart = customer.getCart();
        Product product = productService.getProductById(productId);
        List<CartItem> cartItems = cart.getCartItems();

        for (int i=0; i<cartItems.size(); i++) {
            if(product.getProductId()==cartItems.get(i).getProduct().getProductId()){
                CartItem cartItem = cartItems.get(i);
                cartItem.setQuantity(cartItem.getQuantity()+1);
                cartItem.setTotalPrice(product.getProductPrice()*cartItem.getQuantity());
                cartItemService.addCartItem(cartItem);

                return;
            }
        }

        CartItem cartItem = new CartItem();
        cartItem.setProduct(product);
        cartItem.setQuantity(1);
        cartItem.setTotalPrice(product.getProductPrice()*cartItem.getQuantity());
        cartItem.setCart(cart);
        cartItemService.addCartItem(cartItem);
    }

    @RequestMapping(value = "/rest/cart/remove/{productId}", method = RequestMethod.PUT)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void removeItem (@PathVariable(value = "productId") int productId) {
        CartItem cartItem = cartItemService.getCartItemByProductId(productId);
        cartItemService.removeCartItem(cartItem);

    }

    @RequestMapping(value = "/rest/cart/plus/{productId}", method = RequestMethod.PUT)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void addToQuantity (@PathVariable(value = "productId") int productId) {
        CartItem cartItem = cartItemService.getCartItemByProductId(productId);
        Product product = productService.getProductById(productId);
        cartItem.setQuantity(cartItem.getQuantity()+1);
        cartItem.setTotalPrice(Math.round((product.getProductPrice()*cartItem.getQuantity())*100.0)/100.0);
        cartItemService.addCartItem(cartItem);
    }

    @RequestMapping(value = "/rest/cart/minus/{productId}", method = RequestMethod.PUT)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void subtractFromQuantity (@PathVariable(value = "productId") int productId) {
        CartItem cartItem = cartItemService.getCartItemByProductId(productId);
        Product product = productService.getProductById(productId);
        if (cartItem.getQuantity() > 1)
        {
            cartItem.setQuantity(cartItem.getQuantity() - 1);
            cartItem.setTotalPrice(Math.round((product.getProductPrice()*cartItem.getQuantity())*100.0)/100.0);
            cartItemService.addCartItem(cartItem);
        }

    }

    @RequestMapping(value = "/rest/cart/{cartId}", method = RequestMethod.DELETE)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void clearCart(@PathVariable(value = "cartId") int cartId) {
        Cart cart = cartService.getCartById(cartId);
        cartItemService.removeAllCartItems(cart);
    }

    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseStatus(value = HttpStatus.BAD_REQUEST, reason = "Illegal request, please verify your payload.")
    public void handleClientErrors (Exception e) {}

    @ExceptionHandler(Exception.class)
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR, reason = "Internal Server Error.")
    public void handleServerErrors (Exception e) {}
}
