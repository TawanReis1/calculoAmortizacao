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
                <% double valueAmortization = 0; %>
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
                            <th style="text-align: center">PrestaçãoAmortização + Juros)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="text-align: center">0</td>
                            <td style="text-align: center">R$<%= value %></td>
                            <td style="text-align: center"> - </td>
                            <td style="text-align: center"> - </td>
                            <td style="text-align: center"> - </td>
                        </tr>
                    </tbody>
                    
                    <% for(int i=1; i<=months; i++) { %>
                        <tbody>
                            <tr>
                                <td style="text-align: center"><%= i %></td>
                                <td style="text-align: center">R$<%= value = value - valueAmortization %></td>
                                <td style="text-align: center">R$<%= valueAmortization %></td>
                                <td style="text-align: center">R$<%= (value + valueAmortization) * fee %></td>
                                <% acumFees = acumFees + ((value + valueAmortization) * fee); %>
                                <td style="text-align: center">R$<%= valueAmortization + ((value + valueAmortization) * fee) %></td>
                                <% acumAmortization = acumAmortization + (valueAmortization + ((value + valueAmortization) * fee)); %>
                            </tr>
                        </tbody>
                    <% } %>
                        <tbody>
                            <tr>
                                <td style="text-align: center">Total</td>
                                <td style="text-align: center"> - </td>
                                <td style="text-align: center">R$<%= initialValue %></td>
                                <td style="text-align: center">R$<%= acumFees %></td>
                                <td style="text-align: center">R$<%= acumAmortization %></td>
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
