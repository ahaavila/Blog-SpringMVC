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
    <h1>${titulo}</h1>  
    
<div class="col-sm-10">
<label for="titulo" class="col-sm-2 control-label">Titulo: </label>
<label for="titulo" class="col-sm-8 control-label">${post.titulo}</label>
</div>

<div class="col-sm-10">
<label for="texto" class="col-sm-2 control-label">Texto: </label>
<label for="texto" class="col-sm-8 control-label">${post.texto}</label>
</div>

<div class="col-sm-10">
<label for="autor" class="col-sm-2 control-label">Autor: </label>
<label for="autor" class="col-sm-8 control-label">${post.autor.name}</label>
</div>

<div class="col-sm-10">
<label for="data" class="col-sm-2 control-label">Data: </label>
<label for="data" class="col-sm-8 control-label"><fmt:formatDate pattern="dd/MM/yyyy" value="${post.data}" /></label>
</div>
<div class="col-sm-10">
<h3><font color="red">Tem certeza que deseja excluir esse usuário?</font></h3>
</div>
<div class="col-sm-10">
<a class="btn btn-info" href="/blog/app/posts">Cancelar</a>
<a class="btn btn-danger" href="/blog/app/posts/delete_confirmed/${post.id}">Excluir</a>
</div>
</section>

<script type="text/javascript" src="${path}/static/js/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="${path}/static/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>