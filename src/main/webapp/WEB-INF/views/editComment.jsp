<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/template/header.jsp" %>


<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Edit Comment</h1>

            <p class="lead">Please update the comment information here:</p>
        </div>

        <form:form action="${pageContext.request.contextPath}/productList/viewProduct/editComment" method="post"
                   commandName="comment">
        <form:hidden path="commentId" value="${comment.commentId}" />

        <div class="form-group">
            <label for="title">Title</label>
            <form:input path="commentTitle" id="title" class="form-Control" value="${comment.commentTitle}" maxlength="20"/>
        </div>

        <div class="form-group">
            <label for="nickname">Nickname</label>
            <form:input path="nickname" id="nickname" class="form-Control" value="${comment.nickname} maxlength="10""/>
        </div>

        <div class="form-group">
            <label for="content">Comment Content</label>
            <form:textarea path="comment" id="content" class="form-Control" value="${comment.comment}" maxlength="250"/>
        </div>

        <br><br>
        <input type="submit" value="submit" class="btn btn-default">
        <a href="<spring:url value="/productList/viewProduct" />" class="btn btn-default">Cancel</a>
        </form:form>


        <%@include file="/WEB-INF/views/template/footer.jsp" %>
