package com.ebookstore.service.impl;
/*
import com.ebookstore.model.Product;
import com.ebookstore.service.SearchService;
import org.apache.lucene.search.Query;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.jpa.Search;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
@Service
public class SearchServiceImpl implements SearchService {

    @Autowired
    private final EntityManager centityManager;

    @Autowired
    public SearchServiceImpl(EntityManager entityManager)
    {
        super();
        this.centityManager = entityManager;
    }

    public void initializedHibernateSearch()
    {
        try{
            FullTextEntityManager fullTextEntityManager = Search.getFullTextEntityManager(centityManager);
            fullTextEntityManager.createIndexer().startAndWait();
        }
        catch(InterruptedException e)
        {
            e.printStackTrace();
        }
    }

    @Transactional
    public List<Product> fuzzySearch(String searchText)
    {
        FullTextEntityManager fullTextEntityManager = Search.getFullTextEntityManager(centityManager);
        QueryBuilder qb = fullTextEntityManager.getSearchFactory().buildQueryBuilder().forEntity(Product.class).get();
        Query query = qb.keyword().fuzzy().withEditDistanceUpTo(1).withPrefixLength(1).onFields("Productauthor", "Productname").matching(searchText).createQuery();

        org.hibernate.search.jpa.FullTextQuery jpaQuery = fullTextEntityManager.createFullTextQuery(query, Product.class);

        List<Product> productList = null;
        try
        {
            productList = jpaQuery.getResultList();
        }
        catch(NoResultException nre)
        {
            nre.printStackTrace();
        }

        return productList;
    }

}*/
