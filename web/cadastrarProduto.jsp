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
    if(request.getParameter("deleteProduto")!= null){
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
    </head>
    <body>

        <h1>Cadastro de Produtos!</h1>
        <form>
            Nome: <input type="text" name="nomeProduto"/>
            Quantidade: <input type="text" name="quantidadeProduto"/>
            Custo:<input type="text" name="custoProduto"/>
            Valor:<input type="text" name="valorProduto"/>
            <input type="submit" name="cadastraProduto" value="Cadastrar Produto"/>
            <%for(Fornecedor f: Fornecedor.getFornecedores()){%>
                <select name="fornecedorProduto"/> 
                <option value="<%=f.getCd_fornecedor()%>"><%=f.getNm_fornecedor()%> </option> 
                </select>
            <%}%>
            <h1 style="color: blue"> <%=msg%></h1>
            <h1 style="color: red"> <%=erro%></h1>

        </form>

        <h3>Produtos Cadastrados</h3>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Quantidade</th>
                <th>Valor de Custo</th>
                <th>Valor de venda</th>
                <th>Fornecedor</th>
            </tr>
            <% for (Produto c : Produto.getProdutos()) {%>
            <tr>
                <td><%=c.getNm_produto()%></td>
                <td><%=c.getQt_produto()%></td>
                <td><%=c.getVl_custo()%></td>
                <td><%=c.getVl_venda()%></td>
                <td><%=c.getPk_fornecedor()%></td>
                <td>
                    <form>
                        <input type="hidden" name="id" value="<%=c.getCd_produto()%>" />
                        <input type="submit" name="deleteProduto" value="Deletar"/>
                    </form>
                </td>
            </tr>
            <%}%>
        </table>

        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
