<%-- 
    Document   : listagemPonto
    Created on : 27/05/2019, 20:44:47
    Author     : Mulero
--%>

<%@page import="br.com.fatecpg.model.Ponto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String erro = "";
    String msg = "";

    int id = 0;

    if (request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id"));
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="WEB-INF/jspf/header.jspf" %>
    </head>
    <body class="text-center">
        <h1>Gerenciamento de Pontos!</h1>

        <br>

        <table class="table">
            <tr>
                <th>Data do Ponto</th>
                <th>Hora de Entrada</th>
                <th>Hora de Saída</th>
                <th>Usuário</th>
                <th>Apagar ponto</th>
            </tr>
            <% for (Ponto p : Ponto.getPontosByUserId(id)) {%>
            <tr>
                <td name="dataPonto"><%=p.getDt_ponto()%></td>
                <td name="hrEntrada"><%=p.getHora_entrada()%></td>
                <td name="hrSaida"><%=p.getHora_saida()%></td>
                <td name="cdUsuario"><%=p.getCd_usuario()%></td>
                <td>
                    <form>
                        <input type="hidden" name="id" value="<%=p.getCd_ponto()%>" />
                        <input class="btn btn-outline-primary" type="submit" name="deletePonto" value="Deletar"/>
                    </form>
                </td>
            </tr>
            <%}%>
        </table>

        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
