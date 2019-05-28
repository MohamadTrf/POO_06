<%-- 
    Document   : cadastrarFornecedor
    Created on : 27/05/2019, 14:24:24
    Author     : Mulero
--%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<%@page import="br.com.fatecpg.model.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
        <h1>Fornecedores</h1>

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
     
        <%}%>
    </body>
</html>
