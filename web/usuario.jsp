<%-- 
    Document   : usuario.jsp
    Created on : 28/05/2019, 00:29:15
    Author     : Mulero
--%>

<%@page import="br.com.fatecpg.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario user = (Usuario) session.getAttribute("user");
    String error = "";
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
                <h6 class="card-subtitle mb-2" style="color: firebrick"><%=error%></h6>

                <form method="post" action="usuario/alterUser.jsp">

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

                <form method="post" action="usuario/deleteUser.jsp">
                    <input type="hidden" class="form-control" name="txtID" value="<%=user.getCd_user()%>"/>
                    <input type="submit" class="btn btn-outline-danger" name="btnDelete" value="Deletar"/>
                </form>
            </div>
        </div>

        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
