<%-- 
    Document   : index
    Created on : 26/05/2019, 22:35:26
    Author     : Mulero
--%>

<%@page import="br.com.fatecpg.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="WEB-INF/jspf/header.jspf" %>
    </head>
    <body>
        <h1>Hello World!</h1>

        <% if (session.getAttribute("user") != null) {

                Usuario user = (Usuario) session.getAttribute("user");

                String acesso = "";
                int nivel = user.getCd_nivel_permissao();
                if (nivel == 1) {
                    acesso = "Gerente";
                } else if (nivel == 2) {
                    acesso = "Supervisor";
                } else if (nivel == 3) {
                    acesso = "Vendedor";
                }
        %>

        <h3>Bem vindo <%=user.getNm_user()%></h3>
        <br>
        <h4>Seu nivel de permissões é de <%=acesso%></h4>
        <h4>Você tem acesso as seguintes funcionalidades: </h4>

        <a href="cliente.jsp">Cadastrar Clientes</a>
        <br>
        <a href="cadastrarProduto.jsp"> Cadastrar Produto </a>
        <br>

        <%if (nivel == 1) {%>
        <a href="cadastrarUsuario.jsp"> Cadastrar Novo Usuário</a>
        <%}%>

        <br>

        <%if (nivel == 1 || nivel == 2) {%>
        <a href="cadastrarFornecedor.jsp">Cadastrar Fornecedor</a>
        <%}%>

        <br>
        <%if (nivel == 2 || nivel == 3) {%>
        <a href="cadastrarPonto.jsp"> Cadastrar Ponto </a>
        <% }%>

        <% }%>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
