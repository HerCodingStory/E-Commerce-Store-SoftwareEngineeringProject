package com.ebookstore.controller;

import com.ebookstore.model.CreditCard;
import com.ebookstore.model.Customer;
import com.ebookstore.model.ShippingAddress;
import com.ebookstore.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.List;
import java.util.regex.Pattern;

@Controller
public class RegisterController
{
    @Autowired
    private CustomerService customerService;

    //
    @RequestMapping("/register")
    public String registerCustomer(Model model)
    {
        Customer customer = new Customer();
        ShippingAddress shippingAddress = new ShippingAddress();
        CreditCard creditCard = new CreditCard();
        customer.setShippingAddress(shippingAddress);
        customer.setCreditCard(creditCard);

        model.addAttribute("customer", customer);

        return "registerCustomer";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerCustomerPost(@Valid @ModelAttribute("customer") Customer customer, BindingResult result, Model model)
    {
        // Validation
        if (result.hasErrors())
        {
            return "registerCustomer";
        }

        // Validation for Password (format)
        boolean hasUpperCase = !(customer.getPassword()).equals(customer.getPassword().toLowerCase());
        boolean hasLowerCase = !(customer.getPassword()).equals(customer.getPassword().toLowerCase());
        boolean hasSpecial = !(customer.getPassword()).matches("[A-Za-z0-9 ]*");

        if ((customer.getPassword().length() < 8) || (!hasUpperCase) || (!hasLowerCase) || !hasSpecial)
        {
            model.addAttribute("passwordMsg", "\nPassword must meet requirements: \n" +
                                                    "- Passwords must be at least 8 characters in length. \n" +
                                                    "- Contain one lower case. (i.e. a-z) \n" +
                                                    "- Contain one upperCase. (i.e. A-Z) \n" +
                                                    "- Contain numbers. (i.e. 0-9) \n" +
                                                    "- Contain special Character. (e.g. -=[];,./~!@#$%^&*()_+{}|:<>?)");
            return "registerCustomer";
        }

        // Validation for Email (format)
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+ "[a-zA-Z0-9_+&*-]+)*@" + "(?:[a-zA-Z0-9-]+\\.)+[a-z" + "A-Z]{2,7}$";

        Pattern pat = Pattern.compile(emailRegex);
        boolean emailValidator = pat.matcher(customer.getCustomerEmail()).matches();

        if (!emailValidator)
        {
            model.addAttribute("emailMsg", "Email is not valid");
            return "registerCustomer";
        }

        // Validation for email ann Username (repeatd)
        List<Customer> customerList = customerService.getAllCustomers();

        for(int i = 0; i < customerList.size(); i++)
        {
            if(customer.getCustomerEmail().equals(customerList.get(i).getCustomerEmail()))
            {
                model.addAttribute("emailMsg", "Email already exist");
                return "registerCustomer";
            }

            if(customer.getUsername().equals(customerList.get(i).getUsername()))
            {
                model.addAttribute("usernameMsg", "Username already exist");
                return "registerCustomer";
            }

        }

        if ((customer.getShippingAddress().getCity() == null) || (customer.getShippingAddress().getStreetName() == null) ||
                (customer.getShippingAddress().getZipCode() == null) || (customer.getShippingAddress().getState() == null) ||
                (customer.getShippingAddress().getCountry() == null))
        {
            model.addAttribute("shippingAddressMsg", " The Shipping Address must not be null");
            return "registerCustomerSuccess";
        }

        customer.setEnabled(true);
        customerService.addCustomer(customer);

        return "registerCustomerSuccess";
    }

}
