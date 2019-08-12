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
    <h1>Editar dados do usuário</h1> <br/>
    
    <form:form action="update" commandName="users" class="form-horizontal" method="post">    
    
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">Nome</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name" value="${user.name}">
                <font color="red"> <form:errors path="name" cssClass="error"/> </font>
            </div>
        </div>
       
        <div class="form-group">
            <label for="username" class="col-sm-2 control-label">Usuário</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="username" name="username" value="${user.username}">
                <font color="red"> <form:errors path="username" cssClass="error"/> </font>
            </div>
        </div>
        
        <div class="form-group">
            <label for="email" class="col-sm-2 control-label">E-mail</label>
            <div class="col-sm-10">
                <input type="email" class="form-control" id="email" name="email" value="${user.email}">
                <font color="red"> <form:errors path="email" cssClass="error"/> </font>
            </div>
        </div>      
        
        
        <div class="form-group">
            <label for="password" class="col-sm-2 control-label">Senha</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="password" name="password" value="${user.password}">
                <font color="red"> <form:errors path="password" cssClass="error"/> </font>
            </div>
        </div>
        
        <input type="hidden" id="id" name="id" value="${user.id}">
        <input type="hidden" id="role" name="role" value="${user.role}">
        <input type="hidden" id="enabled" name="enabled" value="${user.enabled}">      
        
        <div class="form-group">
            <div class="col-sm-10 col-sm-offset-2">
            	<a class="btn btn-info" href="/blog/app/users">Cancelar</a>
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