<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
                    <img src="https://images.halloweencostumes.com/products/41889/1-1/minecraft-steve-vacuform-mask.jpg" alt="image" style="width:50%; height:300px;" />
                    <p>
                        <a href="<c:url value="/account/editCustomer" />">Edit Profile</a>
                    </p>
                </div>

                <div class="col-md-5">
                    <h2>${customer.customerName}</h2>
                    <p>
                        <strong>Username:</strong>${customer.username}
                    </p>
                    <p>
                        <strong>Phone Number:</strong> ${customer.customerPhone}
                    </p>
                    <p>
                        <strong>Email:</strong> ${customer.customerEmail}
                    </p>
                    <p>
                        <strong>Credit Card Info:</strong>
                        <ul style="list-style-type:none">
                            <li>Credit Card Number: ${customer.creditCard.creditCardNumber}</li>
                            <li>Name on Credit Card: ${customer.creditCard.creditCardName}</li>
                            <li>Expiration Month: ${customer.creditCard.expirationMonth}</li>
                            <li>Expiration Year: ${customer.creditCard.expirationYear}</li>
                        </ul>
                    </p>
                    <p>
                        <strong>Shipping Address:</strong>
                        <ul style="list-style-type:none">
                            <li>Street Name: ${customer.shippingAddress.streetName}</li>
                            <li>Apt: ${customer.shippingAddress.apartmentNumber}</li>
                            <li>City: ${customer.shippingAddress.city}</li>
                            <li>State: ${customer.shippingAddress.state}</li>
                            <li>Zip Code: ${customer.shippingAddress.zipCode}</li>
                        </u>
                    </p>

                </div>

            </div>
        </div>



<%@include file="/WEB-INF/views/template/footer.jsp"%>