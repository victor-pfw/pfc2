
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
        <link href="css/reserva.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Lugares disponíveis</title>
   
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
   
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        
        <link href="../css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>

        <link href="../css/_all-skins.min.css" rel="stylesheet" type="text/css"/>

        <script src="../js/jquery-2.2.3.min.js" type="text/javascript"></script>
   
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
 
        <script src="../js/jquery.slimscroll.min.js" type="text/javascript"></script>
     
        <script src="../js/fastclick.js" type="text/javascript"></script>
     
        <script src="../js/app.min.js" type="text/javascript"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="../js/demo.js" type="text/javascript"></script><!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->

        <script language="javascript" src="../js/ajax.js"></script>

        <script language="javascript" src="../js/instrucao.js"></script>

    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <%
            //recupera o usuario da sessao
            Usuario usuario = (Usuario) session.getAttribute("usuarioAutenticado");

            if (usuario != null) {

        %>

        <!-- Puxando usuário logado -->

        <div class="wrapper">

            <header class="main-header">
         
                <a href="administrador.jsp" class="logo">
             
                    <span class="logo-mini"><b>G</b>TS</span>
 
                    <span class="logo-lg"><b>Administrador</b>/Gustus</span>
                </a>
          
                <nav class="navbar navbar-static-top">
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
         
                            

                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="../imagens/pfc.jpg" class="user-image" alt="User Image">
                                    <span class="hidden-xs"><%=usuario.getLogin()%></span>
                                </a>
                                <ul class="dropdown-menu">
                               
                                    <li class="user-header">
                                        <img src="../imagens/pfc.jpg" class="img-circle" alt="User Image">

                                        <p>Administrador: <%=usuario.getLogin()%></p>

                                    </li>
                    
                                    <li class="user-footer">
                                        <div class="pull-left">

                                        </div>
                                        <div class="pull-right">
                                            <a href="../ControleAcesso?acao=Sair" class="btn btn-default btn-flat">Sair</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                </nav>
            </header>

            <aside class="main-sidebar">
    
                <section class="sidebar">
         
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="../imagens/pfc.jpg" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p><%=usuario.getLogin()%></p>
                            <%}%>
                          
                        </div>
                    </div>
                

                    <ul class="sidebar-menu">
 
                        <li class="treeview active">
                            <a href="#">
                                <i class="fa fa-folder"></i> <span>Funções</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="../cadastroUsuario.jsp"><i class="fa fa-circle-o"></i>Cadastro de usuário</a></li>
                                <li><a href="../ControleReserva?acao=Listar"><i class="fa fa-circle-o"></i>Controladora de reservas</a></li>
                               <li><a href="consultaReservaData.jsp"><i class="fa fa-circle-o"></i>Consulta de reserva por data</a></li>
                                <li><a href="../ControleUsuario?acao=ListarUsuarios"><i class="fa fa-circle-o"></i>Usuários cadastrados</a></li>
				<li><a href="../ControleReserva?acao=HistoricoReserva"><i class="fa fa-circle-o"></i>Histórico de reservas</a></li>
                                <li><a href="atualizaQuantidadeLugares.jsp"><i class="fa fa-circle-o"></i>Lugares para reserva</a></li>
                                <li><a href="../reservaAdm.jsp"><i class="fa fa-circle-o"></i>Reserve para o cliente</a></li>
                                <li><a href="../ControleReserva?acao=FilaGeral"><i class="fa fa-circle-o"></i>Histórico da fila</a></li>
                                <li><a href="consultaLugaresPorData.jsp"><i class="fa fa-circle-o"></i>Consulta de lugares disponíveis</a></li>
                            </ul>
                        </li>

                    </ul>
                </section>
 
            </aside>

            <div class="content-wrapper">

                <section class="content-header">
                    <h1>
                     Consulte os lugares disponíveis com rapidez
                        <small>Restaurante Gustus</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="administrador.jsp"><i class="fa fa-dashboard"></i> Home</a></li>

                    </ol>
                </section>

                <section class="content">

                    <div class="box">
                        <div class="box-header with-border">
             <form action="../ControleLugares" method="post">
              
                <fieldset>
                    <input type="date" name="data_reserva" required>
                </fieldset>
                 <br>                      
                <button type="submit" value="ConsultaLugaresPorData" name="acao" class="btn">Consultar</button>
                <button type="submit" onclick="window.location.href = 'administrador.jsp'" class="btn">Voltar</button>   
                
                <p class="copyright">Gustus</p>
            </form>
                              
                            <h3 class="box-title"></h3>

                    </div>

                </section>
                
            </div>
           
        </form>
    </div>

</div>
</aside>

<div class="control-sidebar-bg"></div>
</div>



</body>
</html>
