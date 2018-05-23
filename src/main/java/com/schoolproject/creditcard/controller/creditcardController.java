package com.schoolproject.creditcard.controller;

import com.schoolproject.creditcard.domain.creditcards;
import com.schoolproject.creditcard.repository.CreditCardsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class creditcardController {

    @Autowired
    CreditCardsRepository creditCardsRepository;

    @PostMapping(value = "/add/ccard", consumes = {"application/json"})
    public void addCard(@RequestBody creditcards acreditcard){
        creditCardsRepository.save(acreditcard);
    }

    @GetMapping(value = "/get/ccard")
    public List<creditcards> getALL(){
        return creditCardsRepository.findAll();
    }
}
