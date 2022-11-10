<%-- 
    Document   : encuestas
    Created on : 10 nov. 2022, 12:15:03
    Author     : kjlme
--%>

<%@page import="ModelDAO.EncuestaDAO"%>
<%@page import="Model.Encuesta"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Encuestas</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <%
        if (session.getAttribute("admin").equals("true")) {
    %>
    <jsp:include page="nav/menuAdmin.jsp" flush="true" />
    <%
    } else if (session.getAttribute("admin").equals("false")) {
    %>
    <jsp:include page="nav/menuUsuario.jsp" flush="true" />
    <%
        }
    %>
    <body>
        <div class="flex flex-col justify-center items-center">

            <div class="h-auto w-auto flex flex-col border bg-transparent rounded-3xl p-10 mt-10 mb-10">
                <!-- Filtrar por Fecha -->
                <div class="flex justify-start items-center mb-10">
                    <input class="w-40 rounded-md bg-slate-100 focus:outline-none py-1 text-center mr-3" type="date" name="date">
                    <button type="submit" name="date" class="bg-blue-800 text-white font-bold px-5 py-1 rounded-xl">Filtrar</button>
                </div>
                <!-- Busqueda por Nombre -->
                <div class="flex justify-start items-center mb-5">
                    <input class="w-full rounded-md bg-slate-100 focus:outline-none px-3 py-2 mr-3" type="text" name="search">
                    <button type="submit" name="delete" class="bg-gray-800 text-white font-bold px-5 py-2 rounded-xl">Buscar</button>
                </div>
                <!-- Tabla -->
                <div class="flex flex-col justify-center items-center">
                <table class="table">
                    <thead class="bg-gray-800 text-white">
                        <tr>
                            <th class="px-3 py-2"></th>
                            <th class="px-3 py-2">NOMBRE</th>
                            <th class="px-3 py-2">SEXO</th>
                            <th class="px-3 py-2">DEPORTE</th>
                            <th class="px-3 py-2">TEMA FAVORITO</th>
                            <th class="px-3 py-2">FECHA</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            EncuestaDAO survey = new EncuestaDAO();
                            List<Encuesta> list = survey.listEncuestas();
                            for (int i = 0; i < list.size(); i++) {
                                out.print(
                                "<tr><td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'><input type=checkbox name='eliminar' value='"+list.get(i).getId_usuario()+"' title='"+list.get(i).getId_usuario()+"'></td>" +
                                "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>"+list.get(i).getNombre()+"</td>" +
                                "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>"+list.get(i).getSexo()+"</td>" +
                                "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>"+list.get(i).getDeporte_fav()+"</td>" +
                                "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>"+list.get(i).getTemas_fav()+"</td>" +
                                "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>"+list.get(i).getFecha()+"</td>"
                                );
                            }
                        %>
                    </tbody>
                </table>
                <div class="flex justify-end items-center">
                    <button type="submit" name="delete" class="bg-red-400 text-white font-bold px-3 py-2 rounded-xl mt-5">Eliminar</button>
                </div>
                </div>
            </div>
        </div>
    </body>
</html>
