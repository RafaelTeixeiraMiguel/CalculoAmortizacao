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
        <title>Tabela Price</title>
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
            <h3>Tabela Price</h3><br/><br/>
            <% if (request.getParameter("calcular")==null) {%>
            <div>
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
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>N. Prestação</th>
                        <th>Prestação</th>
                        <th>Juros</th>
                        <th>Amortização</th>
                        <th>Saldo Devedor</th>
                    </tr>
                </thead>
                <%for (int i = 1; i <= numeroPrestacao; i++) {%>
                <%
                    amortizacao = parcela - (divida * (taxaMensal/100));   
                    divida = divida - amortizacao;
                    juros = divida * (taxaMensal/100);
                %>
                <tbody>
                    <tr>
                        <td><%=i%></td>
                        <%//if(i == numeroPrestacao){%>
                        <td><%=df.format(parcela)%></td>
                        <td><%=df.format(juros)%></td>
                        <td><%=df.format(amortizacao)%></td>
                        <td><%=df.format(divida)%></td>
                        <%//}%>
                    </tr>
                    <%jurosTotal += juros;%>
                </tbody>
                <%}%>
            </table>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Total de juros pago</th>
                        <th>Total da Divida pago</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%=df.format(jurosTotal)%></td>
                        <td><%=df.format(dividaOriginal + jurosTotal)%></td>
                    </tr>
                </tbody>
            </table>
            <%}%>
        </div>
        <footer class="footer">
            <%@include file="WEB-INF/jspf/footer.jspf"%>
        <footer class="footer">
    </body>
</html>
