<%-- 
    Document   : logout
    Created on : 28/05/2019, 00:23:47
    Author     : Mulero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") != null) {
        session.invalidate();
        response.sendRedirect("login.jsp");
    } else {
        response.sendRedirect("login.jsp");
    }
%>