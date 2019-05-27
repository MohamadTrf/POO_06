<%-- 
    Document   : cadastrarFornecedor
    Created on : 27/05/2019, 14:24:24
    Author     : Mulero
--%>

<%@page import="br.com.fatecpg.model.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String erro = "";
    String msg = "";

    if (request.getParameter("btnCadastro") != null) {
        String nome = request.getParameter("nomeFornecedor");
        String endereco = request.getParameter("enderecoFornecedor");

        try {
            msg = "Fornecedor cadastrado com sucesso";
            Fornecedor.addFornecedor(nome, endereco);
        } catch (Exception ex) {
            erro = ex.getMessage();
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Fornecedor</title>
    </head>
    <!--Nome e Endereço-->
    <body>
        <%if (session.getAttribute("user") == null) {%>
        <h2>Você não está autenticado para acessar este recurso</h2>
        <a href="login.jsp">Clique aqui para Voltar </a> 
        <%} else {%>
        <h1>Cadastro de Fornecedores!</h1>

        <form>
            Nome: <input type="text" name="nomeFornecedor"/>
            Endereço: <input type="text" name="enderecoFornecedor"/>

            <input type="submit" name="btnCadastro" value="Cadastrar"/>

            <h1 style="color: blue"> <%=msg%></h1>
            <h1 style="color: red"> <%=erro%></h1>
        </form>

        <%}%>
    </body>
</html>
