<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@include file="/WEB-INF/views/template/header.jsp"%>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Product Details</h1>

            <p class="lead">Here is the detail information of the product!</p>
        </div>

        <div class="container" ng-app = "cartApp">
            <div class="row">
                <div class="col-md-5">
                    <img src="<c:url value="/resources/images/${product.productId}.png" /> " alt="image" style="width:75%"/>
                </div>

                <div class="col-md-5">
                    <h3>${product.productName}</h3>
                    <p>${product.productDescription}</p>
                    <p>
                        <strong>Author</strong> : <a target="_blank" href="https://en.wikipedia.org/wiki/${product.productAuthor}">${product.productAuthor}</a>
                    </p>
                    <p>
                        <strong>Publisher</strong> : ${product.productPublisher}
                    </p>
                    <p>
                        <strong>Category</strong> : ${product.productCategory}
                    </p>
                    <p>
                        <strong>Condition</strong> : ${product.productCondition}
                    </p>
                    <p>
                        <strong>Release Date</strong> : ${product.productReleaseDate}
                    </p>
                    <h4>
                        <strong>Price</strong> : $${product.productPrice}
                    </h4>

                    <br>

                    <c:set var="role" scope="page" value="${param.role}" />
                    <c:set var="url" scope="page" value="/productList/sortedTitle" />
                    <c:if test="${role='admin'}">
                        <c:set var="url" scope="page" value="/admin/productInventory" />
                    </c:if>

                    <p ng-controller="cartCtrl">
                        <a href="<c:url value="${url}" />" class="btn btn-default">Back</a>
                        <a href="#" class="btn btn-warning btn-large"
                           ng-click="addToCart('${product.productId}')"><span
                                class="glyphicon glyphicon-shopping-cart"></span>Order Now</a>
                        <a href="<spring:url value="/customer/cart" />" class="btn btn-default">View Cart</a>
                    </p>

                    <p>
                        <strong>Rating</strong> :
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                    </p>
                    <p>
                        <strong>Comments</strong> : ${product.comment}
                    </p>

                </div>

            </div>
        </div>

        <script src="<c:url value="/resources/js/controller.js" /> "></script>
        <%@include file="/WEB-INF/views/template/footer.jsp"%>