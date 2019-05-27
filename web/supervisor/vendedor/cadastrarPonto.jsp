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
<!DOCTYPE html>
 <% Usuario user = (Usuario) session.getAttribute("user"); %>
 <%
    String msg = "";
    String erro = "";
    if(request.getParameter("cadastrarPonto")!=null){
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        Date dataEntrada = format.parse(request.getParameter("dataPonto"));
        SimpleDateFormat formatH = new SimpleDateFormat("hh:mm");
        Date horaEntrada = formatH.parse(request.getParameter("horaEntrada"));
        Date horaSaida = formatH.parse(request.getParameter("horaSaida"));
        int id = Integer.parseInt(request.getParameter("id"));
        
        try{
            Ponto.addPonto(dataEntrada, horaEntrada, horaSaida, id);
        }catch(Exception ex){
            
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
        <h1>Cadastro de pontos! </h1>
        <form>
            Data do ponto: <input type="date" name="dataPonto"/>
            Hora de Entrada:<input type="time" name="horaEntrada"/>
            Hora de Saída:<input type="time" name="horaSaida"/>
            <input type="hidden" name="id" value="<%=user.getCd_user()%>"/>
            <input type="submit" name="cadastrarPonto" value="Registrar Ponto"/>
        </form>
        <a href="../../login.jsp">Voltar</a>
    </body>
</html>
