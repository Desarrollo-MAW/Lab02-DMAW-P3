<%-- 
    Document   : menuUsuario
    Created on : 9 nov. 2022, 18:12:35
    Author     : kjlme
--%>

<%@page import="ModelDAO.EncuestaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!EncuestaDAO survey = new EncuestaDAO();%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <nav id="header" class="w-full z-30 py-1 bg-gray-800">
        <div class="w-full flex items-center justify-between mt-0 px-6 py-2">
            <div class="w-full md:order-1" id="menu">
                <nav>
                    <ul class="flex items-end justify-end text-base text-white pt-4 md:pt-0">
                        <div class="flex justify-center items-center">
                            <li>
                                <div class="flex flex-row justify-center items-center">
                                    <div class="text-5xl text-white mr-3">
                                        <i class="bi bi-person-circle"></i>
                                    </div>
                                    <div class="flex flex-col justify-center items-center mr-10">
                                        <span class="font-bold text-xl"><% out.print(session.getAttribute("nombre") + " " + session.getAttribute("apellido"));%></span>
                                        <a class="no-underline italic" href="../UsuarioController?action=update">Editar Perfil</a>
                                    </div>
                                    <div class="px-2 py-1 rounded-md bg-red-400"><a class="no-underline font-bold" href="http://localhost:8080/Lab02-DMAW-P3/ServletCerrarSesion">Cerrar Sesión</a></div>
                                </div>
                            </li>
                        </div>
                    </ul>
                </nav>
            </div>

        </div>
    </nav>
    <body>
        
    </body>
</html>
