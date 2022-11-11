<%-- 
    Document   : encuestas
    Created on : 10 nov. 2022, 12:15:03
    Author     : kjlme
--%>

<%@page import="ModelDAO.EncuestaDAO"%>
<%@page import="Model.Encuesta"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <script src="https://cdn.tailwindcss.com"></script>
    <meta charset="utf-8">
    <body>
        <div class="flex flex-col justify-center items-center">
            <form action="../EncuestaController">
                <div class="h-auto w-auto flex flex-col border bg-transparent rounded-3xl p-10 mt-10 mb-10">
                    <!-- Filtrar por Fecha -->
                    <div class="flex justify-start items-center mb-10">
                        <input class="w-40 rounded-md bg-slate-100 focus:outline-none py-1 text-center mr-3" type="date" name="date">
                        <input class="px-3 py-1 bg-blue-800 font-bold text-white rounded-md" type="submit" name="action" value="Filtrar">
                    </div>
                    <!-- Busqueda por Nombre -->
                    <div class="flex justify-start items-center mb-5">
                        <input class="w-full rounded-md bg-slate-100 focus:outline-none px-3 py-2 mr-3" type="text" name="nombre">
                        <input class="px-5 py-2 bg-gray-800 font-bold text-white rounded-md" type="submit" name="action" value="Buscar">
                    </div>
                    <!-- Tabla -->
                    <div class="flex flex-col justify-center items-center">
                        <table class="table">
                            <thead class="bg-gray-800 text-white">
                                <tr>
                                    <!--<th class="px-3 py-2"></th>-->
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
                                    String paramLista = request.getParameter("list");
                                    String paramFrom = request.getParameter("from");
                                    List<Encuesta> list = new ArrayList<>();
                                    if (paramLista != null && paramFrom != null) {
                                        switch (paramFrom) {
                                            case "filter":
                                                if (paramLista.equals("every")) {
                                                    list = survey.listEncuestas();
                                                } else if (paramLista.isEmpty()) {
                                                    list = survey.listEncuestas();
                                                } else {
                                                    list = survey.getByFecha(paramLista);
                                                }
                                                break;
                                            case "search":
                                                if (paramLista.equals("every")) {
                                                    list = survey.listEncuestas();
                                                } else {
                                                    list = survey.getByNombre(paramLista);
                                                }
                                                break;
                                            default:
                                                list = survey.listEncuestas();
                                        }
                                    } else if (paramLista != null) {
                                        list = survey.listEncuestas();
                                    }
                                    
                                    for (int i = 0; i < list.size(); i++) {
                                        out.print(
                                                "<tr><td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + list.get(i).getNombre() + "</td>"
                                                + "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + list.get(i).getSexo() + "</td>"
                                                + "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + list.get(i).getDeporte_fav() + "</td>"
                                                + "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + list.get(i).getTemas_fav() + "</td>"
                                                + "<td class='px-3 py-2 border-b border-gray-300 shadow-md text-center'>" + list.get(i).getFecha() + "</td>"
                                        );
                                    }
                                %>
                            </tbody>
                        </table>
<!--                        <div class="flex justify-end items-center">
                            <button type="submit" name="delete" class="bg-red-400 text-white font-bold px-3 py-2 rounded-xl mt-5">Eliminar</button>
                        </div>-->
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
