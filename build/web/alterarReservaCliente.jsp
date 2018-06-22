
<%@page import="java.util.List"%>
<%@page import="Modelo.Reserva"%>
<%@page import="Modelo.Lugares"%>
<%@page import="Modelo.LugaresDAO"%>
<%@page import="Modelo.ReservaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>

        <link href="css/reserva.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faça sua reserva</title>

    </head>
    <body>



        <%
            List<Reserva> exibirPorId = (List<Reserva>) request.getAttribute("listaPorIdCliente");

            for (Reserva usuario : exibirPorId) {
        %>



        <div class="container">  

            <form id="contact" action="ControleReserva" method="post">
                <h3><b>Altere os dados da sua reserva <%=usuario.getNome()%> </b></h3>
              
                <input type="text"  name="nome_reserva" value="<%=usuario.getNome()%>">

                <fieldset>
                    <input type="email" placeholder="Digite seu e-mail" name="email_endereco" value="<%=usuario.getEmail()%>" >
                </fieldset>

                <fieldset>
                    <input type="text" placeholder="Digite seu telefone" name="telefone_reserva"  value="<%=usuario.getTelefone()%>">
                </fieldset>
                <fieldset>
                    <input type="date" placeholder="Digite a data da reserva" name="data_reserva" value="<%=usuario.getData_reserva()%>">
                </fieldset>
                <fieldset>
                    <input type="time" placeholder="hora da reserva" name="hora_reserva"   value="<%=usuario.getHora_reserva()%>">
                </fieldset>
                <fieldset>
                    <label>Numero de pessoas(Minimo 1 ,maximo 30 , Em caso de alteração de quantidade de lugares, favor realizar uma nova reserva)</label>
                    <input  type="hidden" name="quantidade_pessoas" min="1" max="30" value="<%=usuario.getQuantidade_pessoa()%>">
                </fieldset>
                <fieldset>
                    <input  type="hidden"   name="id_reserva" value="<%=usuario.getId_reserva()%>">
                </fieldset>
                <%--  <fieldset>
                   <textarea placeholder="Observações" required></textarea>
                 </fieldset>
                --%>
                <fieldset>
                    <button type="submit"  value="AlterarCliente" name="acao" >Alterar dados</button>

                </fieldset>
                <fieldset>
                    <button type="submit"><a href="principal.jsp">Voltar</a></button>
                </fieldset>
                  
                <p class="copyright">Gustus</p>
            </form>


            <%
                }
            %>


        </div>

    </body>
</html>