<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cadastro</title>

        <!-- CSS -->

        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/form-elements.css">
        <link rel="stylesheet" href="assets/css/style.css">


        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">

    </head>

    <body>

        <%
            String msg = (String) request.getAttribute("msg");
            if (msg != null) {
        %>      
     <center><font color="blue"><%=msg%></font></center>
        <%}%>
    <!-- Top content -->
    <div class="top-content">

        <div class="inner-bg">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2 text">
                        <h1><strong>Gustus</strong> Cadastro</h1>
                        <div class="description">
                            <p>
                                Seja bem vindo, aqui você poderá fazer suas reservas com segurança e agilidade 
                                !
                            </p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 form-box">
                        <div class="form-top">
                            <div class="form-top-left">
                                <h3>Cadastre-se em nosso site </h3>
                                <p>Preencha seus dados abaixo:</p>
                            </div>
                            <div class="form-top-right">
                                <i class="fa fa-lock"></i>
                            </div>
                        </div>
                        <div class="form-bottom">
                            <form action="ControleUsuario" method="post"class="form">
                                <div class="form-group">
                                    <input type="email" name="txtEmail" class="form-control" placeholder="Email"required>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="txtLogin" class="form-control"placeholder="Login"required >
                                </div>
                                <div class="form-group">
                                  <input type="password" name="txtSenha"class="form-control" placeholder="Senha"required>
                                </div>
                                 

                                <button type="submit" value="cadastrarCliente" name="acao" class="btn">Registrar</button>



                                <label>

                                    <a href="index.jsp" class="text-center">Ja tenho cadastro</a>
                                </label>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>



    <script src="assets/js/jquery-1.11.1.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.backstretch.min.js"></script>
    <script src="assets/js/scripts.js"></script>


</body>

</html>

