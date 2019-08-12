<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Blog - PUC Minas</title>
		<c:set var="path" value="${pageContext.request.contextPath}" scope="request" />
		<style type="text/css">
			@IMPORT url("${path}/static/bootstrap/css/bootstrap.min.css");
			@IMPORT url("${path}/static/bootstrap/css/bootstrap-theme.css");		
		</style>
	</head>
<body>
<div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <section id="login" class="panel panel-primary">
            
            <div class="panel-heading">
            	<div class="panel-title">Blog - PUC Minas</div>
            </div>   
            
            <c:if test='${not empty param["error"]}'>
				<div class="alert alert-warning">
				Usuario e/ou senha incorretos! 
				</div>
			</c:if>						
			<c:if test='${not empty param["logout"]}'>
				<div class="alert alert-info">
				Você saiu da aplicação! 
				</div>
			</c:if> 
            
			<div style="padding-top:30px" class="panel-body" >
            	<div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div> 
            		<form action="${path}/autenticar" method="post">                           
                                    
                   		<div style="margin-bottom: 25px" class="input-group">
                        	<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input id="username" type="text" class="form-control" name="username" value="" placeholder="Usuário">                                        
                        </div>
                                
                        <div style="margin-bottom: 25px" class="input-group">
                        	<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input id="password" type="password" class="form-control" name="password" placeholder="Senha">
                        </div>

                        <div style="margin-top:10px" class="form-group">
                        	<div class="col-sm-12 controls">
                            	 <button id="btn-login"class="btn btn-success">Entrar</button>
                            </div>
                        </div> 
                        <input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}">
           			</form>    
            </div>                     
     		</section>
        </div>        
    </div>
</body>
</html>