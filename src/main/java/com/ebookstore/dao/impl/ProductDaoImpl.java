package com.ebookstore.dao.impl;

import com.ebookstore.dao.ProductDao;
import com.ebookstore.model.Comment;
import com.ebookstore.model.Product;
import com.ebookstore.model.Rating;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository // this is something that deals with database
@Transactional
public class ProductDaoImpl implements ProductDao
{
    @Autowired
    private SessionFactory sessionFactory;

    public void addProduct(Product product)
    {
        Session session = sessionFactory.getCurrentSession();

        session.saveOrUpdate(product);
        session.flush();
    }

    public Product getProductById(int id)
    {
        Session session = sessionFactory.getCurrentSession();
        Product product = (Product) session.get(Product.class, id);
        session.flush();

        return product;
    }

    public void editProduct (Product product) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(product);
        session.flush();
    }

    public List<Product> getProductList() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Product");
        List<Product> productList = query.list();
        session.flush();

        return productList;
    }

    public List<Product> getAllProductsByAuthor(String author)
    {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Product WHERE Productauthor = '" + author + "'");
        List<Product> products = ((Query) query).list();
        session.flush();

        return products;
    }

    public void deleteProduct (Product product) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(product);
        session.flush();
    }

    public List<Product> sortBooksByAuthor()
    {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("FROM Product ORDER BY Productauthor ASC");
            List<Product> orderedProducts = ((Query) query).list();
            session.flush();

            return orderedProducts;
    }

    public List<Product> sortBooksByTitle()
    {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Product ORDER BY Productname ASC");
        List<Product> orderedProducts = ((Query) query).list();
        session.flush();

        return orderedProducts;
    }

    public List<Product> sortBooksByPrice()
    {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Product ORDER BY Productprice ASC");
        List<Product> orderedProducts = ((Query) query).list();
        session.flush();

        return orderedProducts;
    }

    public List<Product> sortBooksByReleaseDate()
    {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Product ORDER BY Productreleasedate DESC");
        List<Product> orderedProducts = ((Query) query).list();
        session.flush();

        return orderedProducts;
    }


    // Book Rating System is not done yet

    public List<Product> sortBooksByRating()
    {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Product ORDER BY rating DESC");
        List<Product> orderedProducts = ((Query) query).list();
        session.flush();

        return orderedProducts;
    }



    public List<Product> sortBooksByTopSellers()
    {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Product ORDER BY TopSellerStatus");
        List<Product> orderedProducts = ((Query) query).list();
        session.flush();

        return orderedProducts;
    }

    public List<Product> searchProduct(String searchText)
    {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Product where ProductAuthor like '%" + searchText + "%' OR ProductName like '%" + searchText +"%'");
        List<Product> orderedProducts = ((Query) query).list();
        session.flush();

        return orderedProducts;
    }


}
