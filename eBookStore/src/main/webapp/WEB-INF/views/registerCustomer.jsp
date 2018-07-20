<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/template/header.jsp" %>


<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Register Customer</h1>

            <p class="lead">Please fill in your information below:</p>
        </div>

        <form:form action="${pageContext.request.contextPath}/register" method="post"
                   commandName="customer" >

        <h3>Basic Info</h3>

        <div class="form-group">
            <label for="name">Name</label>
            <form:errors path="customerName" cssStyle="color: #ff0000" />
            <form:input path="customerName" id="name" maxlength="20" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="email">Email</label><span style="color: #ff0000">${emailMsg}</span>
            <form:errors path="customerEmail" cssStyle="color: #ff0000" />
            <form:input path="customerEmail" id="email" maxlength="20" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="phone">Phone</label>
            <form:input path="customerPhone" id="phone" maxlength="15" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="nickname">Nickname</label>
            <form:input path="nickname" id="nickname" maxlength="10" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="username">Username</label><span style="color: #ff0000">${usernameMsg}</span>
            <form:errors path="username" cssStyle="color: #ff0000"/>
            <form:input path="username" id="username" maxlength="10" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="password">Password</label><span style="color: #ff0000">${passwordMsg}</span>
            <form:errors path="password" cssStyle="color: #ff0000" />
            <form:password path="password" id="password" maxlength="16" class="form-Control"/>
        </div>

        <h3>Shipping Address</h3>

        <div class="form-group">
            <label for="shippingStreet">Street Name</label><span style="color: #ff0000">${shippingAddressMsg}</span>
            <form:errors path="shippingAddress.streetName" cssStyle="color: #ff0000" />
            <form:input path="shippingAddress.streetName" id="shippingStreet" maxlength="20" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="shippingApartmentNumber">Apartment Number</label>
            <form:input path="shippingAddress.apartmentNumber" id="shippingApartmentNumber" maxlength="5" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="shippingCity">City</label><span style="color: #ff0000">${shippingAddressMsg}</span>
            <form:errors path="shippingAddress.city" cssStyle="color: #ff0000" />
            <form:input path="shippingAddress.city" id="shippingCity" maxlength="10" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="shippingState">State</label><span style="color: #ff0000">${shippingAddressMsg}</span>
            <form:errors path="shippingAddress.state" cssStyle="color: #ff0000" />
            <form:input path="shippingAddress.state" id="shippingState" maxlength="10" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="shippingCountry">Country</label><span style="color: #ff0000">${shippingAddressMsg}</span>
            <form:errors path="shippingAddress.country" cssStyle="color: #ff0000" />
            <form:input path="shippingAddress.country" id="shippingCountry" maxlength="10" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="shippingZip">Zipcode</label><span style="color: #ff0000">${shippingAddressMsg}</span>
            <form:errors path="shippingAddress.zipCode" cssStyle="color: #ff0000" />
            <form:input path="shippingAddress.zipCode" id="shippingZip" maxlength="5" class="form-Control"/>
        </div>

        <h3>Credit Card Info</h3>

        <div class="form-group">
            <label for="creditCardNumber">Credit Card Number</label>
            <form:errors path="creditCard.creditCardNumber" cssStyle="color: #ff0000" />
            <form:input path="creditCard.creditCardNumber" id="creditCardNumber" maxlength="16" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="creditCardName">Name on the Credit Card</label>
            <form:errors path="creditCard.creditCardName" cssStyle="color: #ff0000" />
            <form:input path="creditCard.creditCardName" id="creditCardName" maxlength="20" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="expirationMonth">Expiration Month (MM)</label>
            <form:errors path="creditCard.expirationMonth" cssStyle="color: #ff0000" />
            <form:input path="creditCard.expirationMonth" id="expirationMonth" maxlength="2" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="expirationYear">Expiration Year (YYYY)</label>
            <form:errors path="creditCard.expirationYear" cssStyle="color: #ff0000" />
            <form:input path="creditCard.expirationYear" id="expirationYear" maxlength="4" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="cardVerificationValue">CVV</label>
            <form:errors path="creditCard.cardVerificationValue" cssStyle="color: #ff0000" />
            <form:password path="creditCard.cardVerificationValue" id="cardVerificationValue" maxlength="3" class="form-Control"/>
        </div>

        <br><br>
        <input type="submit" value="submit" class="btn btn-default">
        <a href="<c:url value="/" />" class="btn btn-default">Cancel</a>
        </form:form>


        <%@include file="/WEB-INF/views/template/footer.jsp" %>
