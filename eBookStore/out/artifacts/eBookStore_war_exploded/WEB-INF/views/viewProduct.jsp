<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@include file="/WEB-INF/views/template/header.jsp"%>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Product Details</h1>

            <p class="lead">Here is the detail information of the product!</p>
        </div>

        <div class="container">
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
                        <strong>Price</strong> : ${product.productPrice}
                    </p>
                    <p>
                        <strong>Release Date</strong> : ${product.productReleaseDate}
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



<%@include file="/WEB-INF/views/template/footer.jsp"%>