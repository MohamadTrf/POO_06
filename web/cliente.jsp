<%-- 
    Document   : cadastrarCliente
    Created on : 26/05/2019, 21:21:47
    Author     : MohamadTarif
--%>

<%@page import="br.com.fatecpg.model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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

        <style>
            .line-vertical{ 
                border-left: 5px solid #007bff;
            }
        </style>
    </head>

    <body>

        <div class="container">

            <div class="row">

                <div class="col-md-6">
                    <form>
                        <div class="form-group full" style="margin-top: 10px;">
                            <input type="text" class="form-control" name="nomeCliente" placeholder="Nome"/>
                        </div>
                        <div class="form-group full">
                            <input type="text" class="form-control" name="enderecoCliente" placeholder="Endereço"/>
                        </div>
                        <div class="form-group full">
                            <input type="text" class="form-control" name="cpfCliente" placeholder="CPF"/>
                        </div>
                        <div class="form-group full">
                            <input type="text" class="form-control" name="emailCliente" placeholder="Endereço"/>
                        </div>

                        <input type="submit" name="cadastrarCliente" value="Cadastrar Cliente" class="btn btn-primary"/>

                        <h1 style="color: blue"> <%=msg%></h1>
                        <h1 style="color: red"> <%=erro%></h1>
                    </form>
                </div>

                <div class="col-md-6 line-vertical" style="margin-top: 10px;">
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

                </div>

            </div>
        </div>

        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>

</html>
