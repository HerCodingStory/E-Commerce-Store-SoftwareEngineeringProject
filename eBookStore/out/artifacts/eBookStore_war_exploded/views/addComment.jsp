<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/template/header.jsp" %>


<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Add Comment</h1>

            <p class="lead">Fill the below information to add a comment:</p>
        </div>

        <form:form action="${pageContext.request.contextPath}/productList/viewProduct/addComment" method="post"
                   commandName="comment">

            <div class="form-group">
                <label for="title">Comment Title</label> <form:errors path="commentTitle" cssStyle="color: #ff0000;" />
                <form:input path="commentTitle" id="title" class="form-Control"/>
            </div>

            <div class="form-group">
                <label for="username">Username</label> <form:errors path="username" cssStyle="color: #ff0000;" />
                <form:input path="username" id="username" class="form-Control"/>
            </div>

            <div class="form-group">
                <label for="content">Comment Content</label>
                <form:textarea path="comment" id="content" class="form-Control"/>
            </div>

        <br><br>
        <input type="submit" value="submit" class="btn btn-default">
        <a href="<c:url value="/productList/sortedTitle" />" class="btn btn-default">Cancel</a>
        </form:form>


        <%@include file="/WEB-INF/views/template/footer.jsp" %>
