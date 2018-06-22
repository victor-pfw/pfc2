
<%@page import="java.util.List"%>
<%@page import="Modelo.Reserva"%>
<%@page import="Modelo.Lugares"%>
<%@page import="Modelo.LugaresDAO"%>
<%@page import="Modelo.ReservaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%@page import="Modelo.Usuario"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="css/logout.css" rel="stylesheet" type="text/css"/>
        <link href="css/reserva.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Lugares disponíveis</title>


    </head>
    <form action="ControleLugares" method="post">

        <fieldset>
            <input type="date" name="data_reserva" required>
        </fieldset>
        <br>                      
        <button type="submit" value="ConsultaLugaresPorDataCliente" name="acao" class="botao">Consultar</button>

        <button type="submit" onclick="window.location.href = 'reserva.jsp'" class="botao   ">Voltar</button>   

        <p class="copyright">Gustus</p>
    </form>



</body>
</html>
