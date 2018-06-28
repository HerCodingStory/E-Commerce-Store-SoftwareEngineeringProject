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

// This controller handles the registration of the customers
@Controller
public class RegisterController
{
    // customerService accesses the database of customers
    @Autowired
    private CustomerService customerService;

    // This method creates a customer
    @RequestMapping("/register")
    public String registerCustomer(Model model)
    {
        // create a customer
        Customer customer = new Customer();

        // create a shipping address
        ShippingAddress shippingAddress = new ShippingAddress();

        // creates a credit card
        CreditCard creditCard = new CreditCard();

        // give the address and credit cardinfo to that customer
        customer.setShippingAddress(shippingAddress);
        customer.setCreditCard(creditCard);

        // adds customer to model
        model.addAttribute("customer", customer);

        // view registration page
        return "registerCustomer";
    }

    // This method validates the information the user entered and if everything is good, it registers the customer.
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerCustomerPost(@Valid @ModelAttribute("customer") Customer customer, BindingResult result, Model model)
    {
        // If any error happens, refresh register page
        if (result.hasErrors())
        {
            return "registerCustomer";
        }

        // Validation for Password (standard format)
        // Password must have at least one upper case, one lower case, a symbol, numbers, and be longer than 8 of length
        boolean hasUpperCase = !(customer.getPassword()).equals(customer.getPassword().toLowerCase());
        boolean hasLowerCase = !(customer.getPassword()).equals(customer.getPassword().toLowerCase());
        boolean hasSpecial   = !(customer.getPassword()).matches("[A-Za-z0-9 ]*");

        // If it doesn't follow rules, then refresh register page
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
        // Email mush  follow regular email format: blabla@blabla.com
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+ "[a-zA-Z0-9_+&*-]+)*@" + "(?:[a-zA-Z0-9-]+\\.)+[a-z" + "A-Z]{2,7}$";

        Pattern pat = Pattern.compile(emailRegex);
        boolean emailValidator = pat.matcher(customer.getCustomerEmail()).matches();

        // If it doesn't follow format, then refresh register page
        if (!emailValidator)
        {
            model.addAttribute("emailMsg", "Email is not valid");
            return "registerCustomer";
        }

        // Validation for Email and Username (Checking for Equals)
        // Create a list of all customers from the database
        List<Customer> customerList = customerService.getAllCustomers();

        // Loop through all of them
        for(int i = 0; i < customerList.size(); i++)
        {
            // If email exist in database, display error message
            if(customer.getCustomerEmail().equals(customerList.get(i).getCustomerEmail()))
            {
                model.addAttribute("emailMsg", "Email already exist");
                return "registerCustomer";
            }

            // If username exist in database, display error message
            if(customer.getUsername().equals(customerList.get(i).getUsername()))
            {
                model.addAttribute("usernameMsg", "Username already exist");
                return "registerCustomer";
            }

        }

        // Doesn't work
        // Validation for shipping address (Checking for NULL)
        /*if ((customer.getShippingAddress().getCity() == null) || (customer.getShippingAddress().getStreetName() == null) ||
                (customer.getShippingAddress().getZipCode() == null) || (customer.getShippingAddress().getState() == null) ||
                (customer.getShippingAddress().getCountry() == null))
        {
            model.addAttribute("shippingAddressMsg", " The Shipping Address must not be null");
            return "registerCustomerSuccess";
        }*/

        // If validations are good, then proceed to enable user
        customer.setEnabled(true);
        // Add the customer to the database
        customerService.addCustomer(customer);

        // View success registration page
        return "registerCustomerSuccess";
    }

}
