<%-- 
    Document   : login
    Created on : Nov 9, 2022, 12:23:55 AM
    Author     : deuseli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesión</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <div class="flex justify-center items-center">
            <div class="h-auto w-[30%] flex justify-start flex-col items-start bg-slate-100 rounded-3xl mt-10">
                <div class="w-full p-10">
                    <!--Inicio del Bloque del Formulario-->
                    <form method="POST" action="../ServletLogin">
                        <!-- Correo -->
                        <div class="font-bold text-lg mr-3">
                            Correo
                        </div>
                        <input class="w-full rounded-md focus:outline-none px-3 py-2 mt-2 mb-3" type="email" name="email">
                        <!-- Password -->
                        <div class="font-bold text-lg mr-3">
                            Password
                        </div>
                        <input class="w-full rounded-md focus:outline-none px-3 py-2 mt-2 mb-10" type="password" name="password">
                        <input class="w-full px-3 py-2 bg-blue-500 font-bold text-white rounded-md" type="submit" name="login" value="Iniciar Sesión">
                    </form>
                    <!--Fin del Bloque del Formulario-->
                </div>
                <div class="flex flex-col w-full p-10 pt-0">
                    <div class='bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded'>
                        <strong class='font-bold'>¡Error en inicio de sesión!</strong><br>
                        <!--<span class='ml-2'><//c:out value=""/></span>-->
                        <span class=''><c:out value="Contraseña o correo incorrecto"/></span>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
