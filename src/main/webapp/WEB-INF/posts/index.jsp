<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; UTF-8">
	<title>${titulo}</title>
	
	<c:set var="path" value="${pageContext.request.contextPath}" scope="request" />
	
	<style type="text/css">
		@IMPORT url("${path}/static/bootstrap/css/bootstrap.min.css");
		@IMPORT url("${path}/static/bootstrap/css/bootstrap.theme.css");
	</style>

</head>

<body>

	<jsp:include page="../menu.jsp" />
	
	<section class="container">
		<h1>${titulo}</h1>
		<p><a class="btn btn-primary" href="/blog/app/posts/create">Cadastrar</a></p>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Título</th>
					<th>Autor</th>
					<th>Data</th>
					<th>Ação</th>
				</tr>
			</thead>
			<tbody id="tabela">
				<c:forEach items="${posts}" var="post">
					<tr>
						<td>${post.titulo}</td>
						<td>${post.autor.name}</td>
						<td><fmt:formatDate pattern="dd/MM/yyyy" value="${post.data}"/></td>
						<td>
							<a class="btn btn-info" href="/blog/app/posts/read/${post.id}">Visualizar</a>
							<a class="btn btn-warning" href="/blog/app/posts/update/${post.id}">Editar</a>
							<a class="btn btn-danger" href="/blog/app/posts/delete/${post.id}">Excluir</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</section>
	
	
	
	
	
		
</body>

</html>