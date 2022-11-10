<%-- 
    Document   : resumenEncuesta
    Created on : Nov 10, 2022, 1:04:39 AM
    Author     : deuseli
--%>

<%@page import="Model.Encuesta"%>
<%@page import="ModelDAO.EncuestaDAO"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%
    EncuestaDAO dao = new EncuestaDAO();
    Map<String, Integer> resumenMap = new HashMap<>();
    resumenMap = dao.getResumenEncuestas();
    int f = resumenMap.get("Femenino");
    int m = resumenMap.get("Masculino");
    int fut = resumenMap.get("Futbol");
    int bas = resumenMap.get("Basquetbol");
    int joc = resumenMap.get("Jockey");
    int bei = resumenMap.get("Beisbol");
    int golf = resumenMap.get("Golf");
    int basico  = resumenMap.get("Basico");
    int inter = resumenMap.get("Intermedio");
    int supe = resumenMap.get("Superior");
    int tele = resumenMap.get("Tele");
    int cocina = resumenMap.get("Cocina");
    int tecno = resumenMap.get("Tecno");
    int mus = resumenMap.get("Musica");
    int depo = resumenMap.get("Deporte");
        //tipoAutoList.add(auto.getTipo());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resumen Encuestas</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
        <div class="flex flex-col">
            <div class="flex justify-evenly mt-10 items-center">
                <div class="flex flex-col items-center border-2 shadow-xl rounded-3xl p-5" style="width: 400px;">
                    <canvas id="sexo"></canvas>
                    <span class="mt-3">SEXO</span>
                </div>
                <div class="flex flex-col items-center border-2 shadow-xl rounded-3xl p-5" style="width: 400px;">
                    <canvas id="deporte_fav"></canvas>
                    <span class="mt-3">DEPORTE FAVORITO</span>
                </div>
            </div>
            <div class="flex justify-evenly mt-10 items-center">
                <div class="flex flex-col items-center border-2 shadow-xl rounded-3xl p-5" style="width: 400px;">
                    <canvas id="nivel_estudio"></canvas>
                    <span class="mt-3">NIVEL DE ESTUDIO</span>
                </div>
                <div class="flex flex-col items-center border-2 shadow-xl rounded-3xl p-5" style="width: 400px;">
                    <canvas id="temas_fav"></canvas>
                    <span class="mt-3">TEMAS FAVORITOS</span>

                </div>
            </div>
        </div>
    </body>
    <script>
        const sexoData = {
            labels: [
                'Masculino',
                'Femenino'
            ],
            datasets: [{
                    data: [<% out.print(m); %>, <% out.print(f); %>],
                    backgroundColor: [
                        'rgb(54, 162, 235)',
                        'rgb(255, 99, 132)',
                    ],
                    hoverOffset: 4
                }]
        };

        const sexoConfig = {
            type: 'pie',
            data: sexoData,
        };

        const deporteData = {
            labels: [
                'Fútbol',
                'Básquetbol',
                'Jockey',
                'Béisbol',
                'Golf'
            ],
            datasets: [{
                    data: [<% out.print(fut); %>, <% out.print(bas); %>, <% out.print(joc); %>, <% out.print(bei); %>, <% out.print(golf); %>],
                    backgroundColor: [
                        'rgb(54, 162, 235)',
                        'rgb(44, 99, 22)',
                        'rgb(255, 99, 132)',
                        'rgb(23, 44, 200)',
                        'rgb(2, 234, 222)'
                    ],
                    hoverOffset: 4
                }]
        };

        const deporteConfig = {
            type: 'pie',
            data: deporteData,
        };

        const estudioData = {
            labels: [
                'Básico',
                'Intermedio',
                'Superior'
            ],
            datasets: [{
                    data: [<% out.print(basico); %>, <% out.print(inter); %>, <% out.print(supe); %>],
                    backgroundColor: [
                        'rgb(54, 162, 235)',
                        'rgb(255, 99, 132)',
                        'rgb(2, 234, 222)'
                    ],
                    hoverOffset: 4
                }]
        };

        const estudioConfig = {
            type: 'pie',
            data: estudioData,
        };

        const temasData = {
            labels: [
                'Televisión',
                'Cocina',
                'Tecnología',
                'Música',
                'Deportes'
            ],
            datasets: [{
                    data: [<% out.print(tele); %>, <% out.print(cocina); %>, <% out.print(tecno); %>, <% out.print(mus); %>, <% out.print(depo); %>],
                    backgroundColor: [
                        'rgb(54, 162, 235)',
                        'rgb(44, 99, 22)',
                        'rgb(255, 99, 132)',
                        'rgb(23, 44, 200)',
                        'rgb(2, 234, 222)'
                    ],
                    hoverOffset: 4
                }]
        };

        const temasConfig = {
            type: 'pie',
            data: temasData,
        };
    </script>

    <script>

        const sexoChart = new Chart(
                document.getElementById('sexo'),
                sexoConfig
                );

        const deporteChart = new Chart(
                document.getElementById('deporte_fav'),
                deporteConfig
                );

        const estudioChart = new Chart(
                document.getElementById('nivel_estudio'),
                estudioConfig
                );
        const temasChart = new Chart(
                document.getElementById('temas_fav'),
                temasConfig
                );

    </script>
</html>
