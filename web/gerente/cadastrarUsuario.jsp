<%-- 
    Document   : cadastrarUsuario
    Created on : 26/05/2019, 16:49:46
    Author     : MohamadTarif
--%>

<%@page import="br.com.fatecpg.config.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  
   String erro = "";
   String msg = "";
   if(request.getParameter("cadastrarUser")!=null){
       String nome = request.getParameter("nomeUser");
       String senha = request.getParameter("senhaUser");
       String cargo = request.getParameter("cargo");
       int permissao = Integer.parseInt(request.getParameter("permissao"));
       
       try{
           msg = "Usuário cadastrado com sucesso";
           User.addUser(nome, senha, cargo, permissao);
           //response.sendRedirect(request.getRequestURI());
       }catch(Exception ex){
           erro = ex.getMessage();
       }
       
   }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar usuário</title>
    </head>
    <body>
        <%if(session.getAttribute("user")==null){%>
        <h2>Você não está autenticado para acessar este recurso</h2>
        <%}else{%>
        <% User user = (User) session.getAttribute("user"); %>
        <% if(!user.getNm_cargo().equals("Gerente")){%>
        <h2>Você não tem permissão para acessar esse recurso <a href="../login.jsp"> clique aqui para voltar!</a></h2>
            
        <%}%>
        <h1>Cadastre os Funcionários que você deseja que utilize o Software senhor <%=user.getNm_user()%>!</h1>
        <form>
            Nome: <input type="text" name="nomeUser"/>
            Senha: <input type="password" name="senhaUser"/>
            Cargo:
            <select name="cargo">
                <option value="supervisor"> Supervisor </option>
                <option value="vendedor">Vendedor</option>
            </select>
            Código permissão
            <select name="permissao">
                <option value="2"> 2</option>
                <option value="3"> 3</option>
            </select>
            <h1 style="blue"> <%=msg%></h1>
            <h1 style="red"> <%=erro%></h1>
            <input type="submit" name="cadastrarUser" value="Cadastrar Usuario"/>
        </form>
            <a href="../login.jsp">Voltar</a>
        <%}%>
    </body>
</html>
