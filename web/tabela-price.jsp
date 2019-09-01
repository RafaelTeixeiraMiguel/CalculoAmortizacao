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
        <title>Tabela Price JSP</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <h1 style="text-align: center">Tabela Price</h1>
        <% if (request.getParameter("calcular")==null) {%>
        <div class="container">
            <form>
                <div class="form-group">
                    Dívida: <input type="number" style="margin-top: 50px;margin-left: 78px" step="any" name="divida" required/><br>
                    N° Prestação: <input type="number" style="margin-top: 20px; margin-left: 31px" name="numeroPrestacao" required/><br>
                    Juros mensal: <input type="number" style="margin-top: 20px; margin-left: 30px" step="any" name="taxaMensal" required/><br>
                    <input type="submit" style="margin-top: 30px; margin-left: 255px" class="btn btn-outline-success" name="calcular" value="Calcular"/>
                </div>
            </form>
        </div>
        <%}else{%>
        <%double dividaOriginal = Double.parseDouble(request.getParameter("divida"));%>
        <%int numeroPrestacao = Integer.parseInt(request.getParameter("numeroPrestacao"));%>
        <%double taxaMensal = Double.parseDouble(request.getParameter("taxaMensal"));%>
        <%double amortizacao = 0;%>
        <%double parcela = 0;%>
        <%double juros = 0;%>
        <%double divida = dividaOriginal;%>
        <%double jurosTotal = 0;%>
        <%DecimalFormat df = new DecimalFormat("0.00");%>
        <%parcela = divida * (taxaMensal / 100) / (1 - Math.pow(1 + (taxaMensal/100), -numeroPrestacao));%>

        <table style="margin: auto;margin-top: 50px; text-align: center;" border="1">
            <tr>
                <th>N° Prestação</th>
                <th>Prestação</th>
                <th>Juros</th>
                <th>Amortização</th>
                <th>Saldo devedor</th>
            </tr>
            <%for (int i = 1; i <= numeroPrestacao; i++) {%>
            <%
                amortizacao = parcela - (divida * (taxaMensal/100));   
                divida = divida - amortizacao;
                juros = divida * (taxaMensal/100);
            %>
            <tr>
                <td><%=i%></td>
                <%//if(i == numeroPrestacao){%>
                <td><%=df.format(parcela)%></td>
                <td><%=df.format(juros)%></td>
                <td><%=df.format(amortizacao)%></td>
                <td><%=df.format(divida)%></td>
                <%//}%>
            </tr>
            <%
                jurosTotal += juros;
            %>
            <%}%>
        </table>
        <table style="text-align: center;margin: auto;" border="1">
            <tr>
                <th>Total de juros pago</th>
                <th>Total da Divida pago</th>
            </tr>
            <tr>
                <td><%=df.format(jurosTotal)%></td>
                <td><%=df.format(dividaOriginal + jurosTotal)%></td>
            </tr>
        </table>
        <%}%>   
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
