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
	<c:forEach items="${posts}" var="post">
    <div class="col-sm-8">
    <h1><a href="/blog/app/posts/read/${post.id}">${post.titulo}</a></h1> 
    <p>${post.texto} </p>     
    <p>${post.autor.name} - <fmt:formatDate pattern="dd/MM/yyyy" value="${post.data}" /></p>
	</div>
	</c:forEach>  
	</section>

	<script type="text/javascript" src="${path}/static/js/jquery-2.2.4.min.js"></script>
	<script type="text/javascript" src="${path}/static/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>