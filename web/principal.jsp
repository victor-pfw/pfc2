<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Restaurante</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/funcoes.js" type="text/javascript"></script>
        <script src="js/ajax.js" type="text/javascript"></script>
        <link href="zDeliccio/css/contactform.css" rel="stylesheet" type="text/css"/>
        <link href="zDeliccio/css/layout.css" rel="stylesheet" type="text/css"/>
       
        <script src="assets/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <link href="css/permissao.css" rel="stylesheet" type="text/css"/>
        <script src="assets/bootstrap/js/npm.js" type="text/javascript"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="assets/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/bootstrap/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="css/logout.css" rel="stylesheet" type="text/css"/>
        <link href="zDeliccio/css/reset.css" rel="stylesheet" type="text/css"/>
        <link href="zDeliccio/css/responsive.css" rel="stylesheet" type="text/css"/>
        <link href="zDeliccio/css/responsiveslides.css" rel="stylesheet" type="text/css"/>
        <link href="zDeliccio/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="zDeliccio/css/zerogrid.css" rel="stylesheet" type="text/css"/>
        <script src="zDeliccio/js/Forum_400.font.js" type="text/javascript"></script>
        <script src="zDeliccio/js/atooltip.jquery.js" type="text/javascript"></script>
        <script src="zDeliccio/js/css3-mediaqueries.js" type="text/javascript"></script>
        <script src="zDeliccio/js/cufon-replace.js" type="text/javascript"></script>
        <script src="zDeliccio/js/cufon-yui.js" type="text/javascript"></script>
        <script src="zDeliccio/js/html5.js" type="text/javascript"></script>
        <script src="zDeliccio/js/jquery-1.6.js" type="text/javascript"></script>
        <script src="zDeliccio/js/jquery.easing.1.3.js" type="text/javascript"></script>
        <script src="zDeliccio/js/responsiveslides.js" type="text/javascript"></script>
        <script src="zDeliccio/js/script.js" type="text/javascript"></script>
        <script src="zDeliccio/js/tms-0.3.js" type="text/javascript"></script>
        <script src="zDeliccio/js/tms_presets.js" type="text/javascript"></script>
        <script>
            $(function () {
                $("#slidez").responsiveSlides({
                    auto: true,
                    pager: false,
                    nav: true,
                    speed: 500,
                    maxwidth: 960,
                    namespace: "centered-btns"
                });
            });
        </script>

    </head>
    <body id="page1">
        <div class="body6">
            <div class="body1">
                <div class="body5">
                    <div class="main zerogrid">
                        <%
                            //recupera o usuario da sessao
                            Usuario usuario = (Usuario) session.getAttribute("usuarioAutenticado");

                            if (usuario != null) {

                        %>
                        <div class="container">
                            <div class="jumbotron">
                                <p class="titulo" id="tit1">Restaurante Gustus</p> 
                                <p class="titulo" id="tit2">Bem-vindo ao Sistema Gustus <%=usuario.getLogin()%> !</p>
                                <%}%>
                            </div> 


                            <!-- header -->
                            <header>
                                <!--<h1><a href="index.html" id="logo"><img src="images/logo.png"/></a></h1>-->

                                <nav>
                                    <ul id="top_nav">
                                       <!-- <li><a href="principal.jsp" class="botao"> Home </a></li>-->
                                       <!-- <li><a href="ControleAcesso?acao=Sair" class="botao">Sair</a> </li>-->
                                       <!-- <li class="end"><a href="Contacts.html"><img src="zDeliccio/images/icon_3.gif" alt=""></a></li> -->
                                    </ul>
                                </nav>
                            
                                    <ul id="menu">
                                        <!--<li class="active"><a href="index.html">Home</a></li>-->
                                        <li><a href="reserva.jsp" class="botao">Faça Sua Reserva</a></li>
                                         <li><a href="principal.jsp" class="botao"> Home </a></li>
                                        <li><a href="ControleAcesso?acao=Sair" class="botao">Sair</a> </li>
                                        <!--<li><a href="Wine.html">Wine List</a></li>
                                        <li><a href="CookBook.html">CookBook</a></li>
                                        <li><a href="Contacts.html">Contatos</a></li>-->
                                    </ul>
                                </nav>
                            </header>
                            <!-- / header -->
                            <!-- content -->
                            <article id="content">
                                <div class="slider_bg">
                                    <div class="slider">
                                        <ul class="items">
                                            <li>
                                                <img src="zDeliccio/images/comida_1.jpg" alt="">
                                                <div class="banner">
                                                    <strong>Carne<span>Suculenta</span></strong>
                                                    <b>Especialidade da casa</b>
                                                    <p>
                                                        <span>Carne assada na brasa<br>
                                                            temperada com especiarias nobres, macia e saborosa! Especialidade da casa desde o ano 1987.</span>
                                                    </p>
                                                </div>
                                            </li>
                                            <li>
                                                <img src="zDeliccio/images/nhoque.jpg" alt="">
                                                <div class="banner">
                                                    <strong>Massas<span></span></strong>
                                                    <b>As melhores especialidades em massas</b>
                                                    <p>
                                                        <span>Conheça nossos deliciosos<br>
                                                            pratos de massas caseiras que transformam o comum em extraordinário!</span>
                                                    </p>
                                                </div>
                                            </li>

                                            <li>
                                                <img src="zDeliccio/images/caranguejo.jpg" alt="">
                                                <div class="banner">
                                                    <strong>Frutos<span>do mar</span></strong>
                                                    <b>Rodízio de frutos do mar frescos</b>
                                                    <p>
                                                        <span>Com especialidade em<br>
                                                            caldo de caranguejo e bobó de camarão! </span>
                                                    </p>
                                                </div>
                                            </li>
                                            <li>
                                                <img src="zDeliccio/images/bolo.jpg" alt="">
                                                <div class="banner">
                                                    <strong>Sobre<span>Mesas</span></strong>
                                                    <b>Sobremesas de dar água na boca</b>
                                                    <p>
                                                        <span>E para adoçar mais ainda seu dia, <br>
                                                            sobremesas feitas especialmente pensadas em você! </span>
                                                    </p>
                                                </div>
                                            </li>
                                            <li>
                                                <img src="zDeliccio/images/vinho.jpg" alt="">
                                                <div class="banner">
                                                    <strong>Nossos<span>Vinhos</span></strong>
                                                    <b>Uma maravilhosa adega de vinhos</b>
                                                    <p>
                                                        <span>Venha conhecer nossa <br>
                                                            espetacular adega subterrânea!</span>
                                                    </p>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="slider-response">
                                        <div class="rslides_container">
                                            <ul class="rslides" id="slidez">
                                                <li><img src="images/img1.jpg" alt=""></li>
                                                <li><img src="images/img2.jpg" alt=""></li>
                                                <li><img src="images/img3.jpg" alt=""></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="wrap">
                                    <section class="col-1-3"><div class="wrap-col">
                                            <div class="box">
                                                <div>
                                                    <h2>Venha<span>Nos conhecer!</span></h2>
                                                    <!-- <figure><img src="images/page1_img1.jpg" alt="" ></figure>-->
                                                    <p class="pad_bot1">Nosso restaurante esta localizado na Av. João Alameda 193 Vila Oliveira  Mogi das Cruzes - SP </p>
                                                    <!-- <a href="#" class="button1">Read More</a>-->
                                                </div>
                                            </div>
                                        </div></section>
                                    <section class="col-1-3"><div class="wrap-col">
                                            <div class="box">
                                                <div>
                                                    <h2>Sobre<span>Nós</span></h2>
                                                    <!--<figure><img src="images/page1_img2.jpg" alt="" ></figure>-->
                                                    <p class="pad_bot1">O Gustus é um restaurante de ambiente familiar fundado no ano de 1987, começou em um simples e pequeno salão. </p>
                                                    <!-- <a href="#" class="button1">Read More</a>-->
                                                </div>
                                            </div>
                                        </div></section>
                                    <section class="col-1-3"><div class="wrap-col">
                                            <div class="box">
                                                <div>
                                                    <h2>Suas <span>Reservas</span></h2>
                                                    <!--<figure><img src="images/page1_img3.jpg" alt="" ></figure>-->
                                                    <p class="pad_bot1">Consulte suas reservas</p>

                                                    <a href="ControleReserva?acao=ConsultasReservasCliente&id_Usuario=<%=usuario.getId_usuario()%>" class="button1">Histórico de Reservas</a>
                                                </div>
                                            </div>
                                        </div></section>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
            </div>


            <div class="body3">

                <div class="main zerogrid">
                    <!-- footer -->

                    <!--   <div>
                            <section class="col-2-3">
    
                                <h3>Deixe seu comentário </h3>
                                <form name="ControleComentario">  
                                    Escreva seu comentário:<br/>  
                                    <textarea name="comment" style="width:300px;height:100px" required>  
                                    </textarea>
                                     </section>
                            <br/>  
                             <br/> 
                            
                                       
    
                                    <section class="col-1-3">
                                        Digite seu e-mail:<br/>  
                                        <input type="text" name="email" required/><br/><br/>  
                                        <input type="button" value="Postar comentário" onclick="comentario()">  
                                    </section>
                                </form>  
    
                        
                            <span id="mylocation"></span>  
    
    
                        </div>
    
    
                    -->



                </div>
                <!-- {%FOOTER_LINK} -->
                <!-- / footer -->
            </div>

        </div>
        <script type="text/javascript"> Cufon.now();</script>
    </body>
</html>