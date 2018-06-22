<%-- 
    Document   : erro
    Created on : Feb 15, 2017, 12:21:13 PM
    Author     : victoralexandre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Erro Page</title>
    </head>
    <body>
        <h1>Erro</h1>
        <%= ((Exception)request.getAttribute("erro")).getMessage() %>
                
    </body>
</html>
