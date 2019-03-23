<%@page import="java.text.NumberFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        
        <h1 style="margin-left: 10px">Amortização Constante</h1>
        <br>
        <form style="margin-left: 15px">
            <label for="value">Digite o valor que deseja financiar:</label><br>
            <input name="value" type="text" class="form-control" style="width: 250px"><br><br>
            
            <label for="months">Digite o número de meses:</label><br>
            <input name="months" type="number" class="form-control" style="width: 250px"><br><br>
            
            <label for="fee">Digite a taxa da amortização(%):</label><br>
            <input name="fee" type="text" class="form-control" style="width: 250px"><br><br>
            
            <input type="submit" name="result" value="Calcular">
        </form>
        
        <%if(request.getParameter("result") != null) {%>
            <% try { %>
                <% double value = Double.parseDouble(request.getParameter("value"));%>
                <% double initialValue = Double.parseDouble(request.getParameter("value"));%>
                <% int months = Integer.parseInt(request.getParameter("months"));%>
                <% double fee = (Double.parseDouble(request.getParameter("fee"))) / 100;%>
                <% double valueFee = 0; %>
                <% double valueAmortization = 0; %>
                <% double valuePrestation = 0; %>
                <% double acumAmortization = 0; %>
                <% double acumFees = 0; %>
                
                <% valueAmortization = value / months; %>
                
                <table style="margin-left: 15px; margin-top: 15px" class="table table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th style="text-align: center">Meses</th>
                            <th style="text-align: center">Saldo devedor</th>
                            <th style="text-align: center">Amortização</th>
                            <th style="text-align: center">Juros</th>
                            <th style="text-align: center">Prestação(Amortização + Juros)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="text-align: center">0</td>
                            <td style="text-align: center"><%= NumberFormat.getCurrencyInstance().format(value) %></td>
                            <td style="text-align: center"> - </td>
                            <td style="text-align: center"> - </td>
                            <td style="text-align: center"> - </td>
                        </tr>
                    </tbody>
                    
                    <% for(int i=1; i<=months; i++) { %>
                        <tbody>
                            <tr>
                                <td style="text-align: center"><%= i %></td>
                                
                                <% value = value - valueAmortization; %>
                                <td style="text-align: center"><%= NumberFormat.getCurrencyInstance().format(value) %></td>
                                
                                <td style="text-align: center"><%= NumberFormat.getCurrencyInstance().format(valueAmortization) %></td>
                                
                                <% valueFee = (value + valueAmortization) * fee; %>
                                <td style="text-align: center"><%= NumberFormat.getCurrencyInstance().format(valueFee) %></td>
                                
                                <% acumFees = acumFees + ((value + valueAmortization) * fee); %>
                                
                                <% valuePrestation = valueAmortization + ((value + valueAmortization) * fee);%>
                                <td style="text-align: center"><%= NumberFormat.getCurrencyInstance().format(valuePrestation) %></td>
                                
                                <% acumAmortization = acumAmortization + (valueAmortization + ((value + valueAmortization) * fee)); %>
                            </tr>
                        </tbody>
                    <% } %>
                        <tbody>
                            <tr>
                                <td style="text-align: center">Total</td>
                                <td style="text-align: center"> - </td>
                                <td style="text-align: center"><%= NumberFormat.getCurrencyInstance().format(initialValue) %></td>
                                <td style="text-align: center"><%= NumberFormat.getCurrencyInstance().format(acumFees) %></td>
                                <td style="text-align: center"><%= NumberFormat.getCurrencyInstance().format(acumAmortization) %></td>
                            </tr>  
                        </tbody>
                </table>              
                    
            <% } catch(Exception e) { %>
                <h2 style="color:red">Valores inválidos</h2>
            <% } %>
        <% } %>
        <div style="margin-bottom: 50px"></div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
