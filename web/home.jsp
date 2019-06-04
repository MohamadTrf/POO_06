<%-- 
    Document   : index
    Created on : 26/05/2019, 22:35:26
    Author     : Mulero
--%>

<%@page import="br.com.fatecpg.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <%@include file="WEB-INF/jspf/header.jspf" %>
    </head>
    <body>
        <% if (session.getAttribute("user") != null) {

                Usuario user = (Usuario) session.getAttribute("user");

                String acesso = "";
                int nivel = user.getCd_nivel_permissao();
                if (nivel == 1) {
                    acesso = "Gerente";
                } else if (nivel == 2) {
                    acesso = "Supervisor";
                } else if (nivel == 3) {
                    acesso = "Vendedor";
                }
        %>

        <h3>Bem vindo <%=user.getNm_user()%></h3>
        <br>
        <h5><strong>Seu nivel de permissões é de <%=acesso%></strong></h5>
        <h5>Você tem acesso as seguintes funcionalidades: </h5>
        <div class="container">
            <div class="row">
                <div class="col-md-3">
    <div class="card" style="width: 18rem;" style="margin-right: 20%;">
        <img src="http://www.edercarnielli.com.br/wp-content/uploads/2018/06/porque-montar-o-perfil-do-cliente.png" class="card-img-top" alt="...">
     <div class="card-body">
        <h5 class="card-title">Cadastrar Cliente</h5>
    <p class="card-text">Aqui você pode cadastrar o Cliente</p>
    <a href="cliente.jsp" class="btn btn-primary">CADASTRAR</a>
    </div>
    </div>
                </div>
                <div class="col-md-3">
 <div class="card" style="width: 18rem;">
        <img src="http://www.curveloonline.com/wp-content/uploads/Aliança-Materiais-de-Construção-Filial-produtos.jpeg" class="card-img-top" alt="...">
     <div class="card-body">
        <h5 class="card-title">Cadastrar Produto</h5>
    <p class="card-text">Aqui você pode cadastrar o Produto</p>
    <a href="cadastrarProduto.jsp" class="btn btn-primary">CADASTRAR</a>
    </div>
    </div>
                </div>
                <div class="col-md-3">
     <%if (nivel == 1 || nivel == 2) {%>
        <div class="card" style="width: 18rem;">
        <img src="http://blog.aartgraf.com.br/wp-content/uploads/2018/03/2.png" class="card-img-top" alt="...">
     <div class="card-body">
        <h5 class="card-title">Cadastrar Fornecedor </h5>
    <p class="card-text">Aqui você pode cadastrar o Fornecedor</p>
    <a href="cadastrarFornecedor.jsp" class="btn btn-primary">CADASTRAR</a>
    </div>
    </div>
        <%}%>
                </div>
                <div class="col-md-3">
      <%if (nivel == 1) {%>
         <div class="card" style="width: 18rem;">
        <img src="https://www.websa100.com/wp-content/uploads/2015/05/usuarios-redes-sociales.png" class="card-img-top" alt="...">
     <div class="card-body">
        <h5 class="card-title">Cadastrar Usuario</h5>
    <p class="card-text">Aqui você pode cadastrar o Usuario</p>
    <a href="cadastrarUsuario.jsp" class="btn btn-primary">CADASTRAR</a>
    </div>
    </div>
        <%}%>
                </div>
            </div>
        </div>
        <br>
        <%if (nivel == 2 || nivel == 3) {%>
        <a href="cadastrarPonto.jsp"> Cadastrar Ponto </a>
        <% }%>

        <% }%>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>


      