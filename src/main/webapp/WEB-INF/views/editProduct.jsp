<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/template/header.jsp" %>


<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Edit Product</h1>

            <p class="lead">Please update the product information here:</p>
        </div>

        <form:form action="${pageContext.request.contextPath}/admin/productInventory/editProduct" method="post"
                   commandName="product" enctype="multipart/form-data">
        <form:hidden path="productId" value="${product.productId}" />

        <div class="form-group">
            <label for="name">Name</label>
            <form:input path="productName" id="name" class="form-Control" value="${product.productName}"/>
        </div>

        <div class="form-group">
            <label for="author">Author</label>
            <form:input path="productAuthor" id="author" class="form-Control" value="${product.productAuthor}"/>
        </div>

        <div class="form-group">
            <label for="authorBio">Author's Bio</label>
            <form:textarea path="productAuthorBio" id="authorBio" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="description">Book's Description</label>
            <form:textarea path="productDescription" id="description" class="form-Control" value="${product.productDescription}"/>
        </div>

        <div class="form-group">
            <label for="publisher">Publisher</label>
            <form:input path="productPublisher" id="publisher" class="form-Control" value="${product.productPublisher}"/>
        </div>

        <div class="form-group">
            <label for="category">Category</label>
            <form:textarea path="productCategory" id="category" class="form-Control" value="${product.productCategory}"/>
        </div>

        <div class="form-group">
            <label for="condition">Condition</label>
            <label class="checkbox-inline"><form:radiobutton path="productCondition" id="condition"
                                                             value="new" checked="checked"/>New</label>
            <label class="checkbox-inline"><form:radiobutton path="productCondition" id="condition"
                                                             value="used" />Used</label>
        </div>

        <div class="form-group">
            <label for="status">Status</label>
            <label class="checkbox-inline"><form:radiobutton path="productStatus" id="status"
                                                             value="active" checked="checked"/>Active</label>
            <label class="checkbox-inline"><form:radiobutton path="productStatus" id="status"
                                                             value="inactive" />Inactive</label>
        </div>

        <div class="form-group">
            <label for="topSellerStatus">Top Seller Status</label>
            <label class="checkbox-inline"><form:radiobutton path="topSellerStatus" id="topSellerStatus"
                                                             value="active" checked="checked"/>Active</label>
            <label class="checkbox-inline"><form:radiobutton path="topSellerStatus" id="topSellerStatus"
                                                             value="inactive" />Inactive</label>
        </div>

        <div class="form-group">
            <label for="releaseDate">Release Date (YYYY/MM/DD)</label>
            <form:input path="productReleaseDate" id="releaseDate" class="form-Control" value="${product.productReleaseDate}"/>
        </div>

        <div class="form-group">
            <label for="unitInStock">Unit In Stock</label>
            <form:input path="unitInStock" id="unitInStock" class="form-Control" value="${product.unitInStock}"/>
        </div>

        <div class="form-group">
            <label for="price">Price</label>
            <form:input path="productPrice" id="price" class="form-Control" value="${product.productPrice}"/>
        </div>

        <div class="form-group">
            <label class="control-label" for="productImage">Upload Picture</label>
            <form:input id="productImage" path="productImage" type="file" class="form:input-large" />
        </div>

        <br><br>
        <input type="submit" value="submit" class="btn btn-default">
        <a href="<c:url value="/admin/productInventory" />" class="btn btn-default">Cancel</a>
        </form:form>


        <%@include file="/WEB-INF/views/template/footer.jsp" %>
