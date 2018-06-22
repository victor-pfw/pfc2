<%@page import="Modelo.Usuario"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Administrador | Gustus</title>
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
        <script src="js/demo.js" type="text/javascript"></script><!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->

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
                <!-- Logo -->
                <a href="admin/administrador.jsp" class="logo">

                    <span class="logo-mini"><b>G</b>TS</span>

                    <span class="logo-lg"><b>Administrador</b>/Gustus</span>
                </a>

                <nav class="navbar navbar-static-top">


                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">

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

            <aside class="main-sidebar">
               
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
                                <li><a href="ControleUsuario?acao=ListarUsuarios"><i class="fa fa-circle-o"></i>Usuários cadastrados </a></li>
                                <li><a href="ControleReserva?acao=HistoricoReserva"><i class="fa fa-circle-o"></i>Histórico de reservas</a></li>
                                <li><a href="admin/atualizaQuantidadeLugares.jsp"><i class="fa fa-circle-o"></i>Lugares para reserva</a></li>
                                <li><a href="reservaAdm.jsp"><i class="fa fa-circle-o"></i>Reserve para o cliente</a></li>
                                <li><a href="ControleReserva?acao=FilaGeral"><i class="fa fa-circle-o"></i>Histórico da fila</a></li>
                                <li><a href="admin/consultaLugaresPorData.jsp"><i class="fa fa-circle-o"></i>Consulta de lugares disponíveis</a></li>

                                <!-- <li><a href="principalAdm.jsp"><i class="fa fa-circle-o"></i>Site principal</a></li>-->


                            </ul>
                        </li>

                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- =============================================== -->

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Cadastro de Usuário 
                        <small>Restaurante Gustus</small>
                        <%

                            String msg = (String) request.getAttribute("msg");
                            if (msg != null) {
                        %>      
                        <Center><font color="blue"><%=msg%></font></center> 
                            <%}%>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="admin/administrador.jsp"><i class="fa fa-dashboard"></i> Home</a></li>

                    </ol>
                </section>

                <section class="content">


                    <div class="box">

                        <h3 class="box-title"></h3>


                        <div class="box-header with-border">


                            <form action="ControleUsuario" method="post">
                                <div class="form-group">
                                    <input type="text" placeholder="Email" name="txtEmail"required><br/>
                                </div>
                                <div class="form-group">
                                    <input type="text"  placeholder="login" name="txtLogin"required><br/>
                                </div>
                                <div class="form-group">
                                    <input type="password"  placeholder="Senha" name="txtSenha"required><br/>
                                </div>
                                <div class="form-group">
                                    <select  name="optPerfil">
                                        <option>COMUM</option>
                                        <option>ADMINISTRADOR</option>

                                    </select><br/>
                                </div>
                                <label>
                                    <button type="submit" value="cadastrarUsuario" name="acao" class="btn">Cadastrar</button>
                                    <button type="submit" onclick="window.location.href = 'admin/administrador.jsp'" class="btn">Voltar</button>   
                                </label>

                            </form>


                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fa fa-minus"></i></button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                    <i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            Gustus
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">

                        </div>
                        <!-- /.box-footer-->
                    </div>
                    <!-- /.box -->

                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->



        </form>
    </div>
    <!-- /.tab-pane -->
</div>
</aside>

<div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->


</body>
</html>
