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
    <p><a class="btn btn-primary" href="/blog/app/users/create">Cadastrar</a></p>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Nome</th>
            <th>Usuário</th>
            <th>E-mail</th>
            <th>Ação</th>
        </tr>
        </thead>
        <tbody id="tabela">
            <c:forEach items="${users}" var="user">
					<tr>
						<td>${user.name}</td>
						<td>${user.username}</td>
						<td>${user.email}</td>
						<td>
						<a class="btn btn-info" href="/blog/app/users/read/${user.id}">Visualizar</a>
						<a class="btn btn-warning" href="/blog/app/users/update/${user.id}">Editar</a>
						<a class="btn btn-danger" href="/blog/app/users/delete/${user.id}">Excluir</a></td>
					</tr>
			</c:forEach>   
        </tbody>
    </table>		
	</section>

	<script type="text/javascript" src="${path}/static/js/jquery-2.2.4.min.js"></script>
	<script type="text/javascript" src="${path}/static/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>