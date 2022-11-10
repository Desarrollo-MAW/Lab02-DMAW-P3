<%-- 
    Document   : menuAdmin
    Created on : 9 nov. 2022, 18:10:30
    Author     : kjlme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <ul class="flex items-start justify-between items-center text-base text-white pt-4 md:pt-0">
                    <div class="flex flex-row">
                        <li><a class="inline-block no-underline hover:text-black font-semibold text-lg py-2 px-4 lg:-ml-2" href="resumenEncuesta.jsp">Resumen de Encuestas</a></li>
                        <li><a class="inline-block no-underline hover:text-black font-semibold text-lg py-2 px-4 lg:-ml-2" href="encuestas.jsp">Encuestas</a></li>
                    </div>
                    <li>
                        <div class="px-2 py-1 rounded-md bg-red-400"><a class="no-underline font-bold" href="http://localhost:8080/Lab02-DMAW-P3/ServletCerrarSesion">Cerrar Sesión</a></div>
                    </li>
                </ul>
            </nav>
        </div>
        
    </div>
</nav>
</html>
