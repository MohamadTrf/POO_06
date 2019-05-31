<%-- 
    Document   : cadastrarFornecedor
    Created on : 27/05/2019, 14:24:24
    Author     : Mulero
--%>

<%@page import="br.com.fatecpg.model.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Fornecedor</title>


        <style>
            .form-group {
                width: 20%;
                margin-top: 2%;
                margin-left: 40%;
            }
            #botao2 {
                margin-left: 40%;
                width: 20%;
            }

        </style>

    </head>
    <!--Nome e Endereço-->
    <body>
        <%if (session.getAttribute("user") == null) {%>
        <h2>Você não está autenticado para acessar este recurso</h2>
        <a href="login.jsp">Clique aqui para Voltar </a> 
        <%} else {%>
        <h1>Fornecedores</h1>
        <%@include file="WEB-INF/jspf/header.jspf" %>

        <form>
            <div class="form-group">
                <input type="text" class="form-control" name="nomeFornecedor" id="nome" placeholder="Nome"/>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="enderecoFornecedor" id="end" placeholder="Endereço"/>
            </div>
            <input type="submit" name="btnCadastro" value="Cadastrar" class="btn btn-primary" id="botao2"/>

            <h1 style="color: blue"> <%=msg%></h1>
            <h1 style="color: red"> <%=erro%></h1>
        </form>
        
         <table border="1">
            <tr>
                <th>Nome</th>
                <th>Endereço</th>
                <th>Deletar</th>
            </tr>
            <%for (Fornecedor f : Fornecedor.getFornecedores()) {%>
            <tr>
                <th><%=f.getNm_fornecedor()%></th>
                <th><%=f.getNm_endereco()%></th>
                <td>
                    <form>
                        <input type="hidden" name="id" value="<%=f.getCd_fornecedor()%>" />
                        <input type="submit" name="deletarUsuario" value="Remover Usuário"/>
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
        
        <%}%>

        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
