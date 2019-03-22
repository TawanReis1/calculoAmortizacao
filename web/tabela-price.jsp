
<%@page import="java.text.NumberFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
</html><body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>Tabela Price</h1>
        
            Preencha os campos
            <form>
            <br>
            <br>
            Valor
            <br>
            <input type="number" name="valorTotal">
            <br>
            Taxa
            <br>
            <input type="number" name="nTaxa">
            <br>
            Periodo em meses
            <br>
            <input type="number" name="nMeses">
            <br>    
            <input type="submit" name="result" value="enviar"/>
           </form>
            
            <% String valorTotal= request.getParameter("valorTotal"); %> 
            <% String nTaxa= request.getParameter("nTaxa");  %>
            <% String nMeses= request.getParameter("nMeses"); %> 
            
                
             <%  if((valorTotal!="" && valorTotal!=null )|| (nTaxa!="" && nTaxa!=null) || 
                     (nMeses!="" && nMeses!=null)){ %>
                     <%  try {  %>
                        <%  double dinheiro = Double.parseDouble(valorTotal);
                            double juros = Double.parseDouble(nTaxa) / 100;
                            int parcelas= Integer.parseInt(nMeses);
                            double saldoDevedor = dinheiro;
                            double amortizacao = 0;
                            double valor = 0 ;
                            double mds=0;
                        %>          
                      <table class="table">
                      <tr>
                          <th>Parcela</th>
                          <th>Valor</th>
                          <th>Juros(%)</th>
                          <th>Amortizaão sobre saldo devedor</th>
                          <th>Saldo devedor</th>
                              
                      </tr>
                      <tr>  
                          <td> <b>0</b>  </td>
                          <td> - </td>
                          <td> - </td>
                          <td> - </td>
                          <td> R$ <%= dinheiro %> </td>
                      
                      
                      </tr>
                     
                      <tr>
                          <% mds =(Math.pow((1+juros),parcelas)) ;     
                            //mds = 1.36
                            valor = mds;
                            mds = (mds * juros) / (valor-1);
                            mds= dinheiro * mds;
                            valor = mds;
                            
                            %>
            <%  for(int i=1 ; i<=parcelas; i++){
                    mds=0;
                    mds = juros * dinheiro ;
                    amortizacao = valor - mds;
                    saldoDevedor = dinheiro - amortizacao;
                    dinheiro= dinheiro - amortizacao;
                    
                    if(i==parcelas){    
                   saldoDevedor=0;
                    }
                    
                   %>
                
                     <th><%= i %></th>
                     <td><%= NumberFormat.getCurrencyInstance().format(valor) %></td>         
                     <td><%= NumberFormat.getCurrencyInstance().format(mds) %></td>         
                     <td><%= NumberFormat.getCurrencyInstance().format(amortizacao) %></td>         
                     <td><%= NumberFormat.getCurrencyInstance().format(saldoDevedor) %></td>                  
                     </tr>
                        <% }%> 
            <% }catch(Exception e){} }  %>
            <div style="margin-bottom: 50px"></div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
     
    </body>
          
</html>