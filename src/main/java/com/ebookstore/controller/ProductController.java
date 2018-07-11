package com.ebookstore.controller;

import com.ebookstore.dao.ProductDao;
import com.ebookstore.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;
import java.util.List;

// This controller is in charge of handling any events that control products
@Controller
public class ProductController
{
    // productDao accesses the database of products
    @Autowired
    private ProductDao productDao;

    // This method shows the details of a specific product
    @RequestMapping("/productList/viewProduct/{productId}")
    public String viewProduct(@PathVariable int productId, Model model) throws IOException
    {
        // get the product the user wants to look at
        Product product = productDao.getProductById(productId);

        // adds the product to the model
        model.addAttribute(product);

        // view product specific page
        return "viewProduct";
    }

    // This method returns a list sorted by authors
    @RequestMapping("/productList/sortedAuthors")
    public String sortByAuthor(Model model)
    {
        // Creates list of products sorted by author
        List<Product> products = productDao.sortBooksByAuthor();

        // adds the list to the model
        model.addAttribute("products", products);

        // view products sorted by authors
        return "sortedBooks";
    }

    // This method returns a list sorted by title
    @RequestMapping("/productList/sortedTitle")
    public String sortByTitle(Model model)
    {
        // Creates list of products sorted by title
        List<Product> products = productDao.sortBooksByTitle();

        // adds the list to the model
        model.addAttribute("products", products);

        // view products sorted by titles
        return "sortedBooks";
    }

    // This method returns a list sorted by price
    @RequestMapping("/productList/sortedPrice")
    public String sortByPrice(Model model)
    {
        // Creates list of products sorted by price
        List<Product> products = productDao.sortBooksByPrice();

        // adds the list to the model
        model.addAttribute("products", products);

        // view products sorted by price
        return "sortedBooks";
    }

    // Book Rating system is not implemented yet
    // This method returns a list sorted by rating
    /*
    @RequestMapping("/productList/sortedBookRating")
    public String sortByBookRating(Model model)
    {
        // Creates list of products sorted by rating
        List<Product> products = productDao.sortBooksByRating();

        // adds the list to the model
        model.addAttribute("products", products);

        // view products sorted by rating
        return "sortedBooks";
    }*/

    // Book Selling system is not implemented yet
    // This method returns a list sorted by top sellers
    /*
    @RequestMapping("/productList/sortedBookTopSellers")
    public String sortByBookTopSellers(Model model)
    {
        // Creates list of products sorted by top sellers
        List<Product> products = productDao.sortBooksByTopSellers();

        // adds the list to the model
        model.addAttribute("products", products);

        // view products sorted by top sellers
        return "sortedBooks";
    }*/

    // This method returns a list sorted by release date
    @RequestMapping("/productList/sortedReleaseDate")
    public String sortByReleaseDate(Model model)
    {
        List<Product> products = productDao.sortBooksByReleaseDate();

        // adds the list to the model
        model.addAttribute("products", products);

        // view products sorted by release date
        return "sortedBooks";
    }


}
