package com.ebookstore.model;

import org.springframework.security.crypto.bcrypt.BCrypt;
import javax.persistence.Entity;
import javax.persistence.*;

@Entity
public class Users
{
    @Id
    @GeneratedValue
    private int userId;
    private String username;
    private String password;
    private boolean enabled;

    //@OneToOne
    @JoinColumn(name="customerId")
    private int customerId;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }


}
