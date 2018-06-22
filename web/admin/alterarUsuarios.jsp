
<%@page import="Modelo.Usuario"%>
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
            List<Usuario> exibirUsuariosPorId = (List<Usuario>) request.getAttribute("listaUsuarioPorId");

            for (Usuario usuario : exibirUsuariosPorId) {
        %>
        
        
       
        <div class="container">  
            
            <form id="contact" action="ControleUsuario" method="post">
                <h3><b>Altere os dados do usuário : <%=usuario.getLogin() %></b></h3>
           
                <fieldset>
                    <label>E-mail do usuário</label>
                    <input type="email" placeholder="Digite o novo e-mail" name="email" value="<%=usuario.getEmail()%>" >
                </fieldset>
                 
                <fieldset>
                  <label>Perfil do usuário</label>
                    <input type="text" placeholder="Digite o novo login" name="login"  value="<%=usuario.getPerfil() %>">
                </fieldset>
                <fieldset>
                    <input type="hidden"  name="senha" value="<%=usuario.getSenha()%>">
                </fieldset>
               
                    <input  type="hidden"   name="id_usuario" value="<%=usuario.getId_usuario()%>">
                </fieldset>
               
                <fieldset>
                    <button type="submit"  value="atualizarUsuario" name="acao" >Alterar dados</button>

                </fieldset>


              <a href="ControleUsuario?acao=ListarUsuarios">Voltar</a>   
                <p class="copyright">Gustus</p>
            </form>

                
        <%
            }
        %>


        </div>
                
    </body>
</html>