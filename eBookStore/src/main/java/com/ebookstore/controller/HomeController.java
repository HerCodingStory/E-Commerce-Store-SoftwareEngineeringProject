package com.ebookstore.controller;

import com.ebookstore.dao.ProductDao;
import com.ebookstore.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.List;

@Controller
public class HomeController
{
    @Autowired
    private ProductDao productDao;

    @RequestMapping("/")
    public String home()
    {
        return "home";
    }

    @RequestMapping("/productList")
    public String getProducts(Model model)
    {
        List<Product> products = productDao.getAllProducts();
        model.addAttribute("products", products);

        return "productList";
    }

    @RequestMapping("/productList/viewProduct/{productId}")
    public String viewProduct(@PathVariable String productId, Model model) throws IOException
    {
        Product product = productDao.getProductById(productId);

        model.addAttribute(product);

        return "viewProduct";
    }

    @RequestMapping("/productList/sortedAuthors")
    public String sortByAuthor(Model model)
    {
        List<Product> products = productDao.sortBooksByAuthor();
        model.addAttribute("products", products);

        return "sortedBooks";
    }

    @RequestMapping("/productList/sortedTitle")
    public String sortByTitle(Model model)
    {
        List<Product> products = productDao.sortBooksByTitle();
        model.addAttribute("products", products);

        return "sortedBooks";
    }

    @RequestMapping("/productList/sortedPrice")
    public String sortByPrice(Model model)
    {
        List<Product> products = productDao.sortBooksByPrice();
        model.addAttribute("products", products);

        return "sortedBooks";
    }

    // Book Rating system is not implemented yet
    /*
    @RequestMapping("/productList/sortedBooks")
    public String sortByBookRating(Model model)
    {
        List<Product> products = productDao.sortBooksByBookRating();
        model.addAttribute("products", products);

        return "sortBookRating";
    }*/

    @RequestMapping("/productList/sortedReleaseDate")
    public String sortByReleaseDate(Model model)
    {
        List<Product> products = productDao.sortBooksByReleaseDate();
        model.addAttribute("products", products);

        return "sortedBooks";
    }

    @RequestMapping("/productList/searchBook")
    public String searchProducts(String author, Model model)
    {
        List<Product> products = productDao.getProductsByAuthor(author);
        model.addAttribute("products", products);

        return "searchBook";
    }

}
