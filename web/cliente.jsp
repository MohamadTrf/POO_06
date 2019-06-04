<%-- 
    Document   : cadastrarCliente
    Created on : 26/05/2019, 21:21:47
    Author     : MohamadTarif
--%>

<%@page import="br.com.fatecpg.model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
    .form-group {
        width: 20%;
        margin-top: 2%;
        margin-left: 40%;
    }
    end {

    }
    cpf {

    }
    #botao1 {
        margin-left: 40%;
        width: 20%;

    }
</style>


<%
    String erro = "";
    String msg = "";

    if (request.getParameter("cadastrarCliente") != null) {
        String nome = request.getParameter("nomeCliente");
        String endereco = request.getParameter("enderecoCliente");
        String cpf = request.getParameter("cpfCliente");
        String email = request.getParameter("emailCliente");

        try {
            msg = "Cliente cadastrado com sucesso";
            Cliente.addCliente(nome, endereco, cpf, email);
        } catch (Exception ex) {
            erro = ex.getMessage();
        }

    }
    if (request.getParameter("deleteCliente") != null) {
        try {
            erro = "";
            msg = "Cliente deletado com sucesso";
            int id = Integer.parseInt(request.getParameter("id"));
            Cliente.deleteCliente(id);
        } catch (Exception ex) {
            msg = "";
            erro = ex.getMessage();
        }

    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Clientes</title>
        <%@include file="WEB-INF/jspf/header.jspf" %>
    </head>

    <body>

        <form>
            <div class="form-group">
                <input type="text" class="form-control" name="nomeCliente" id="nome" placeholder="Nome"/>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="enderecoCliente" id="end" placeholder="Endereço"/>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="cpfCliente" id="cpf" placeholder="CPF"/>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="emailCliente" id="email" placeholder="Endereço"/>
            </div>
            <input type="submit" name="cadastrarCliente" value="Cadastrar Cliente" class="btn btn-primary" id="botao1"/>

            <h1 style="color: blue"> <%=msg%></h1>
            <h1 style="color: red"> <%=erro%></h1>
        </form>
    
     <table class="table table-bordered">
  <thead>
    <tr>
      <th scope="col">Nome  </th>
      <th scope="col">Endereço</th>
      <th scope="col">Email</th>
      <th scope="col">CPF</th>
      <th scope="col">Deletar</th>
    </tr>
  </thead>
            <% for (Cliente c : Cliente.getClientes()) {%>
            <tr>
                <td><%=c.getNm_cliente()%></td>
                <td><%=c.getNm_endereco()%></td>
                <td><%=c.getCd_cpf()%></td>
                <td><%=c.getNm_email()%></td>
                <td>
                    <form>
                        <input type="hidden" name="id" value="<%=c.getCd_cliente()%>" />
                        <input type="submit" class="btn btn-primary" name="deleteCliente" value="Deletar"/>
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
 <a href="home.jsp">VOLTAR</a>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>

</html>
