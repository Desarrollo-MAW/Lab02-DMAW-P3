<%-- 
    Document   : index
    Created on : 9 nov. 2022, 14:55:07
    Author     : kjlme
--%>

<%@page import="ModelDAO.EncuestaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!EncuestaDAO survey = new EncuestaDAO();%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página Principal</title>
    <%
            if(session.getAttribute("admin").equals("true")) {
            %>
            <jsp:include page="nav/menuAdmin.jsp" flush="true" />
            <%
            } else if(session.getAttribute("admin").equals("false")) {
                %>
                <jsp:include page="nav/menuUsuario.jsp" flush="true" />
                <%
                  String check = survey.checkEncuesta(Integer.parseInt(session.getAttribute("id_usuario").toString()));
            if(check.equals("true")) {
            %>
                <jsp:include page="encuestaSummary.jsp" flush="true" />;
                <%
            } else {
                %>
                <jsp:include page="encuesta.jsp" flush="true" />;
                <%
            }  
            }
    %>
    </head>
    <body>
        
    </body>
</html>
