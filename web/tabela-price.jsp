



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
        <h1>Tabela Price</h1>
        
            Preencha os campos
            
            <br>
            <br>
            Valor
            <br>
            <input type="number" name="valorTotal">
            <br>
            Taxa
            <br>
            <input type="number" name="taxa">
            <br>
            Periodo em meses
            <br>
            <input type="number" name="meses">
            <br>    
            <input type="submit" name="enviar"/>
           
            
            <% String valorTotal= request.getParameter("valorTotal"); %> 
            <% String nTaxa= request.getParameter("nTaxa");  %>
            <% String nMeses= request.getParameter("nMeses"); %> 
            
            
             <%  if((valorTotal!="" && valorTotal!=null )|| (nTaxa!="" && nTaxa!=null) || 
                     (nMeses!="" && nMeses!=null)){ %>
                     <%  try {  %>
                        <%  double dinheiro = Double.parseDouble(valorTotal);
                            double juros = Double.parseDouble(nTaxa);
                            double parcelas= Double.parseDouble(nMeses)/ 100;
                            double saldoDevedor= dinheiro;
                            double amortizacao = 0;
                            double valor = 0 ;
                            double mds=0;
                            double sdm =0;
                     
                     
                        
                        %>          
                      <table>
                      <tr>
                          <th>Parcela</th>
                          <th>Valor</th>
                          <th>Juros(%)</th>
                          <th>Amortizaão sobre saldo devedor</th>
                          <th>Saldo devedor</th>
                              
                      </tr>
                     
                      
            <%  for(int i=1 ; i<=parcelas; i++){
                   if(i<parcelas){
                    juros= (1+parcelas); 
                    mds =(Math.pow(juros,parcelas)) ;
                    //1.36
                    sdm = mds;
                    //sdm = 1.36
                    mds= mds * parcelas;
                    mds= mds / (sdm - 1) ;
                    amortizacao = mds;
                   }}
      %>
                
                    
                           
                        
                           

                
}
                      
             
                
                
                 
            
            
            <% }catch(Exception e){} }  %>
            
            
                
                
          
            
           
            
                
                
               
                
                
                
                
           
            
            
        
    </body>
</html>
