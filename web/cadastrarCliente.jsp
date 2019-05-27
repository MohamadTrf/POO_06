<%-- 
    Document   : cadastrarCliente
    Created on : 26/05/2019, 21:21:47
    Author     : MohamadTarif
--%>

<%@page import="br.com.fatecpg.model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String erro = "";
   String msg = "";
   if(request.getParameter("cadastrarCliente")!=null){
       String nome = request.getParameter("nomeCliente");
       String endereco = request.getParameter("enderecoCliente");
       String cpf = request.getParameter("cpfCliente");
       String email = request.getParameter("emailCliente");
       
       try{
           msg = "Usuário cadastrado com sucesso";
           Cliente.addCliente(nome, endereco, cpf, email);
           //response.sendRedirect(request.getRequestURI());
       }catch(Exception ex){
           erro = ex.getMessage();
       }
       
   }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Clientes </title>
    </head>
    <body>
     <%if(session.getAttribute("user")==null){%>
        <h2>Você não está autenticado para acessar este recurso</h2>
     <%}else{%>
        <h1>Cadastro de Clientes!</h1>
        <form>
            Nome: <input type="text" name="nomeCliente"/>
            Endereco: <input type="text" name="enderecoCliente"/>
            CPF:<input type="text" name="cpfCliente"/>
            Email:<input type="email" name="emailCliente"/>
            <input type="submit" name="cadastrarCliente" value="Cadastrar Cliente"/>
            <h1 style="blue"> <%=msg%></h1>
            <h1 style="red"> <%=erro%></h1>
            <a href="login.jsp">Voltar </a>
            
        </form>
       <%}%>
    </body>
</html>
