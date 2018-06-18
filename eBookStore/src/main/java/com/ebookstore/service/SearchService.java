package com.ebookstore.service;

import com.ebookstore.model.Product;

import javax.persistence.EntityManager;
import java.util.List;


public interface SearchService
{
    List<Product> fuzzySearch(String searchText);
}
