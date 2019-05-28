<%-- 
Document   : login
Created on : 25/05/2019, 21:44:54
Author     : MohamadTarif
--%>

<style>
    #login {
        width: 20%;
        margin-left: 40%;
        margin-top: 10%;
    }

    #pswd {
        width: 20%;
        margin-left: 40%;
        margin-top: 0.5%;

    }

    #botao {
        width: 20%;
        margin-left: 40%;
        margin-bottom: -3%;
    }
</style>


<%@page import="br.com.fatecpg.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String error = null;

    if (request.getParameter("logar") != null) {
        String login = request.getParameter("txtLogin");
        String password = request.getParameter("txtPassword");

        Usuario u = Usuario.getUser(login, password);

        if (u == null) {
            error = "Usuário/senha invalidos!!!";
        } else {
            session.setAttribute("user", u);
            response.sendRedirect("home.jsp");
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>

        <form method="post">
            <div class="form-group">
                <input type="text" class="form-control" name="txtLogin" id="login" placeholder="Usuário"/>
            </div>

            <div class="form-group">
                <input type="password" class="form-control" name="txtPassword" id="pswd" placeholder="Senha"/>
            </div>

            <input type="submit" class="btn btn-primary form-control" id="botao" name="logar" value="Entrar"/>
        </form>

        <%@include file="WEB-INF/jspf/footer.jspf" %>

    </body>
</html>
