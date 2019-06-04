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

        <style>
            .card {
                height: 65%;
            }
            #botao4{
                margin-left: 22%;

            }
            #botao5{
                margin-left: 22%;
            }
            #botao6{
                margin-left: 22%;
            }
            #botao31{
                margin-left: 22%;
            }
        </style>

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

        <div class="text-center">
            <br>
            <h3>Bem vindo <%=user.getNm_user()%></h3>
            <h5><strong>Seu nivel de permissões é de <%=acesso%></strong></h5>
            <br>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="card">
                        <img src="https://blog.acelerato.com/wp-content/uploads/2016/09/padronizar.jpg" class="card-img-top" alt="..." style="height:138px;">
                        <div class="card-body">
                            <h5 class="card-title">Cadastrar Cliente</h5>
                            <p class="card-text">Aqui você pode cadastrar o Cliente</p>
                            <a href="cliente.jsp" class="btn btn-primary" id="botao31">CADASTRAR</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">  
                    <div class="card">
                        <img src="https://blog.acelerato.com/wp-content/uploads/2016/07/atendimento-posvenda.jpg" class="card-img-top" alt="..." style="height:138px;">
                        <div class="card-body">
                            <h5 class="card-title">Cadastrar Produto</h5>
                            <p class="card-text">Aqui você pode cadastrar o Produto</p>
                            <a href="cadastrarProduto.jsp" class="btn btn-primary" id="botao4">CADASTRAR</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <%if (nivel == 1 || nivel == 2) {%>
                    <div class="card">
                        <img src="http://blog.aartgraf.com.br/wp-content/uploads/2018/03/2.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Cadastrar Fornecedor </h5>
                            <p class="card-text">Aqui você pode cadastrar o Fornecedor</p>
                            <a href="cadastrarFornecedor.jsp" class="btn btn-primary" id="botao5">CADASTRAR</a>
                        </div>
                    </div>
                    <%}%>
                </div>
                <div class="col-md-3">
                    <%if (nivel == 1) {%>
                    <div class="card">
                        <img src="https://www.pedroengler.com/wp-content/uploads/2018/08/como-deixar-o-cliente-feliz.jpg" class="card-img-top" alt="..." style="height:138px;">
                        <div class="card-body">
                            <h5 class="card-title">Cadastrar Usuario</h5>
                            <p class="card-text">Aqui você pode cadastrar o Usuario</p>
                            <a href="cadastrarUsuario.jsp" class="btn btn-primary" id="botao6">CADASTRAR</a>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>      
        <br>
        <% }%>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>

</html>