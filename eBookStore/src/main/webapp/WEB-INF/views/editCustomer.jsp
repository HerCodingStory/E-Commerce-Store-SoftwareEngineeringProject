<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/template/header.jsp" %>


<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Edit Customer</h1>

            <p class="lead">Please update the customer information here:</p>
        </div>

        <form:form action="${pageContext.request.contextPath}/account/viewCustomer/editCustomer" method="post"
                   commandName="customer" enctype="multipart/form-data">
            <form:hidden path="customerId" value="${customer.customerId}" />

        <div class="form-group">
            <label for="name">Name</label>
            <form:input path="customerName" id="name" class="form-Control" value="${customer.customerName}"/>
        </div>

        <div class="form-group">
            <label for="phone">Phone Number</label>
            <form:input path="customerPhone" id="phone" class="form-Control" value="${customer.customerPhone}"/>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <form:input path="customerEmail" id="email" class="form-Control" value="${customer.customerEmail}"/>
        </div>

        <div class="form-group">
            <label for="nickname">Nickname</label>
            <form:input path="nickname" id="nickname" class="form-Control" value="${customer.nickname}"/>
        </div>

        <h3>Login Info: </h3>

        <div class="form-group">
            <label for="username">Username(don't change)</label>
            <form:input path="username" id="username" class="form-Control" value="${customer.username}"/>
        </div>

        <div class="form-group">
            <label for="password">Password(don't change)</label>
            <form:input path="password" id="password" class="form-Control" value="${customer.password}"/>
        </div>

        <h3>Account Status: </h3>

        <div class="form-group">
            <label for="status">Status</label>
            <label class="checkbox-inline"><form:radiobutton path="enabled" id="status"
                                                             value="true" checked="checked" />Active</label>
            <label class="checkbox-inline"><form:radiobutton path="enabled" id="status"
                                                             value="false" />Inactive</label>
        </div>

        <h3>Credit Card Info: </h3>

        <div class="form-group">
            <label for="creditCardNumber">Credit Card Number</label>
            <form:input path="creditCard.creditCardNumber" id="creditCardNumber" class="form-Control" value="${customer.creditCard.creditCardNumber}"/>
        </div>

        <div class="form-group">
            <label for="creditCardName">Credit Card Name</label>
            <form:input path="creditCard.creditCardName" id="creditCardName" class="form-Control" value="${customer.creditCard.creditCardName}"/>
        </div>

        <div class="form-group">
            <label for="expirationMonth">Expiration Month</label>
            <form:input path="creditCard.expirationMonth" id="expirationMonth" class="form-Control" value="${customer.creditCard.expirationMonth}"/>
        </div>

        <div class="form-group">
            <label for="expirationYear">Expiration Year</label>
            <form:input path="creditCard.expirationYear" id="expirationYear" class="form-Control" value="${customer.creditCard.expirationYear}"/>
        </div>

        <div class="form-group">
            <label for="cardVerificationValue">CVV</label>
            <form:password path="creditCard.cardVerificationValue" id="cardVerificationValue" class="form-Control" value="${customer.creditCard.cardVerificationValue}"/>
        </div>

        <h3>Shipping Address Info: </h3>

        <div class="form-group">
            <label for="shippingStreet">Street Name</label>
            <form:input path="shippingAddress.streetName" id="shippingStreet" class="form-Control" value="${customer.shippingAddress.streetName}"/>
        </div>

        <div class="form-group">
            <label for="shippingApartmentNumber">Apartment Number</label>
            <form:input path="shippingAddress.apartmentNumber" id="shippingApartmentNumber" class="form-Control" value="${customer.shippingAddress.apartmentNumber}"/>
        </div>

        <div class="form-group">
            <label for="shippingCity">City</label>
            <form:input path="shippingAddress.city" id="shippingCity" class="form-Control" value="${customer.shippingAddress.city}"/>
        </div>

        <div class="form-group">
            <label for="shippingState">State</label>
            <form:input path="shippingAddress.state" id="shippingState" class="form-Control" value="${customer.shippingAddress.state}"/>
        </div>

        <div class="form-group">
            <label for="shippingCountry">Country</label>
            <form:input path="shippingAddress.country" id="shippingCountry" class="form-Control" value="${customer.shippingAddress.country}"/>
        </div>

        <div class="form-group">
            <label for="shippingZip">Zipcode</label>
            <form:input path="shippingAddress.zipCode" id="shippingZip" class="form-Control" value="${customer.shippingAddress.zipCode}"/>
        </div>

        <br><br>
        <input type="submit" value="submit" class="btn btn-default">
        <a href="<c:url value="/account/viewCustomer/" />" class="btn btn-default">Cancel</a>
        </form:form>


        <%@include file="/WEB-INF/views/template/footer.jsp" %>
