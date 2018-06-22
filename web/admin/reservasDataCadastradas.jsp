

<%@page import="java.util.List"%>
<%@page import="Modelo.Reserva"%>
<%@page import="Modelo.Reserva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="Modelo.Usuario"%>

<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Reservas por data</title>
        <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
        <meta charset="utf-8">

        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
     
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
       
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
      
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        
        <link href="css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>

        <link href="css/_all-skins.min.css" rel="stylesheet" type="text/css"/>

        <script src="js/jquery-2.2.3.min.js" type="text/javascript"></script>
     
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
      
        <script src="js/jquery.slimscroll.min.js" type="text/javascript"></script>
       
        <script src="js/fastclick.js" type="text/javascript"></script>
     
        <script src="js/app.min.js" type="text/javascript"></script>
      
        <script src=".js/demo.js" type="text/javascript"></script>

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
                                   
                                    <li class="user-header">
                                        <img src="imagens/pfc.jpg" class="img-circle" alt="User Image">

                                        <p>Administrador: <%=usuario.getLogin()%></p>

                                    </li>
                
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
                                <li><<a href="cadastroUsuario.jsp"><i class="fa fa-circle-o"></i>Cadastro de usuário</a></li>
                                <li><a href="ControleReserva?acao=Listar"><i class="fa fa-circle-o"></i>Controladora de reservas</a></li>
                                <li><a href="admin/consultaReservaData.jsp"><i class="fa fa-circle-o"></i>Consulta de reserva por data</a></li>
                                <li><a href="ControleUsuario?acao=ListarUsuarios"><i class="fa fa-circle-o"></i>Usuários cadastrados </a></li>
                                <li><a href="ControleReserva?acao=HistoricoReserva"><i class="fa fa-circle-o"></i>Histórico de reservas</a></li>
                                <li><a href="admin/atualizaQuantidadeLugares.jsp"><i class="fa fa-circle-o"></i>Lugares para reserva</a></li>
                                <li><a href="reservaAdm.jsp"><i class="fa fa-circle-o"></i>Reserve para o cliente</a></li>
                                <li><a href="ControleReserva?acao=FilaGeral"><i class="fa fa-circle-o"></i>Histórico da fila</a></li>
                                <li><a href="admin/consultaLugaresPorData.jsp"><i class="fa fa-circle-o"></i>Consulta de lugares disponíveis</a></li>

                            </ul>
                        </li>

                    </ul>
                </section>
    
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

             

                    <div class="box">
                          <h1> Relatório de reservas por data</h1>
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
                                <th>Id</th>
                                <th>Nome</th>
                                <th>Email</th>
                                <th>Telefone</th>
                                <th>Data da reserva</th>
                                <th>Hora da reserva</th>
                                <th>Quantidade de pessoas</th>
                                <th colspan =2>Ações</th>
                                </thead>

                                <%
                                    List<Reserva> exibirReservasPorData = (List<Reserva>) request.getAttribute("retornaListaPorData");

                                    for (Reserva g : exibirReservasPorData) {
                                %>

                                <tr>
                                    <td><%=g.getId_reserva()%></td>
                                    <td><%=g.getNome()%></td>
                                    <td><%=g.getEmail()%></td>
                                    <td><%=g.getTelefone()%></td>
                                    <td><%=g.getData_reserva()%></td>
                                    <td><%=g.getHora_reserva()%></td>
                                    <td><%=g.getQuantidade_pessoa()%></td>
                                    <td><a href="ControleReserva?acao=SelectPorId&id_reserva=<%=g.getId_reserva()%>"class="btn">Alterar</a></td>     

                                </tr>
                                <%
                                    }
                                %>
                            </table>

                        </div>





                    </div>

            </div>

    </div>
<div class="control-sidebar-bg"></div>

</body>
</html>
