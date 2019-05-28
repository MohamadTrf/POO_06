<%-- 
    Document   : cadastrarPonto
    Created on : 27/05/2019, 12:23:08
    Author     : MohamadTarif
--%>

<%@page import="br.com.fatecpg.model.Ponto"%>
<%@page import="java.sql.Time"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.com.fatecpg.model.Usuario"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
       #data {
      width: 20%;
      margin-left: 40%;
        margin-top: 10%;
       }  
       
       #entrada {
        width: 20%;
        margin-left: 40%;
        margin-top: 0.5%;
       }
       
       #saida {
        width: 20%;
        margin-left: 40%;
        margin-top: 0.5%;
       }
       #botao {
        width: 20%;
        margin-left: 40%;
        margin-top: 3%; 
       }
</style>

<nav class="navbar navbar-dark bg-primary">
<nav class="navbar navbar-light">
  <a class="navbar-brand" href="#">Cadastro de Pontos</a>
</nav>
</nav>

 <% Usuario user = (Usuario) session.getAttribute("user"); %>
 <%
    String msg = "";
    String erro = "";
    if(request.getParameter("cadastrarPonto")!=null){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date dataEntrada = format.parse(request.getParameter("dataPonto"));
        SimpleDateFormat formatH = new SimpleDateFormat("hh:mm");
        Date horaEntrada = formatH.parse(request.getParameter("horaEntrada"));
        Date horaSaida = formatH.parse(request.getParameter("horaSaida"));
        int id = Integer.parseInt(request.getParameter("id"));
        
       try{
           erro="";
           msg="Ponto cadastrado com sucesso";
           Ponto.addPonto(dataEntrada, horaEntrada, horaSaida, id);
       }catch(Exception ex){
           msg="";
           erro = ex.getMessage();
       }

     
        
    }
 %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Pontos</title>
    </head>
    <body>
        <h2> Olá <%=user.getNm_user()%> </h2> 
        <form>
         Data do ponto<input type="date" class="form-control" name="dataPonto" id="data" placeholder="Data Ponto"/>
         Hora de Entrada<input type="time" class="form-control" name="horaEntrada" id="entrada" placeholder="Data Ponto"/>
         Hora de Saída<input type="time" class="form-control"name="horaSaida" id="saida"  placeholder="Data Ponto"/>
         <input type="hidden" name="id" value="<%=user.getCd_user()%>"/>
         <input type="submit" class="btn btn-primary form-control" id="botao" name="cadastrarPonto" value="Registrar Ponto"/>

        </form>
            <h3 style="color: blue"><%=msg%></h3>
            <h3 style="color: red"><%=erro%></h3>
        <a href="../../login.jsp">Voltar</a>
    </body>
</html>
