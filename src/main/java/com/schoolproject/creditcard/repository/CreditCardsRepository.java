package com.schoolproject.creditcard.repository;

import com.schoolproject.creditcard.domain.creditcards;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CreditCardsRepository extends JpaRepository<creditcards, Integer> {

}
