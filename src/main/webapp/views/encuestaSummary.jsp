<%-- 
    Document   : encuestaSummary
    Created on : 10 nov. 2022, 16:49:57
    Author     : kjlme
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModelDAO.EncuestaDAO"%>
<%@page import="Model.Encuesta"%>
<%! EncuestaDAO survey = new EncuestaDAO();%>
<%! List<Encuesta> list = new ArrayList<>(); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mi Encuesta</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <div class="flex justify-center items-center">
            <div class="h-auto w-[40%] flex flex-col justify-center items-center bg-white shadow-2xl rounded-3xl mt-10 py-5">
                <div class="w-auto h-auto flex flex-row">
                    <%
                        list = survey.getEncuesta(Integer.parseInt(session.getAttribute("id_usuario").toString()));
                        if(list.get(0).getSexo().equals("Femenino")){
                            out.print("<img class='rounded-full' src='../images/avatar2.png' width='200px' height='200px'/>");
                        } else {
                            out.print("<img class='rounded-full' src='../images/avatar.png' width='200px' height='200px'/>");
                        }
                    %>
                    <div class="flex flex-col justify-center items-center ml-5">
                        <div class="font-bold text-3xl">
                            <%
                                list = survey.getEncuesta(Integer.parseInt(session.getAttribute("id_usuario").toString()));
                                out.print(list.get(0).getNombre());
                            %>
                        </div>
                        <div class="flex flex-row justify-center items-center">
                            <div class="text-lg font-bold">
                                Sexo:
                            </div>
                            <div class="text-lg ml-2">
                                <%
                                list = survey.getEncuesta(Integer.parseInt(session.getAttribute("id_usuario").toString()));
                                out.print(list.get(0).getSexo());
                                %>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="w-full h-full flex flex-row justify-center items-center mt-10">
                    <div class="flex flex-col justify-center items-center">
                        <div class="rounded-full text-xl text-white font-bold bg-gray-800 px-5 py-2 mr-3">
                            <%
                                list = survey.getEncuesta(Integer.parseInt(session.getAttribute("id_usuario").toString()));
                                out.print(list.get(0).getDeporte_fav());
                            %>     
                        </div>
                        <div class="text-md text-gray-500 mb-1">
                            Deporte
                        </div>
                    </div>
                    <div class="flex flex-col justify-center items-center">
                        <div class="flex justify-center items-center rounded-full text-xl text-white font-bold bg-green-500 px-5 py-2 mr-3">
                            <%
                                list = survey.getEncuesta(Integer.parseInt(session.getAttribute("id_usuario").toString()));
                                out.print(list.get(0).getNivel_estudio());
                            %>     
                        </div>
                        <div class="text-md text-gray-500 mb-1">
                            Nivel de Estudio
                        </div>
                    </div>
                    <div class="flex flex-col justify-center items-center">
                        <div class="flex justify-center items-center rounded-full text-xl text-white font-bold bg-yellow-400 px-5 py-2 mr-3">
                            <%
                                list = survey.getEncuesta(Integer.parseInt(session.getAttribute("id_usuario").toString()));
                                out.print(list.get(0).getTemas_fav());
                            %>     
                        </div>
                        <div class="text-md text-gray-500 mb-1">
                            Tema Favorito
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
