<%-- 
Document   : login
Created on : 25/05/2019, 21:44:54
Author     : MohamadTarif
--%>

<%@page import="br.com.fatecpg.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String error = "";

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

        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">Login</h5>
                <h6 class="card-subtitle mb-2 text-muted"><%=error%></h6>

                <form method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtLogin" id="login" placeholder="Usuário"/>
                    </div>

                    <div class="form-group">
                        <input type="password" class="form-control" name="txtPassword" id="pswd" placeholder="Senha"/>
                    </div>

                    <input type="submit" class="btn btn-primary form-control" id="botao" name="logar" value="Entrar"/>
                </form>
            </div>
        </div>


        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
