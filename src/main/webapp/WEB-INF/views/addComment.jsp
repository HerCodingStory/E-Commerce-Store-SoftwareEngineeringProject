<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/template/header.jsp" %>


<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Add Comment</h1>

            <p class="lead">Fill the below information to add a comment:</p>
        </div>

        <form:form action="${pageContext.request.contextPath}/productList/viewProduct/addComment/${comment.product.productId}" method="post"
                   commandName="comment">

        <div class="form-group">
            <label for="title">Comment Title</label> <form:errors path="commentTitle" cssStyle="color: #ff0000;" />
            <form:input path="commentTitle" id="title" class="form-Control" maxlength="20"/>
        </div>


        <div class="form-group">
            <label for="nickname">Nickname</label>
            <br>
            <input id="disable" type="checkbox" onclick="document.getElementById('nickname').disabled=this.checked; document.getElementById('nickname').value='Anonymous';" > Check to leave Anonymous
            <form:input path="nickname" id="nickname" class="form-Control" value="${comment.nickname}" maxlength="10"/>
        </div>

        <div class="form-group">
            <label for="rating">Rating</label>
            <form:input path="rating" id="rating" type="number" min="0" max="5" class="form-Control" value="${comment.rating}" style="width: 100px" />
        </div>

        <div class="form-group">
            <label for="content">Comment Content (250 characters max)</label>
            <form:textarea path="comment" id="content" class="form-Control" maxlength="250"/>
        </div>

        <br><br>
        <input type="submit" value="submit" class="btn btn-default">
        <a href="<c:url value="/productList/sortedTitle" />" class="btn btn-default">Cancel</a>
        </form:form>


<%@include file="/WEB-INF/views/template/footer.jsp" %>