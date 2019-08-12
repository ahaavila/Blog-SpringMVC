<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${titulo}</title>

<c:set var="path" value="${pageContext.request.contextPath}" scope="request" />

<style type="text/css">
@IMPORT url("${path}/static/bootstrap/css/bootstrap.min.css");
@IMPORT url("${path}/static/bootstrap/css/bootstrap-theme.css");
</style>

</head>

<body>

<jsp:include page="../menu.jsp" />


<section class="container">

<div class="col-sm-8">
<h1>${post.titulo}</h1> 
<p>${post.texto}</p> 
<p><strong>${post.autor.name}</strong> - <fmt:formatDate pattern="dd/MM/yyyy" value="${post.data}" /></p> 

</div>

<div class="col-sm-8">
<h4 class=page-header >Comentários</h4>

	<c:forEach items="${comments}" var="comment">
    <div class="col-sm-8">
    
    <p><fmt:formatDate pattern="dd/MM/yyyy" value="${comment.data}" /></p>
    <p>${comment.texto} </p>
    
    
    
    <a href="/blog/app/posts/thumbsUp/${comment.id}"><img src="${path}/static/img/like.png"/></a>
    <font color="blue">${comment.thumbsUp}</font>

    <a href="/blog/app/posts/thumbsDown/${comment.id}"><img src="${path}/static/img/unlike.png" /></a>
    <font color="red">${comment.thumbsDown}</font>
      
    <sec:authorize access="hasRole('ROLE_ADMIN')">
    <a class="btn btn-danger" href="/blog/app/posts/delete_comment/${comment.id}">Excluir</a>
    </sec:authorize>
    
	</div>
	</c:forEach>  
</div>


<div class="col-sm-8">
<h4 class=page-header ></h4>

<form:form action="read" commandName="posts" class="form-horizontal" method="post">    
    
<div class="form-group">
	<div class="col-sm-6">
	<input type="text" class="form-control" id="texto" name="texto" placeholder="Escreva seu comentário...">
	</div>
	<div class="col-sm-2">
	<button type="submit" class="btn btn-primary">Enviar</button>
	</div>
</div>
<input type="hidden" id="idPost" name="idPost" value="${post.id}">
<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}">

</form:form>


</div>

</section>


<script type="text/javascript" src="${path}/static/js/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="${path}/static/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>