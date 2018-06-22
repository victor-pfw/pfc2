<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Restaurant</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../js/funcoes.js" type="text/javascript"></script>
        <script src="../js/ajax.js" type="text/javascript"></script>
        
        <link href="../zDeliccio/css/contactform.css" rel="stylesheet" type="text/css"/>
        <link href="../zDeliccio/css/layout.css" rel="stylesheet" type="text/css"/>
        <link href="../zDeliccio/css/reset.css" rel="stylesheet" type="text/css"/>
        <link href="../zDeliccio/css/responsive.css" rel="stylesheet" type="text/css"/>
        <link href="../zDeliccio/css/responsiveslides.css" rel="stylesheet" type="text/css"/>
        <link href="../zDeliccio/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../zDeliccio/css/zerogrid.css" rel="stylesheet" type="text/css"/>
        <script src="../zDeliccio/js/Forum_400.font.js" type="text/javascript"></script>
        <script src="../zDeliccio/js/atooltip.jquery.js" type="text/javascript"></script>
        <script src="../zDeliccio/js/css3-mediaqueries.js" type="text/javascript"></script>
        <script src="../zDeliccio/js/cufon-replace.js" type="text/javascript"></script>
        <script src="../zDeliccio/js/cufon-yui.js" type="text/javascript"></script>
        <script src="../zDeliccio/js/html5.js" type="text/javascript"></script>
        <script src="../zDeliccio/js/jquery-1.6.js" type="text/javascript"></script>
        <script src="../zDeliccio/js/jquery.easing.1.3.js" type="text/javascript"></script>
        <script src="../zDeliccio/js/responsiveslides.js" type="text/javascript"></script>
        <script src="../zDeliccio/js/script.js" type="text/javascript"></script>
        <script src="../zDeliccio/js/tms-0.3.js" type="text/javascript"></script>
        <script src="../zDeliccio/js/tms_presets.js" type="text/javascript"></script>
        
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
                                        <li><a href="principal.jsp"><img src="zDeliccio/images/icon_1.gif" alt=""></a></li>
                                        <li><a href="#"><img src="zDeliccio/images/icon_2.gif" alt=""></a></li>
                                        <li class="end"><a href="Contacts.html"><img src="zDeliccio/images/icon_3.gif" alt=""></a></li>
                                    </ul>
                                </nav>
                                <nav>
                                    <ul id="menu">
                                        <li class="active"><a href="index.html">Home</a></li>
                                        <li><a href="../reservaAdm.jsp">Faça reseva para seu cliente</a></li>
                                        <li><a href="Wine.html">Wine List</a></li>
                                        <li><a href="CookBook.html">CookBook</a></li>
                                        <li><a href="Contacts.html">Contacts</a></li>
                                        <li><a href="administrador.jsp">Volte para página ADM</a></li>
                                    </ul>
                                </nav>
                            </header>
                            <!-- / header -->
                            <!-- content -->
                            <article id="content">
                                <div class="slider_bg">
                                    <div class="slider">
                                        <ul class="items">
                                            <div class="wrap">
                                            <li>
                                                <img src="zDeliccio/images/nhoque.jpg" alt="">
                                                <div class="banner">
                                                    <strong>Italian<span>Fettuccine</span></strong>
                                                    <b>Dish of the Day</b>
                                                    <p>
                                                        <span>Lorem ipsum dolamet consectetur<br>
                                                            adipisicing elit, sed do eiusmod tempor aliqua enim ad minim veniam, quis nosinci- didunt ut labore et dolore.</span>
                                                    </p>
                                                </div>
                                            </li>
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
                                                <img src="zDeliccio/images/caranguejo.jpg" alt="">
                                                <div class="banner">
                                                    <strong>succulent<span>meat</span></strong>
                                                    <b>Dish of the Day</b>
                                                    <p>
                                                        <span>Lorem ipsum dolamet consectetur <br>
                                                            adipisicing elit, sed do eiusmod tempor aliqua enim ad minim veniam, quis nosinci- didunt ut labore et dolore.</span>
                                                    </p>
                                                </div>
                                            </li>
                                            <li>
                                                <img src="zDeliccio/images/bolo.jpg" alt="">
                                                <div class="banner">
                                                    <strong>French-Style<span>Tartlet</span></strong>
                                                    <b>Dish of the Day</b>
                                                    <p>
                                                        <span>Lorem ipsum dolamet consectetur <br>
                                                            adipisicing elit, sed do eiusmod tempor aliqua enim ad minim veniam, quis nosinci- didunt ut labore et dolore.</span>
                                                    </p>
                                                </div>
                                            </li>
                                            <li>
                                                <img src="zDeliccio/images/vinho.jpg" alt="">
                                                <div class="banner">
                                                    <strong>French-Style<span>Tartlet</span></strong>
                                                    <b>Dish of the Day</b>
                                                    <p>
                                                        <span>Lorem ipsum dolamet consectetur <br>
                                                            adipisicing elit, sed do eiusmod tempor aliqua enim ad minim veniam, quis nosinci- didunt ut labore et dolore.</span>
                                                    </p>
                                                </div>
                                            </li>
                                            </div>
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
                                                    <h2>Welcome <span>to Us!</span></h2>
                                                    <figure><img src="images/page1_img1.jpg" alt="" ></figure>
                                                    <p class="pad_bot1">This <a href="http://blog.templatemonster.com/2011/08/01/free-website-template-jquery-slider-typography-restaurant/" class="list_1">Deliccio Template</a> goes with two packages ? with PSD source files and without them. PSD source is available for free for the registered members.</p>
                                                    <a href="#" class="button1">Read More</a>
                                                </div>
                                            </div>
                                        </div></section>
                                    <section class="col-1-3"><div class="wrap-col">
                                            <div class="box">
                                                <div>
                                                    <h2>About <span>Us</span></h2>
                                                    <figure><img src="images/page1_img2.jpg" alt="" ></figure>
                                                    <p class="pad_bot1">This is one of <a href="http://blog.templatemonster.com/free-website-templates/" target="_blank">free website templates</a> created by TemplateMonster.com team. This website template is optimized for 1024x768 screen res.</p>
                                                    <a href="#" class="button1">Read More</a>
                                                </div>
                                            </div>
                                        </div></section>
                                    <section class="col-1-3"><div class="wrap-col">
                                            <div class="box">
                                                <div>
                                                    <h2>Suas <span>Reservas</span></h2>
                                                    <figure><img src="images/page1_img3.jpg" alt="" ></figure>
                                                    <p class="pad_bot1">This is one of </p>

                                                    <a href="#" class="button1">Histórico de Reservas</a>
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

                    <div>
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






                </div>
                <!-- {%FOOTER_LINK} -->
                <!-- / footer -->
            </div>

        </div>
        <script type="text/javascript"> Cufon.now();</script>
    </body>
</html>