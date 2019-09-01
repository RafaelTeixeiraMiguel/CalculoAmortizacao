<%-- 
    Document   : home
    Created on : 26/08/2019, 23:09:38
    Author     : Rafael Teixeira Miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="shortcut icon" href="img/java.PNG">
        <link href="https://fonts.googleapis.com/css?family=Lato&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body>
        <div>
            <d<%@include file="WEB-INF/jspf/header.jspf" %>
        </div>
        <div class="container1">
            <div>
                <h3 class="p1">Amortização</h2><br/>
                <p>Atividade II - POO<br/>
                A amortização refere-se à quitação de uma dívida por meio de pagamentos feitos gradualmente.<br/>
                Aqui apresentamos o calculo de Amortização Constante, Americana e a Tabela Price.<p>
            </div><br/> 
            <div>
                <h4>Integrantes</h3><br/>
                <div class="row">
                    <div class="col">
                        <img src="img/alan.jpg" class="foto"/><br/>
                        <p class="a">Alan Monteiro<br/>
                        Amortização Constante</p><br/>
                        <img src="img/alex.jpg" class="foto"/><br/>
                        <p class="a">Alex Vaz<br/>
                        Interface Geral</p><br/>                     
                    </div>
                    <div class="col">
                        <img src="img/matus.jpg" class="foto"/><br/>
                        <p class="a">Matusalem Andrade<br/>
                        Amortização Americana</p><br/>
                        <img src="img/rafael.jpg" class="foto"/><br/>
                        <p class="a">Rafael Teixeira<br/>
                        Tabela Price</p><br/>
                    </div> 
                </div>      
            </div>     
        </div>
        <footer class="footer">
            <%@include file="WEB-INF/jspf/footer.jspf" %>
        </footer>
    </body>
</html>
