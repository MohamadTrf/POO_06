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
       
 <% Usuario user = (Usuario) session.getAttribute("user");%> 
  <h3>Bem vindo <%=user.getNm_user()%></h3>
 <a href="cadastrarCliente.jsp">Cadastrar Clientes</a>
<br>
<a href="cadastrarProduto.jsp"> Cadastrar Produto </a>
<br>
<%if (user.getNm_cargo().equals("Gerente")) {%>
<a href="gerente/cadastrarUsuario.jsp"> Cadastrar Novo Usuário</a>
<%}%>

<%if (user.getNm_cargo().equals("Supervisor") || user.getNm_cargo().equals("Gerente")){%>
<a href="fornecedor/cadastrarFornecedor.jsp">Cadastrar Fornecedor</a>
<%}%>

<%if (user.getNm_cargo().equals("Supervisor") || user.getNm_cargo().equals("Vendedor")) {%>
<a href="supervisor/vendedor/cadastrarPonto.jsp"> Cadastrar Ponto </a>
<%}%>

        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
