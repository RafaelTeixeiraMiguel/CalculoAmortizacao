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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Americana JSP</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <h1 style="text-align: center">Amortização Americana</h1>
        <% if (request.getParameter("calcular")==null) {%>
        <div class="container">
            <form>
                <div class="form-group">
                    Dívida: <input type="number" style="margin-top: 50px;margin-left: 79px" step="any" name="divida" required/><br>
                    N° Prestação: <input type="number" style="margin-top: 20px; margin-left: 31px" name="numeroPrestacao" required/><br>
                    Juros mensal: <input type="number" style="margin-top: 20px; margin-left: 30px" step="any" name="taxaMensal" required/><br>
                    <input type="submit" style="margin-top: 30px; margin-left: 255px" class="btn btn-outline-success" name="calcular" value="Calcular"/>
                </div>
            </form>
        </div>
        <%}else{%>
        <%double divida = Double.parseDouble(request.getParameter("divida"));%>
        <%int numeroPrestacao = Integer.parseInt(request.getParameter("numeroPrestacao"));%>
        <%double taxaMensal = Double.parseDouble(request.getParameter("taxaMensal"));%>
        <%double amotizacao = 0;%>
        <%double jurosMensal = 0;%>
        <%double totalJurosPago = 0;%>
        <%double totalDividaPago = 0;%>
        <%DecimalFormat df = new DecimalFormat("0.00");%>
        <table style="margin: auto;margin-top: 50px; text-align: center;" border="1">
            <tr>
                <th>N° Prestação</th>
                <th>Amortização</th>
                <th>Juros(<%=taxaMensal%>% de <%=divida%>)</th>
                <th>Dívida</th>
            </tr>
        <%taxaMensal /= 100;%>
        <%jurosMensal = divida * taxaMensal;%>
        <%totalJurosPago = jurosMensal*numeroPrestacao;%>
        <%totalDividaPago = totalJurosPago + divida;%>
            <%for (int i = 1; i <= numeroPrestacao; i++) {%>
            <tr>
                <td><%=i%></td>
                <%if(i == numeroPrestacao){%>
                <%amotizacao = divida;%>
                <%divida = 0;%>
                <%}%>
                <td><%=amotizacao%></td>
                <td><%=jurosMensal%></td>
                <td><%=divida%>
            </tr>
            <%}%>
        </table>
        <table style="text-align: center;margin: auto;" border="1">
            <tr>
                <th>Total de juros pago</th>
                <th>Total da Divida pago</th>
            </tr>
            <tr>
                <td><%=df.format(totalJurosPago)%></td>
                <td><%=df.format(totalDividaPago)%></td>
            </tr>
        </table>
        <%}%>   
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
