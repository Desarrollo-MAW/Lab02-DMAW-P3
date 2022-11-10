<%-- 
    Document   : encuesta
    Created on : 9 nov. 2022, 12:17:26
    Author     : kjlme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Encuesta</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <%
            if(session.getAttribute("admin").equals("true")) {
            %>
            <jsp:include page="nav/menuAdmin.jsp" flush="true" />
            <%
            } else if(session.getAttribute("admin").equals("false")) {
                %>
                <jsp:include page="nav/menuUsuario.jsp" flush="true" />
                <%
            }
        %>
    <body>
        <div class="flex justify-center items-center">
            <div class="h-auto w-[40%] flex justify-start items-start bg-transparent border rounded-3xl mt-10">
                <div class="w-full p-10">
                    <!--Inicio del Bloque del Formulario-->
                    <form method="POST" action="../../ServletEncuesta">
                        <!-- Nombre -->
                        <div class="font-bold text-lg mr-3">
                            Nombre
                        </div>
                        <input class="w-full rounded-md bg-slate-100 focus:outline-none px-3 py-2 mt-2 mb-3" type="text" name="name">
                        <!-- Sexo -->
                        <div class="font-bold text-lg mr-3">
                            Sexo
                        </div>
                        <div class="flex flex-col">
                            <label><input class="mr-2 mb-3" type="radio" name="sexo" value="male">Masculino</label>
                            <label><input class="mr-2 mb-3" type="radio" name="sexo" value="female">Femenino</label>
                        </div>
                        <!-- Deporte Favorito -->
                        <div class="font-bold text-lg mr-3">
                            Deporte Favorito
                        </div>
                        <div>
                            <label><input class="mr-2 mb-3" type="radio" name="deporte" value="futbol">Fútbol</label>
                            <label><input class="mr-2 mb-3" type="radio" name="deporte" value="bkb">Basketball</label>
                            <label><input class="mr-2 mb-3" type="radio" name="deporte" value="jockey">Jockey</label>
                            <label><input class="mr-2 mb-3" type="radio" name="deporte" value="beisbol">Beisbol</label>
                            <label><input class="mr-2 mb-3" type="radio" name="deporte" value="golf">Golf</label>
                        </div>

                        <!-- Nivel de Estudio -->
                        <div class="font-bold text-lg mr-3">
                            Nivel de Estudio
                        </div>
                        <div>
                            <select name="nivelEstudio" id="nivelEstudio" class="w-full bg-slate-100 text-gray-900 text-sm rounded-lg focus:outline-none p-3 mb-3">
                                <option selected >Seleccione un nivel de Estudio</option>
                                <option>Básico</option>
                                <option>Intermedio</option>
                                <option>Superior</option>
                            </select>
                        </div>
                        <!-- Temas Favoritos -->
                        <div class="font-bold text-lg mr-3">
                            Temas Favoritos
                        </div>
                        <div>
                            <label><input class="mr-2 mb-10" type="radio" name="favorito" value="television">Televisión</label>
                            <label><input class="mr-2 mb-10" type="radio" name="favorito" value="cocina">Cocina</label>
                            <label><input class="mr-2 mb-10" type="radio" name="favorito" value="tecnologia">Tecnología</label>
                            <label><input class="mr-2 mb-10" type="radio" name="favorito" value="musica">Música</label>
                            <label><input class="mr-2 mb-10" type="radio" name="favorito" value="derpotes">Deportes</label>
                        </div>
                        <input class="w-full px-3 py-2 bg-blue-500 font-bold text-white rounded-md" type="submit" name="action" value="Enviar">
                    </form>
                    <!--Fin del Bloque del Formulario-->
                </div>
            </div>
        </div>
    </body>
</html>
