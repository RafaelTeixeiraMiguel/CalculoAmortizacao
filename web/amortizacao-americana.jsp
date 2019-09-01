<%-- 
    Document   : amortizacao-americana
    Created on : 26/08/2019, 23:10:03
    Author     : Rafael Teixeira Miguel
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Americana</title>
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/form.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="shortcut icon" href="img/java.PNG">
        <link href="https://fonts.googleapis.com/css?family=Lato&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body>
        <div>
            <%@include file="WEB-INF/jspf/header.jspf"%>
        </div>
        <div class="container1">
            <h3>Amortização Americana</h3><br/><br/>
            <% if (request.getParameter("calcular")==null) {%>
            <form>
                <div>
                    <div class="group">      
                        <input type="number" step="any" name="divida" required/>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label class='c'>Valor da Dívida</label>
                    </div>
                    <div class="group">      
                        <input type="number" step="any" name="numeroPrestacao" required/>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label class='c'>Número de Prestações</label>
                    </div>
                    <div class="group">      
                        <input type="number" step="any" name="taxaMensal" required/>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label class='c'>Juros Mensal</label>
                    </div>
                </div>
                <div>
                    <input type="submit" class="btn btn-primary" name="calcular" value="Calcular"/>
                </div>
            </form>
            <%}else{%>
            <%double divida = Double.parseDouble(request.getParameter("divida"));%>
            <%int numeroPrestacao = Integer.parseInt(request.getParameter("numeroPrestacao"));%>
            <%double taxaMensal = Double.parseDouble(request.getParameter("taxaMensal"));%>
            <%double amotizacao = 0;%>
            <%double jurosMensal = 0;%>
            <%double totalJurosPago = 0;%>
            <%double totalDividaPago = 0;%>
            <%DecimalFormat df = new DecimalFormat("0.00");%>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>N. Prestação</th>
                        <th>Amortização</th>
                        <th>Juros (<%=taxaMensal%>% de <%=divida%>)</th>
                        <th>Saldo Devedor</th>
                    </tr>
                </thead>
                <%taxaMensal /= 100;%>
                <%jurosMensal = divida * taxaMensal;%>
                <%totalJurosPago = jurosMensal*numeroPrestacao;%>
                <%totalDividaPago = totalJurosPago + divida;%>
                <%for (int i = 1; i <= numeroPrestacao; i++) {%>
                <tbody>
                    <tr>
                        <td><%=i%></td>
                        <%if(i == numeroPrestacao){%>
                        <%amotizacao = divida;%>
                        <%divida = 0;%>
                        <%}%>
                        <td><%=amotizacao%></td>
                        <td><%=df.format(jurosMensal)%></td>
                        <td><%=divida%>
                    </tr>
                    <%}%>
                </tbody>
            </table><br/>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Total de juros pago</th>
                        <th>Total da Divida pago</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%=df.format(totalJurosPago)%></td>
                        <td><%=df.format(totalDividaPago)%></td>
                    </tr>
                </tbody>
            </table>
            <%}%>
        </div>
        <footer class="footer">
            <%@include file="WEB-INF/jspf/footer.jspf"%>
        </footer>
    </body>
</html>
