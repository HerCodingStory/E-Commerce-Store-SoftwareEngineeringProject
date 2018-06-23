package com.ebookstore.controller;

import com.ebookstore.dao.ProductDao;
import com.ebookstore.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;
import java.util.List;

@Controller
public class ProductController
{
    @Autowired
    private ProductDao productDao;

    // This method shows the details of a specific product
    @RequestMapping("/productList/viewProduct/{productId}")
    public String viewProduct(@PathVariable int productId, Model model) throws IOException
    {
        Product product = productDao.getProductById(productId);

        model.addAttribute(product);

        return "viewProduct";
    }

    // this method returns a list sorted by authors
    @RequestMapping("/productList/sortedAuthors")
    public String sortByAuthor(Model model)
    {
        List<Product> products = productDao.sortBooksByAuthor();
        model.addAttribute("products", products);

        return "sortedBooks";
    }

    // this method returns a list sorted by title
    @RequestMapping("/productList/sortedTitle")
    public String sortByTitle(Model model)
    {
        List<Product> products = productDao.sortBooksByTitle();
        model.addAttribute("products", products);

        return "sortedBooks";
    }

    // this method returns a list sorted by price
    @RequestMapping("/productList/sortedPrice")
    public String sortByPrice(Model model)
    {
        List<Product> products = productDao.sortBooksByPrice();
        model.addAttribute("products", products);

        return "sortedBooks";
    }

    // this method returns a list sorted by authors
    // Book Rating system is not implemented yet
    /*
    @RequestMapping("/productList/sortedBookRating")
    public String sortByBookRating(Model model)
    {
        List<Product> products = productDao.sortBooksByBookRating();
        model.addAttribute("products", products);

        return "sortedBooks";
    }*/

    // this method returns a list sorted by release date
    @RequestMapping("/productList/sortedReleaseDate")
    public String sortByReleaseDate(Model model)
    {
        List<Product> products = productDao.sortBooksByReleaseDate();
        model.addAttribute("products", products);

        return "sortedBooks";
    }


}
