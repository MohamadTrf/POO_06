<%-- 
    Document   : cadastroProduto
    Created on : 27/05/2019, 20:55:12
    Author     : Mulero
--%>

<%@page import="br.com.fatecpg.model.Fornecedor"%>
<%@page import="br.com.fatecpg.model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String erro = "";
    String msg = "";
    if (request.getParameter("cadastraProduto") != null) {

        String nome = request.getParameter("nomeProduto");
        int quantidade = Integer.parseInt(request.getParameter("quantidadeProduto"));
        double custo = Double.parseDouble(request.getParameter("custoProduto"));
        double venda = Double.parseDouble(request.getParameter("valorProduto"));
        int fornecedor = Integer.parseInt(request.getParameter("fornecedorProduto"));

        try {
            Produto.addProduto(nome, quantidade, custo, venda, fornecedor);
            msg = "Produto cadastrado com sucesso";
        } catch (Exception ex) {
            erro = ex.getMessage();
        }
    }

    if (request.getParameter("deleteProduto") != null) {
        try {
            erro = "";
            msg = "Produto deletado com sucesso";
            int id = Integer.parseInt(request.getParameter("id"));
            Produto.deleteProduto(id);
        } catch (Exception ex) {
            msg = "";
            erro = ex.getMessage();
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Produto</title>
        <%@include file="WEB-INF/jspf/header.jspf" %>

        <style>
            .line-vertical{ 
                border-left: 5px solid #007bff;
            }
            #change {
                margin-bottom: -15%;
            }
            #delete{
                margin-top: -20%;
            }
        </style>

    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-6">

                    <form>
                        <div class="form-group" style="margin-top: 10px;">
                            <input type="text" class="form-control" name="nomeProduto" id="nome" placeholder="Nome"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="quantidadeProduto" id="end" placeholder="Quantidade"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="custoProduto" id="cpf" placeholder="Custo"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="valorProduto" id="email" placeholder="Valor"/>
                        </div>

                        <select class="form-control" name="fornecedorProduto"/> 
                        <%for (Fornecedor f : Fornecedor.getFornecedores()) {%>  
                        <option value="<%=f.getCd_fornecedor()%>"> <%=f.getNm_fornecedor()%> </option> 
                        <%}%>
                        </select>
                        
                        <br>
                        <input type="submit" name="cadastraProduto" value="Cadastrar Produto" class="btn btn-primary" id="botao2"/>

                        <h1 style="color: blue"> <%=msg%></h1>
                        <h1 style="color: red"> <%=erro%></h1>

                    </form>
                </div>

                <div class="col-md-6 line-vertical" style="margin-top: 10px;">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">Nome</th>
                                <th scope="col">Quantidade</th>
                                <th scope="col">Custo</th>
                                <th scope="col">Venda</th>
                                <th scope="col">Fornecedor</th>
                                <th scope="col">Opcões</th>

                            </tr>
                        </thead>
                        <% for (Produto c : Produto.getProdutos()) {%>
                        <tr>
                            <td name="nomeProduto"><%=c.getNm_produto()%></td>
                            <td name="qtProduto"><%=c.getQt_produto()%></td>
                            <td name="valorCusto"><%=c.getVl_custo()%></td>
                            <td name="valorVenda"><%=c.getVl_venda()%></td>
                            <td name="idFornecedor"><%=c.getPk_fornecedor()%></td>
                            <td>
                                <form>
                                    <input type="hidden" name="id" value="<%=c.getCd_produto()%>" />
                                    <input type="submit" class="btn btn-danger" name="deleteProduto" value="Deletar" id="delete"/>
                                </form>
                                <form action="produto/alterProduct.jsp">
                                    <input type="hidden" name="nomeProdutoAlter" value="<%=c.getNm_produto()%>" />
                                    <input type="hidden" name="qtdProdutoAlter" value="<%=c.getQt_produto()%>" />
                                    <input type="hidden" name="valorCustoAlter" value="<%=c.getVl_custo()%>" />
                                    <input type="hidden" name="valorVendaAlter" value="<%=c.getVl_venda()%>" />
                                    <input type="hidden" name="idFornecedorAlter" value="<%=c.getPk_fornecedor()%>" />
                                    <input type="hidden" name="idF" value="<%=c.getCd_produto()%>"/>
                                    <input type="submit" class="btn btn-primary" name="alterarProduto" value="Alterar" id="change"/>
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
