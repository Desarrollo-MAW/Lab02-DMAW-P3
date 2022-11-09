<%-- 
    Document   : index
    Created on : 9 nov. 2022, 14:55:07
    Author     : kjlme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página Principal</title>
    </head>
    <body>
        <%
            if(session.getAttribute("admin").equals("true")) {
            %>
            <jsp:include page="nav/menuAdmin.html" flush="true" />
            <%
            } else if(session.getAttribute("admin").equals("false")) {
                %>
                <jsp:include page="nav/menuUsuario.html" flush="true" />
                <%
            }
        %>
    </body>
</html>
