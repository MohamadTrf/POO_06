<%-- 
    Document   : alterUser
    Created on : 28/05/2019, 01:45:56
    Author     : Mulero
--%>

<%@page import="br.com.fatecpg.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario user = (Usuario) session.getAttribute("user");
    String error = "";

    if (request.getParameter("btnUpdate") != null) {

        String nome = request.getParameter("txtName");
        String cargo = request.getParameter("txtCargo");
        String id = request.getParameter("txtID");
        String permissao = request.getParameter("slcPermissao");

        if (nome == "") {
            error = "Preencha seu nome!";
        } else if (cargo == "") {
            error = "Preencha seu cargo!";
        } else if (permissao == "0") {
            error = "Escolha um nivel de permissão!";
        } else {
            user.alterUsuario(nome, cargo, Integer.parseInt(permissao), Integer.parseInt(id));
            response.sendRedirect("home.jsp");
        }
    }
%>