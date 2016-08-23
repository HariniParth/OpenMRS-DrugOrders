<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<% diseaseDrugOrders.each { diseaseDrugOrder -> %>
    <p>${diseaseDrugOrder.key.getDisplayString()}</p>
    <p>${diseaseDrugOrder.value.drugname}</p>
    
<% } %>