
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

        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/jquery.mask.min.js" type="text/javascript"></script>
        <script type="text/javascript"> 
     $(document).ready(function(){
         $('#telefone').mask('(00) 00000-0000');
     }) 
        </script>
        
      
        

        <title>Faça sua reserva</title>
      
    </head>
    <body>
         <%
             //recupera o usuario da sessao
            Usuario usuario = (Usuario) session.getAttribute("usuarioAutenticado");

            if (usuario != null) {
        
  %>
  
  
  <%

            String msg = (String) request.getAttribute("msg_reserva");
            if (msg != null) {
        %>      
    <Center><font color="white"><%=msg%></font></center> 
        <%}%>
        <div class="container">  
            <form id="contact" action="ControleReserva" method="post">
                <h3><b>Reserva</b></h3>

                <fieldset>
                    <input type="text"  name="nome_reserva"   value="<%=usuario.getLogin() %>" >
                </fieldset>
                
                <fieldset>
                    <input type="email"  name="email_endereco"  value="<%=usuario.getEmail() %>">
                </fieldset>
                <fieldset>
                    <input type="text"  placeholder=" Telefone(00)00000-0000" name="telefone_reserva" id="telefone"   required >
                  
                </fieldset>
                <fieldset>
                    <input type="date"  name="data_reserva" required>
                </fieldset>
                <fieldset>
                    <input type="time" placeholder="hora da reserva" name="hora_reserva"   required>
                </fieldset>
              
                    <label>Numero de pessoas(Minimo 1 ,maximo 30)</label>
                    <input type="number" placeholder="Quantidade de pessoas" name="quantidade_pessoas" min="1" max="30"  required>
                </fieldset>
                 <fieldset>
                  
                     <input   type="hidden" name="fk_key_reserva" value="<%=usuario.getId_usuario() %>">
                </fieldset>
               
             
                <fieldset>
                    <button type="submit" value="Enviar" name="acao"  >Reservar</button>

                </fieldset>
                
                   <button type="submit" onclick="window.location.href ='consultarLugaresPorDataCliente.jsp'">Consulte lugares disponíveis</button>


                <button type="submit" onclick="window.location.href = 'principal.jsp'">Voltar</button>   
               
                <p class="copyright">Gustus</p>
               <%}%>
            </form>





        </div>

    </body>
</html>