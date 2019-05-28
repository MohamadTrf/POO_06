<%-- 
    Document   : cadastroProduto
    Created on : 27/05/2019, 20:55:12
    Author     : Mulero
--%>

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
        double venda = Double.parseDouble(request.getParameter("vendaProduto"));
        int fornecedor = Integer.parseInt(request.getParameter("fornecedorProduto"));

        try {
            Produto.addProduto(nome, quantidade, custo, venda, fornecedor);
            msg = "Produto cadastrado com sucesso";
        } catch (Exception ex) {
            erro = ex.getMessage();
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%if (session.getAttribute("user") == null) {%>
        <h2>Você não está autenticado para acessar este recurso</h2>
        <a href="login.jsp">Clique aqui para Voltar </a> 
        <%} else {%>
        <h1>Cadastro de Produtos!</h1>
        <form>
            Nome: <input type="text" name="nomeProduto"/>
            Quantidade: <input type="text" name="quantidadeProduto"/>
            Custo:<input type="text" name="custoProduto"/>
            Valor:<input type="email" name="valorProduto"/>
            Fornecedor (id):<input type="email" name="fornecedorProduto"/>
            <input type="submit" name="cadastraProduto" value="Cadastrar Produto"/>
            <h1 style="color: blue"> <%=msg%></h1>
            <h1 style="color: red"> <%=erro%></h1>
            <a href="login.jsp">Voltar </a>     
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
                        <input type="submit" name="deleteCliente" value="Deletar"/>
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
        <%}%>
    </body>
</html>
