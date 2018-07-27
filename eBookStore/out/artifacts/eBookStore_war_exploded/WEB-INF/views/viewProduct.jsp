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
                        <strong>Author</strong> : <a href="<spring:url value="/productList/viewOtherBooks/${product.productId}" />" data-toggle="tooltip" title="${product.productAuthorBio}">${product.productAuthor}</a>
                        <a target="_blank" href="https://en.wikipedia.org/wiki/${product.productAuthor}"><span class="glyphicon glyphicon-globe"></span></a>
                    </p>
                    <p>
                        <strong>Publisher</strong> : ${product.productPublisher}
                    </p>
                    <p>
                        <strong>Genre</strong> : ${product.productCategory}
                    </p>
                    <p>
                        <strong>Condition</strong> : ${product.productCondition}
                    </p>
                    <p>
                        <strong>Status</strong> : ${product.productStatus}
                    </p>
                    <p>
                        <strong>Top Seller Status</strong> : ${product.topSellerStatus}
                    </p>
                    <p>
                        <strong>Release Date</strong> : ${product.productReleaseDate}
                    </p>
                    <p>
                        <strong>Unit in Stock</strong> : ${product.unitInStock}
                    </p>
                    <h4>
                        <strong>Price</strong> : $${product.productPrice}
                    </h4>

                    <br>

                    <c:set var="role" scope="page" value="${param.role}" />
                    <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
                        <c:set var="url" scope="page" value="/admin/productInventory" />
                    </c:if>
                    <c:if test="${pageContext.request.userPrincipal.name != 'admin'}">
                        <c:set var="url" scope="page" value="/productList/sortedTitle" />
                    </c:if>

                    <p ng-controller="cartCtrl">
                        <a href="<c:url value="${url}" />" class="btn btn-default">Back</a>

                        <c:if test="${(pageContext.request.userPrincipal.name != null) && (pageContext.request.userPrincipal.name != 'admin')}">
                            <a href="#" class="btn btn-warning btn-large"
                               ng-click="addToCart('${product.productId}')"><span
                                    class="glyphicon glyphicon-shopping-cart"></span>Order Now</a>
                            <a href="<spring:url value="/customer/cart" />" class="btn btn-default">View Cart</a>
                        </c:if>
                        <c:if test="${pageContext.request.userPrincipal.name == null}">
                            <a href="<c:url value="/login" />" class="btn btn-warning btn-large">Login to Buy</a>
                        </c:if>
                    </p>

                    <p>
                        <form id="form" commmandName="interceptedPath" method="post">
                            <strong>Rating</strong> :
                            <input type="radio" name="rating" value="1" />
                            <input type="radio" name="rating" value="2" />
                            <input type="radio" name="rating" value="3" />
                            <input type="radio" name="rating" value="4" />
                            <input type="radio" name="rating" value="5" />
                        </form>
                    </p>
                    <p>
                        <strong>Comments</strong> :
                    </p>

                </div>

                <table class="table table-striped table-hover">
                    <thead>
                    <tr class="bg-success">
                        <th>Date</th>
                        <th>Username</th>
                        <th>Title</th>
                        <th>Content</th>
                        <th></th>
                    </tr>
                    </thead>
                    <c:forEach items="${product.comment}" var="comment">
                        <tr>
                            <td>${comment.time}</td>
                            <td>${comment.username}</td>
                            <td>${comment.commentTitle}</td>
                            <td>${comment.comment}</td>
                            <td><a href="<spring:url value="/productList/viewProduct/${product.productId}" />"
                            ><span class="glyphicon glyphicon-info-sign"></span></a>
                                <a href="<spring:url value="/productList/viewProduct/deleteComment/${product.productId}" />"
                                ><span class="glyphicon glyphicon-remove"></span></a>
                                <a href="<spring:url value="/productList/viewProduct/editComment/${product.productId}" />"
                                ><span class="glyphicon glyphicon-pencil"></span></a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <a href="<spring:url value="/productList/viewProduct/addComment/${product.productId}" />" class="btn btn-primary">Add Comment</a>


            </div>
        </div>

        <script>
            $(document).ready(function(){
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>

        <script src="<c:url value="/resources/js/controller.js" /> "></script>
        <%@include file="/WEB-INF/views/template/footer.jsp"%>