<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@include file="/WEB-INF/views/template/header.jsp"%>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Account Details</h1>

            <p class="lead">Here is your information!</p>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <c:if test="${customer.customerImage == null}">
                        <img src="<c:url value="/resources/images/avatar.png" /> " alt="image" style="width:75%"/>
                    </c:if>
                    <c:if test="${customer.customerImage != null}">
                        <img src="<c:url value="/resources/images/${customer.customerId}.png" /> " alt="image" style="width:75%"/>
                    </c:if>
                </div>

                <div class="col-md-5">
                    <h2>${customer.customerName} <a href="<spring:url value="/account/viewCustomer/editCustomer/${customer.customerId}" />"
                    ><span class="glyphicon glyphicon-pencil"></span></a></h2>
                    <p>
                        <strong>Username:</strong> ${customer.username}
                    </p>
                    <p>
                        <strong>Password:</strong> ${customer.password}
                    </p>
                    <p>
                        <strong>Phone Number:</strong> ${customer.customerPhone}
                    </p>
                    <p>
                        <strong>Email:</strong> ${customer.customerEmail}
                    </p>
                    <p>
                        <strong>Profile Status: </strong><c:if test="${customer.enabled == false}">Deactivate</c:if><c:if test="${customer.enabled == true}">Active</c:if>
                    </p>

                    <p>
                        <strong>Credit Card Info:</strong>
                        <ul style="list-style-type:none">
                            <li>Credit Card Number: ${customer.creditCard.creditCardNumber}</li>
                            <li>Name on Credit Card: ${customer.creditCard.creditCardName}</li>
                            <li>Expiration Month: ${customer.creditCard.expirationMonth}</li>
                            <li>Expiration Year: ${customer.creditCard.expirationYear}</li>
                            <li>CVV: ${customer.creditCard.cardVerificationValue}</li>
                        </ul>
                    </p>
                    <p>
                        <strong>Shipping Address:</strong>
                        <ul style="list-style-type:none">
                            <li>Street Name: ${customer.shippingAddress.streetName}</li>
                            <li>Apt: ${customer.shippingAddress.apartmentNumber}</li>
                            <li>City: ${customer.shippingAddress.city}</li>
                            <li>State: ${customer.shippingAddress.state}</li>
                            <li>Country: ${customer.shippingAddress.country}</li>
                            <li>Zip Code: ${customer.shippingAddress.zipCode}</li>
                        </ul>
                    </p>

                </div>

            </div>
        </div>



<%@include file="/WEB-INF/views/template/footer.jsp"%>