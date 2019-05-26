<%-- 
    Document   : cadastrarUsuario
    Created on : 26/05/2019, 16:49:46
    Author     : MohamadTarif
--%>

<%@page import="br.com.fatecpg.config.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% User user = (User) session.getAttribute("user"); %>
        <h1>Cadastre os Funcionários que você deseja que utilize o Software senhor <%=user.getNm_user()%>!</h1>
    </body>
</html>
