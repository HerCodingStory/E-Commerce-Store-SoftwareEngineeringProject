package com.ebookstore.dao;
import com.ebookstore.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductDao
{
    private List<Product> productList;

    public List<Product> getProductList()
    {
        Product product1 = new Product();

        product1.setProductName("HarryPotter");
        product1.setProductAuthor("J. K. Rowling");
        product1.setProductCategory("Fantasy, drama, young adult fiction, mystery, thriller, Bildungsroman");
        product1.setProductDescription("This is a magical book");
        product1.setProductPrice(50);
        product1.setProductCondition("New");
        product1.setProductStatus("Active");
        product1.setUnitInStock(11);
        product1.setProductPublisher("Bloomsbury Publishing & Scholastic");

        Product product2 = new Product();

        product2.setProductName("Twilight");
        product2.setProductAuthor("Stephenie Meyer");
        product2.setProductCategory("Young adult, fantasy, romance, vampire");
        product2.setProductDescription("This is a vampire's book");
        product2.setProductPrice(25);
        product2.setProductCondition("New");
        product2.setProductStatus("Active");
        product2.setUnitInStock(9);
        product2.setProductPublisher("Little, Brown and Company");

        Product product3 = new Product();

        product3.setProductName("Narnia");
        product3.setProductAuthor("C. S. Lewis");
        product3.setProductCategory("Fantasy, Children's literature");
        product3.setProductDescription("This is a magical book");
        product3.setProductPrice(35);
        product3.setProductCondition("New");
        product3.setProductStatus("Active");
        product3.setUnitInStock(13);
        product3.setProductPublisher("HarperCollins");

        productList = new ArrayList<Product>();
        productList.add(product1);
        productList.add(product2);
        productList.add(product3);

        return productList;
    }
}
