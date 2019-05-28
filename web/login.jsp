<%-- 
Document   : login
Created on : 25/05/2019, 21:44:54
Author     : MohamadTarif
--%>

<%@page import="br.com.fatecpg.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/footer.jspf" %>


        <form method="post">
            <input type="text" class="form-control" name="login" id="login" placeholder="Usuário"/>
            <input type="password" class="form-control" name="password" id="pswd" placeholder="Senha"/>
            <input type="submit" class="btn btn-primary form-control" id="botao" name="logar" value="Entrar"/>
        </form>
    </body>
</html>
