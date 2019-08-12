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

<div class="container">
	<h1>${titulo}</h1><br/>
	
	<form:form action="create" commandName="posts" class="form-horizontal" method="post">
	
		<div class="form-group">
			<label for="titulo" class="col-sm-2 control-label">Título</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="titulo" name="titulo" value="${post.titulo}">
				<font color="red"> <form:errors path="titulo" cssClass="error" /></font>
			</div>
		</div>
		
		<div class="form-group">
			<label for="texto" class="col-sm-2 control-label">Texto</label>
			<div class="col-sm-10">
				<textarea id="texto" name="texto" class="form-control" rows="3">${post.texto}</textarea>
				<font color="red"> <form:errors path="texto" cssClass="error" /></font>
			</div>
		</div>
		
		<div class="form-group">
			<label for="data" class="col-sm-2 control-label">Data</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="data" name="data">
				<font color="red"> <form:errors path="data" cssClass="error" /></font>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-10 col-sm-offset-2">
				<a class="btn btn-info" href="/blog/app/posts">Cancelar</a>
				<button type="submit" class="btn btn-primary">Salvar</button>
			</div>
		</div>
		<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}">
	</form:form>
</div>

<script type="text/javascript" src="${path}/static/js/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="${path}/static/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>