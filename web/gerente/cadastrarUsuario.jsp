<%-- 
    Document   : cadastrarUsuario
    Created on : 26/05/2019, 16:49:46
    Author     : MohamadTarif
--%>

<%@page import="br.com.fatecpg.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <% Usuario user = (Usuario) session.getAttribute("user"); %>
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
           Usuario.addUser(nome, senha, cargo, permissao);
           //response.sendRedirect(request.getRequestURI());
       }catch(Exception ex){
           msg="";
           erro = ex.getMessage();
       }
       
   }
   
   if(request.getParameter("deletarUsuario")!=null){
       try{
        int id = Integer.parseInt(request.getParameter("id"));
        if(user.getCd_user()==id){
         erro="Você não pode deletar sua própria conta";   
        }else{
           erro="";
           msg="Usuário deletado com sucesso";
           Usuario.deleteUsuario(id);
        }
       }catch(Exception ex){
           msg="";
           erro= ex.getMessage();
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
        <a href="../login.jsp"> Clique aqui para voltar </a>
        <%}else{%>
       
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
            <table border="1">
                <tr>
                    <th>Nome</th>
                    <th>Cargo</th>
                    <th>Deletar</th>
                </tr>
                <%for(Usuario u: Usuario.getUsers()){ %>
                    <tr>
                        <th><%=u.getNm_user()%></th>
                        <th><%=u.getNm_cargo()%></th>
                        <td>
                            <form>
                                <input type="hidden" name="id" value="<%=u.getCd_user()%>" />
                                <input type="submit" name="deletarUsuario" value="Remover Usuário"/>
                            </form>
                        </td>
                    </tr>
                <%}%>
            </table>
        <%}%>
    </body>
</html>
