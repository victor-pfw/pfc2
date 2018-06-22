
<%@page import="Modelo.Usuario"%>

<%@page import="Modelo.Reserva"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Controle de reservas</title>
        <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
        <meta charset="utf-8">
     
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link href="css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>

        <link href="css/_all-skins.min.css" rel="stylesheet" type="text/css"/>

        <!-- jQuery 2.2.3 -->
        <script src="js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!-- SlimScroll -->
        <script src="js/jquery.slimscroll.min.js" type="text/javascript"></script>
        <!-- FastClick -->
        <script src="js/fastclick.js" type="text/javascript"></script>
        <!-- AdminLTE App -->
        <script src="js/app.min.js" type="text/javascript"></script>
        <!-- AdminLTE for demo purposes -->
        <script src=".js/demo.js" type="text/javascript"></script><!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->

        <script language="javascript" src="../js/ajax.js"></script>

        <script language="javascript" src="../js/instrucao.js"></script>

    </head>
    <body onload="start()" class="hold-transition skin-blue sidebar-mini">
        <%
            //recupera o usuario da sessao
            Usuario usuario = (Usuario) session.getAttribute("usuarioAutenticado");

            if (usuario != null) {

        %>

        <!-- Puxando usuário logado -->

        <div class="wrapper">

            <header class="main-header">
                <!-- Logo -->
                <a href="admin/administrador.jsp" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"><b>G</b>TS</span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"><b>Administrador</b>/Gustus</span>
                </a>
                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>

                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                      
                            <!-- User Account: style can be found in dropdown.less -->
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="imagens/pfc.jpg" class="user-image" alt="User Image">
                                    <span class="hidden-xs"><%=usuario.getLogin()%></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="imagens/pfc.jpg" class="img-circle" alt="User Image">

                                        <p>Administrador: <%=usuario.getLogin()%></p>

                                    </li>
                                    <!-- Menu Body -->

                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-left">

                                        </div>
                                        <div class="pull-right">
                                            <a href="ControleAcesso?acao=Sair" class="btn btn-default btn-flat">Sair</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                </nav>
            </header>

            <!-- =============================================== -->

            <!-- Left side column. contains the sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="imagens/pfc.jpg" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p><%=usuario.getLogin()%></p>
                            <%}%>
                         
                        </div>
                    </div>
                    <!-- search form -->
                    <!--  <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                    </form>-->
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                       


                        <li class="treeview active">
                            <a href="#">
                                <i class="fa fa-folder"></i> <span>Funções</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="cadastroUsuario.jsp"><i class="fa fa-circle-o"></i>Cadastro de usuário</a></li>
                                <li><a href="ControleReserva?acao=Listar"><i class="fa fa-circle-o"></i>Controladora de reservas</a></li>
                                <li><a href="admin/consultaReservaData.jsp"><i class="fa fa-circle-o"></i>Consulta de reserva por data</a></li>
                                <li><a href="ControleUsuario?acao=ListarUsuarios"><i class="fa fa-circle-o"></i>Usuários cadastrados</a></li>
				<li><a href="ControleReserva?acao=HistoricoReserva"><i class="fa fa-circle-o"></i>Histórico de reservas</a></li>
                                <li><a href="admin/atualizaQuantidadeLugares.jsp"><i class="fa fa-circle-o"></i>Lugares para reserva</a></li>
                                <li><a href="reservaAdm.jsp"><i class="fa fa-circle-o"></i>Reserve para o cliente</a></li>
                                <li><a href="ControleReserva?acao=FilaGeral"><i class="fa fa-circle-o"></i>Histórico da fila</a></li>
                                <li><a href="admin/consultaLugaresPorData.jsp"><i class="fa fa-circle-o"></i>Consulta de lugares disponíveis</a></li>

                            </ul>
                        </li>

                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                   <h1>
                        Bem vindo administrador
                        <small>Restaurante Gustus</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="admin/administrador.jsp"><i class="fa fa-dashboard"></i> Home</a></li>

                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">

                    <!-- Default box -->
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title"></h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fa fa-minus"></i></button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                    <i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body">


                                <table class="table">
                                      <thead style="background-color: gray; color: #FFF">
                                    <h1>Reservas Cadastradas </h1>
                                    <br></br>

                                    <th>Código da reserva</th>
                                    <th>Nome</th>
                                    <th>Email</th>
                                    <th>Telefone</th>
                                    <th>Data da reserva</th>
                                    <th>Hora da reserva</th>
                                    <th>Quantidade de pessoas</th>
                                    <th colspan =2>Ações</th>
                                    </thead>

                                    <%
                                        List<Reserva> exibir = (List<Reserva>) request.getAttribute("todasReservas");

                                        for (Reserva r : exibir) {
                                    %>

                                    <tr>
                                        <td><%=r.getId_reserva()%></td>
                                        <td><%=r.getNome()%></td>
                                        <td><%=r.getEmail()%></td>
                                        <td><%=r.getTelefone()%></td>
                                        <td><%=r.getData_reserva()%></td>
                                        <td><%=r.getHora_reserva()%></td>
                                        <td><%=r.getQuantidade_pessoa()%></td>
                                        <td><a href="ControleReserva?acao=Excluir&id_reserva=<%=r.getId_reserva()%>&data_reserva=<%=r.getData_reserva()%>&quantidade_pessoas=<%=r.getQuantidade_pessoa()%>" class="btn">Check in de saída / Cancelamento</a></td>    
                                        <td><a href="ControleReserva?acao=SelectPorId&id_reserva=<%=r.getId_reserva()%>" class="btn">Alterar</a></td> 
                                        <td><a href="ControleReserva?acao=Checkin&id_reserva=<%=r.getId_reserva()%>" class="btn">Check in de entrada</a></td> 


                                    </tr>
                                    <%
                                        }
                                    %>
                                </table>

                            </div>
     <h1>Reservas Vencendo </h1>

        <div id="messages"></div>
        <script type="text/javascript">
            var webSocket = new WebSocket(
                    'ws://localhost:8080/SistemaComLogin/websocket');

            webSocket.onerror = function (event) {
                onError(event)
            };

            webSocket.onopen = function (event) {
                onOpen(event)
            };

            webSocket.onmessage = function (event) {
                onMessage(event)
            };

            function onMessage(event) {
                document.getElementById('messages').innerHTML += '<br />'


                        + event.data;

                alert(event.data);






            }



            function onError(event) {
                alert("ERRO");
            }


            function waitForSocketConnection(socket, callback) {
                setTimeout(
                        function () {
                            if (socket.readyState === 1) {
                                console.log("Connection is made")
                                if (callback != null) {
                                    callback();
                                }
                                return;

                            } else {
                                console.log("wait for connection...")
                                waitForSocketConnection(socket, callback);
                            }

                        }, 5); // wait 5 milisecond for the connection...
            }



            function start() {

            
                waitForSocketConnection(webSocket, function () {
                    console.log("message sent!!!");
                    webSocket.send("");
                });
                return false;
            }

            jQuery(document).ready(function () {

            });

        </script>

                        </div>
                      
                    </div>
                    <!-- /.box -->

                </section>
                <!-- /.content -->
            </div>

    </div>
    <!-- /.tab-pane -->
</div>
</aside>

<div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->


</body>
</html>
