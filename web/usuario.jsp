<%-- 
    Document   : usuario.jsp
    Created on : 28/05/2019, 00:29:15
    Author     : Mulero
--%>

<%@page import="br.com.fatecpg.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario user = (Usuario) session.getAttribute("user");
    String err = "";
    String succ = "";

    if (request.getParameter("btnUpdate") != null) {

        String nome = request.getParameter("txtName");
        String cargo = request.getParameter("txtCargo");
        int id = Integer.parseInt(request.getParameter("txtID"));
        int permissao = Integer.parseInt(request.getParameter("slcPermissao"));

        if (nome == "") {
            err = "Preencha seu nome!";
        } else if (cargo == "") {
            err = "Preencha seu cargo!";
        } else if (permissao == 0) {
            err = "Escolha um nivel de permissão!";
        } else {
            err = "";
            user.alterUsuario(nome, cargo, permissao, id);
            succ = "Alterações realizadas com sucesso";
        }
    }

    if (request.getParameter("btnDelete") != null) {

    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="WEB-INF/jspf/header.jspf" %>
    </head>
    <body>

        <div class="card mr-auto ml-auto" style="width: 18rem; text-align: center;">
            <div class="card-body">
                <h5 class="card-title">Perfil</h5>

                <h6 class="card-subtitle mb-2" style="color: firebrick"><%=err%></h6>
                <h6 class="card-subtitle mb-2" style="color: cornflowerblue"><%=succ%></h6>

                <form method="post">

                    <div class="form-group">
                        <input type="text" class="form-control" name="txtName" value="<%=user.getNm_user()%>"/>
                        <input type="hidden" class="form-control" name="txtID" value="<%=user.getCd_user()%>"/>
                    </div>

                    <div class="form-group">
                        <input type="text" class="form-control" name="txtCargo" value="<%=user.getNm_cargo()%>"/>
                    </div>

                    <select class="custom-select" name="slcPermissao">
                        <option value="0" selected>Nível de Permissão</option>
                        <option value="1">Gerente</option>
                        <option value="2">Supervisor</option>
                        <option value="3">Vendedor</option>
                    </select>

                    <br> <br>

                    <input type="submit" class="btn btn-outline-primary" name="btnUpdate" value="Alterar"/>
                </form>

                <br> 

                <form method="post">
                    <input type="hidden" class="form-control" name="txtID" value="<%=user.getCd_user()%>"/>
                    <input type="submit" class="btn btn-outline-danger" name="btnDelete" value="Deletar"/>
                </form>
            </div>
        </div>

        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
