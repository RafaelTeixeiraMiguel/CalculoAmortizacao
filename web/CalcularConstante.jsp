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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Amortização Constante</h1>
       <% if(request.getParameter("Calcular")==null){ %>
                <form>
                  Valor Financiado: <input type="number" name="valorFinanciado"><br>
                  Taxa de Juros: <input type="number" name="taxaJuros">%<br>
                  Parcelas (Quantidade meses): <input type="number" name="parcelas"><br>
                  <input type="submit" name="Calcular" value="calcular"><br>
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
         
         <table class="table">
                <thead>
                     <tr>
                             <th>PARCELAS </th>
                             <th>AMORTIZAÇÕES </th>
                             <th>JUROS</th>
                             <th>SALDO DEVEDOR </th>
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
                       <tr>
              <td><%=parcela%></td>
         
                    <td><%=amortizacao%></td>
                    <td><%=jurosSobSaldo%></td>
                     <td><%=saldo%></td>
        </tr>
       
                 
          <% }
                   
               
               
           } catch (Exception e) {
           }
         
       
        %>
   
            <%  } %>
                  </table>
    </body>
</html>