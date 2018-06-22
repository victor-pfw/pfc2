<%@page import="Modelo.Lugares"%>
<%@page import="Modelo.Reserva"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Reservas Clientes</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
     
        <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
        <meta charset="utf-8">
        <link href="css/salvar.css" rel="stylesheet" type="text/css"/>
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
        
        <script src="zDeliccio/js/Telefone.js" type="text/javascript"></script>
     
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


    <body >

        

        <section class="content">

            <!-- Default box -->
            <div class="box">
                <h1>Lugares disponíveis pela data selecionada </h1>
                <div class="box-header with-border">
                    <h3 class="box-title"></h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Minimizar">
                            <i class="fa fa-minus"></i></button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Fechar">
                            <i class="fa fa-times"></i></button>
                    </div>
                </div>
                <div class="box-body">
                    <table class="table">
                        <thead style="background-color:#680000; color: #FFF">
                
                        <th>Quantidade de lugares </th>
                      
                        </thead>

                        <%
                            List<Lugares> exibir = (List<Lugares>) request.getAttribute("retornaQuantidadeDisponiveisPorDataCliente");

                            for (Lugares r : exibir) {
                        %>

                        <tr>
                            <td><%=r.getQuantidade() %></td>
                          
                           

                        </tr>
                        <%
                            }
                        %>
                    </table>
                    <button type="submit" onclick="window.location.href = 'consultarLugaresPorDataCliente.jsp'" class="btn">Voltar</button>   



                </div>
                <!-- /.box-body -->
                <div class="box-footer">

                </div>
                <!-- /.box-footer-->
            </div>
            <!-- /.box -->

        </section>





    </body>
</html>



