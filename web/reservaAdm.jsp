
<%@page import="java.util.List"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Lugares"%>
<%@page import="Modelo.LugaresDAO"%>
<%@page import="Modelo.ReservaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <script src="js/alertaCadastro.js" type="text/javascript"></script>
        <link href="css/reserva.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Faça sua reserva</title>

    </head>
    <body>
        <%
            //recupera o usuario da sessao
            Usuario usuario = (Usuario) session.getAttribute("usuarioAutenticado");

            if (usuario != null) {

        %>


        <%      String msg = (String) request.getAttribute("msg_reserva");
            if (msg != null) {
        %>      
    <Center><font color="white"><%=msg%></font></center> 
        <%}%>
    <div class="container">  
        <form id="contact" action="ControleReserva" method="post">
            <h3><b>Faça reserva para seu cliente </b></h3>
           
            <fieldset>
                <label>Nome</label>
                <input type="text" placeholder="Digite o nome do cliente"   name="nome_reserva"  required >
            </fieldset>

            <fieldset>
                <label>E-mail </label>
                <input type="email"  placeholder="Digite o e-mail do cliente" name="email_endereco" required>
            </fieldset>
            <fieldset>
                <label>Telefone</label>
                <input type="text" placeholder="Digite o telefone do cliente" name="telefone_reserva" required>
            </fieldset>
            <fieldset>
                <label>Data da reserva</label>
                <input type="date" placeholder="Digite a data da reserva" name="data_reserva" required>
            </fieldset>
            <fieldset>
                <label>Hora da reserva</label>
                <input type="time" placeholder="hora da reserva" name="hora_reserva"   required>
            </fieldset>

            <label>Numero de pessoas(Minimo 1 ,maximo 30)</label>
            <input type="number" placeholder="Quantidade de pessoas" name="quantidade_pessoas" min="1" max="30"  required>
            </fieldset>
            <fieldset>
                <label>Código do cliente</label>
                <input  type="text"   name="fk_key_reserva" name="codigo_cliente" required>
            </fieldset>


            <fieldset>
                <button type="submit" value="EnviarAdm" name="acao"  >Reservar</button>

            </fieldset>
            <button type="submit" onclick="window.location.href = 'admin/administrador.jsp'">Voltar</button>  

            <p class="copyright">Gustus</p>
            <%}%>
        </form>





    </div>

</body>
</html>