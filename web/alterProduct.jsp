<%-- 
    Document   : alterProduct
    Created on : 28/05/2019, 09:41:47
    Author     : MohamadTarif
--%>
<%@page import="br.com.fatecpg.model.Produto"%>
<%
    String msg = "";
    String erro = "";

    int id = Integer.parseInt(request.getParameter("idP"));
    String nome = request.getParameter("nomeProdutoAlter");
    int qtd = Integer.parseInt(request.getParameter("qtdProdutoAlter"));
    double valorCusto = Double.parseDouble(request.getParameter("valorCustoAlter"));
    double valorVenda = Double.parseDouble(request.getParameter("valorVendaAlter"));
    int idFornecedor = Integer.parseInt(request.getParameter("idFornecedorAlter"));

    if (request.getParameter("salvar") != null) {
        try {
            erro = "";
            msg = "Produto alterado com sucesso";
            Produto.alterProduto(nome, qtd, valorCusto, valorVenda, idFornecedor, id);
        } catch (Exception ex) {
            msg = "";
            erro = ex.getMessage();
        }
    }
%>
<%@page import="br.com.fatecpg.model.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Produto</title>
        <%@include file="WEB-INF/jspf/header.jspf" %>

        <style>
            #remove {
                margin-bottom: -10%;   
            }
        </style>


    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-6">

                    <form>
                        <div class="form-group" style="margin-top: 10px;">
                            <input type="text" class="form-control" value="<%=nome%>" name="nomeProdutoAlter" />
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" value="<%=qtd%>" name="qtdProdutoAlter"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" value="<%=valorCusto%>" name="valorCustoAlter"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" value="<%=valorVenda%>" name="valorVendaAlter"/>
                        </div>

                        <select name="idFornecedorAlter" class="form-control">
                            <%for (Fornecedor f : Fornecedor.getFornecedores()) {%> 
                            <option  value="<%=idFornecedor%>"><%=f.getNm_fornecedor()%> </option>  
                            <%}%>
                        </select>
                        <input type="hidden" name="idP" value="<%=id%>" /> 
                        <input type="submit" name="salvar" value="Alterar Produto" class="btn btn-primary" id="remove"/>
                        <br />
                        <br />
                        <br />
                        <h1 style="color: blue"> <%=msg%></h1>
                        <h1 style="color: red"> <%=erro%></h1>

                    </form>
                </div>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
