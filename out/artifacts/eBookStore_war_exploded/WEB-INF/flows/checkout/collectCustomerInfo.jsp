<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/template/header.jsp" %>


<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Customer</h1>

            <p class="lead">Customer Details</p>
        </div>

        <form:form commandName="order" class="form-horizaontal">

        <h3>Basic Info</h3>

        <div class="form-group">
            <label for="name">Name</label>
            <form:input path="cart.customer.customerName" id="name" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <form:input path="cart.customer.customerEmail" id="email" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="phone">Phone</label>
            <form:input path="cart.customer.customerPhone" id="phone" class="form-Control"/>
        </div>

        <h3>Credit Card</h3>

        <div class="form-group">
            <label for="creditCardNumber">Credit Card Number</label>
            <form:input path="cart.customer.creditCard.creditCardNumber" id="creditCardNumber" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="creditCardName">Credit Card Name</label>
            <form:input path="cart.customer.creditCard.creditCardName" id="creditCardName" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="expirationMonth">Expiration Month</label>
            <form:input path="cart.customer.creditCard.expirationMonth" id="expirationMonth" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="expirationYear">Expiration Year</label>
            <form:input path="cart.customer.creditCard.expirationYear" id="expirationYear" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="cardVerificationValue">CVV</label>
            <form:input path="cart.customer.creditCard.cardVerificationValue" id="cardVerificationValue" class="form-Control"/>
        </div>

        <input type="hidden" name="_flowExecutionKey" />

        <br><br>
        <input type="submit" value="Next" class="btn btn-default" name="_eventId_customerInfoCollected" />
        <button class="btn btn-default" name="_eventId_cancel">Cancel</button>
        </form:form>


        <%@include file="/WEB-INF/views/template/footer.jsp" %>
