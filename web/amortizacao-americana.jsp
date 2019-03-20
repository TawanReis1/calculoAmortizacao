
<%-- 
    Document   : amortizacao-americana
    Created on : 13/03/2019, 23:37:00
    Author     : User
--%>

<%@page import="java.text.NumberFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>Amortização Americana</h1>
        <form style="margin-left: 15px">
            <label for="value">Digite o valor do empréstimo:</label><br>
            <input type="text" name="valorEmprestimo"/><br><br>
            
            <label for="months">Digite o número de meses:</label><br>
            <input type="number" name="qMeses"/><br><br>
            
            <label for="fee">Digite a taxa de Juros(%):</label><br>
            <input type="text" name="valorJuros"/><br><br>
            
            <input type="submit" name="result" value="Calcular">
        </form>
        <%
            String valorEmprestimo = request.getParameter("valorEmprestimo");
            String valorJuros = request.getParameter("valorJuros");
            String qMeses = request.getParameter("qMeses");
            
            if((valorEmprestimo!="" && valorEmprestimo!=null)||(valorJuros!="" && valorJuros!=null)||(qMeses!="" && qMeses!=null)){
                try{
                    double emprestimo = Double.parseDouble(valorEmprestimo);
                    double taxaJuros = Double.parseDouble(valorJuros);
                    int meses = Integer.parseInt(qMeses);
                    double juros=taxaJuros;
                    double saldoDevedor = emprestimo;
                    double prestacao = 0;
                    double amortizacao = 0;
                                      
        %>
                    <table class="table">
                        <tr>
                            <th>Nº de Prestação</th>
                            <th>Amortização</th>
                            <th>Juros(<%=taxaJuros%>% de R$<%=emprestimo%>)</th>
                            <th>Prestação</th>
                            <th>Dívida</th>
                        </tr>
                        
                        <tr>
                            <%
                                for(int i=1; i<=meses; i++) {
                                    if(i<meses){
                                    juros= (taxaJuros/100)*saldoDevedor;
                                    saldoDevedor = saldoDevedor;
                                    prestacao = juros;
                                    amortizacao = 0;
                                }
                                    else{
                                     juros= (taxaJuros/100)*saldoDevedor;
                                    saldoDevedor = saldoDevedor;
                                    prestacao = juros + emprestimo;
                                    amortizacao = prestacao;
                                    saldoDevedor = 0;
                                    
                                    }
                                  
                            %>
                            <th><%= i %></th>
                            <td><%= NumberFormat.getCurrencyInstance().format(amortizacao) %></td>
                            <td><%= NumberFormat.getCurrencyInstance().format(juros) %></td>
                            <td><%= NumberFormat.getCurrencyInstance().format(prestacao) %></td>
                            <td><%= NumberFormat.getCurrencyInstance().format(saldoDevedor) %></td>
                        </tr>
                            <%}%>
                    </table>
                      <hr/>
               <br/>
               <br/>
               <br/>
               <br/>         
                <%}catch(Exception e){}}%>
              
    </body>
</html>
