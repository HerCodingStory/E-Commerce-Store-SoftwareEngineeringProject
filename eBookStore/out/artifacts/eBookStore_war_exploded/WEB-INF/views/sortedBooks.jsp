<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@include file="/WEB-INF/views/template/header.jsp"%>

<script>
    $(document).ready(function(){
        var searchCondition = '${searchCondition}';

        $('.table').DataTable({
            "lengthMenu": [[5,10,20,-1], [5,10,20, "All"]],
            "oSearch": {"sSearch": searchCondition}
        });
    });

</script>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>All Products</h1>

            <p class="lead">This is what we have:</p>
        </div>

        <table class="table table-striped table-hover">
            <thead>
                <tr class="bg-success">
                    <th>Photo Thumb</th>
                    <th>Product Name</th>
                    <th>Author's Name</th>
                    <th>Genre</th>
                    <th>Release Date</th>
                    <th>Rating</th>
                    <th>Price</th>
                    <th>Top Seller Status<th>
                </tr>
            </thead>
            <c:forEach items="${products}" var="product">
                <tr>
                    <td><img src="<c:url value="/resources/images/${product.productId}.png" /> " alt="image" style="width:100%"/></td>
                    <td>${product.productName}</td>
                    <td>${product.productAuthor}</td>
                    <td>${product.productCategory}</td>
                    <td>${product.productReleaseDate}</td>
                    <td></td>
                    <td>${product.productPrice} USD</td>
                    <td>${product.topSellerStatus}</td>
                    <td><a href="<spring:url value="/productList/viewProduct/${product.productId}" />"
                    ><span class="glyphicon glyphicon-info-sign"></span></a></td>
                </tr>
            </c:forEach>
        </table>

<%@include file="/WEB-INF/views/template/footer.jsp"%>