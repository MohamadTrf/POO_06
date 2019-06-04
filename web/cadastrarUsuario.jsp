<%-- 
    Document   : cadastrarUsuario
    Created on : 26/05/2019, 16:49:46
    Author     : MohamadTarif
--%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<%@page import="br.com.fatecpg.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% Usuario user = (Usuario) session.getAttribute("user"); %>
<%
    String erro = "";
    String msg = "";
    if (request.getParameter("cadastrarUser") != null) {
        String nome = request.getParameter("nomeUser");
        String senha = request.getParameter("senhaUser");
        String cargo = request.getParameter("cargo");
        int permissao = Integer.parseInt(request.getParameter("permissao"));

        try {
            erro = "";
            if (user.getNm_user().equals(nome)) {
                msg = "Usuário  já existe no sistema";
            } else {
                msg = "Usuário cadastrado com sucesso";
                Usuario.addUser(nome, senha, cargo, permissao);
            } //response.sendRedirect(request.getRequestURI());
        } catch (Exception ex) {
            msg = "";
            erro = ex.getMessage();
        }

    }

    if (request.getParameter("deletarUsuario") != null) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            if (user.getCd_user() == id) {
                erro = "Você não pode deletar sua própria conta";
            } else {
                erro = "";
                msg = "Usuário deletado com sucesso";
                Usuario.deleteUsuario(id);
            }
        } catch (Exception ex) {
            msg = "";
            erro = ex.getMessage();
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar usuário</title>
        <%@include file="WEB-INF/jspf/header.jspf" %>

        <style>
            .line-vertical{ 
                border-left: 5px solid #007bff;
            }
        </style>


    </head>
    <body>
        <%if (session.getAttribute("user") == null) {%>
        <h2>Você não está autenticado para acessar este recurso</h2>
        <a href="login.jsp"> Clique aqui para voltar </a>
        <%} else {%>

        <% if (!user.getNm_cargo().equals("Gerente")) {%>
        <br>
        <h2 class="text-center">Você não tem permissão para acessar esse recurso</h2>

        <%} else {%>    
        <div class="container">

            <div class="row">

                <div class="col-md-6">
                    <form>
                        <div class="form-group full" style="margin-top: 10px;">
                            <input type="text" class="form-control" name="nomeUser" id="nome" placeholder="Nome"/>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name="senhaUser" id="end" placeholder="Senha"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="cargo"  placeholder="Cargo"/>
                        </div>
                        <div class="form-group">
                            <select name="permissao" placeholder="Código Permissão" class="form-control" >
                                <option value="0" selected>Nível de Permissão</option>
                                <option value="1"> Gerente</option>
                                <option value="2"> Supervisor</option>
                                 <option value="3"> Vendedor</option>
                            </select>
                        </div>
                        <h1 style="blue"> <%=msg%></h1>
                        <h1 style="red"> <%=erro%></h1>
                        <input type="submit" name="cadastrarUser" value="Cadastrar Usuario" class="btn btn-primary"  id="botao2"/>
                    </form>
                </div>
                <div class="col-md-6 line-vertical" style="margin-top: 10px;">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Nome</th>
                                <th scope="col">Cargo</th>
                                <th scope="col">Deletar</th>
                            </tr>
                        </thead>
                        <%for (Usuario u : Usuario.getUsers()) {%>
                        <tr>
                            <th><%=u.getNm_user()%></th>
                            <th><%=u.getNm_cargo()%></th>
                            <td>
                                <form>
                                    <input type="hidden" name="id" value="<%=u.getCd_user()%>" />
                                    <input type="submit" name="deletarUsuario" value="Remover Usuário" class="btn btn-danger"/>
                                </form>
                            </td>
                        </tr>
                        <%}%>

                    </table>
                </div>

            </div>
        </div>


        <%  } %>
        <%}%>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>

</html>
