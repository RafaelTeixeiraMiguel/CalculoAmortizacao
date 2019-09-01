<%--
    Document   : CalcularConstante
    Created on : 31/08/2019, 17:10:58
    Author     : Alan Monteiro
--%>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante</title>
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
            <h3>Amortização Constante</h3><br/><br/>
            <% if(request.getParameter("Calcular")==null){ %>
            <form>
                <div>
                    <div class="group">      
                        <input type="number" step="any" name="valorFinanciado" required/>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label class='c'>Valor da Dívida</label>
                    </div>
                    <div class="group">      
                        <input type="number" step="any" name="parcelas" required/>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label class='c'>Número de Prestações</label>
                    </div>
                    <div class="group">      
                        <input type="number" step="any" name="taxaJuros" required/>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label class='c'>Juros Mensal</label>
                    </div>
                </div>
                <div>
                    <input type="submit" class="btn btn-primary" name="Calcular" value="Calcular">
                </div>
            </form>  
            <% }else{ %>
            <%
                double valorFinanciado,taxaDeJuros,tempo,amortizacao,parcela,valorAnterior;
                double jurosSobSaldo = 0.0;
                double saldo =0.0;
                int i;            
                valorFinanciado = Double.parseDouble(request.getParameter("valorFinanciado"));
                taxaDeJuros = Double.parseDouble(request.getParameter("taxaJuros"));
                parcela = Double.parseDouble(request.getParameter("parcelas"));
                amortizacao = valorFinanciado/parcela;
                valorAnterior = valorFinanciado;
                tempo = parcela;
            %>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Prestação</th>
                        <th>Amortização</th>
                        <th>Juros</th>
                        <th>Saldo Devedor</th>
                    </tr>
                </thead>    
                <%
                try {
                   for (i= 0; i < tempo;i++){
                       saldo = (valorFinanciado - ((i+1)* amortizacao) );
                       jurosSobSaldo = valorAnterior * (taxaDeJuros/100);
                       valorAnterior = saldo;
                       parcela = amortizacao + jurosSobSaldo;
                %>
                <tbody>
                    <tr>
                        <td><%=parcela%></td>
                        <td><%=amortizacao%></td>
                        <td><%=jurosSobSaldo%></td>
                        <td><%=saldo%></td>
                    </tr>
                </tbody>
                <% }       
                    } catch (Exception e) {
                    }
                %>
            <%  } %>
            </table>
        </div>
        <footer class="footer">
            <%@include file="WEB-INF/jspf/footer.jspf"%>
        </footer>
    </body>
</html>