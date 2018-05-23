package com.schoolproject.creditcard.domain;

import org.springframework.boot.autoconfigure.web.ResourceProperties;
import sun.util.calendar.LocalGregorianCalendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;


@Entity
public class creditcards implements creditcardsInt{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    @NotNull
    private Long ccNumber;
    @NotNull
    private Integer expMonth;
    @NotNull
    private Integer expYear;

    public creditcards(){}

    public creditcards(Integer ccNumber, Integer expMonth, Integer expYear){}

    @Override
    public Long getCcNumber() {
        return ccNumber;
    }
    @Override
    public void setCcNumber(Long ccNumber) {
        this.ccNumber = ccNumber;
    }
    @Override
    public Integer getExpMonth() {
        return expMonth;
    }
    @Override
    public void setExpMonth(Integer expMonth) {
        this.expMonth = expMonth;
    }
    @Override
    public Integer getExpYear() {
        return expYear;
    }
    @Override
    public void setExpYear(Integer expYear) {
        this.expYear = expYear;
    }
}
