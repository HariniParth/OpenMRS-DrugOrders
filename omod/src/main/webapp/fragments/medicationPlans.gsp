<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<% drugOrderMainPlan.each { drugOrderMain -> %>
    <% drugOrderExtensionPlan.each { drugOrderExtension -> %>
        <% if(drugOrderMain.key == drugOrderExtension.key) { %>
            <p>${drugOrderMain.key.getDisplayString()}</p><br/>
            
            <% drugOrderMain.value.each { drugOrderMn -> %>
                <% drugOrderExtension.value.each { drugOrderExtn -> %>
                    <% if(drugOrderMn.orderId == drugOrderExtn.orderId && drugOrderExtn.orderstatus == "Active-Plan") { %>
                                              
                        <p class="fields">
                            <span id="order_label">${drugOrderExtn.drugname}</span>
                            <a href="#" class="detailsLink">Details</a><br/>
                            
                            <span class="planItemDetails">
                                <span id="order_label">Dose:</span>
                                <span id="order_value">${drugOrderMn.dose}</span>
                                <span id="order_label">Dose units:</span>
                                <span id="order_value">${drugOrderMn.doseUnits.getDisplayString()}</span>
                                <span id="order_label">Route:</span>
                                <span id="order_value">${drugOrderMn.route.getDisplayString()}</span>
                                <span id="order_label">Quantity:</span>
                                <span id="order_value">${drugOrderMn.quantity}</span>
                                <span id="order_label">Qnty units:</span>
                                <span id="order_value">${drugOrderMn.quantityUnits.getDisplayString()}</span>
                                <span id="order_label">Duration:</span>
                                <span id="order_value">${drugOrderMn.duration}</span>
                                <span id="order_label">Durn units:</span>
                                <span id="order_value">${drugOrderMn.durationUnits.getDisplayString()}</span>
                                <span id="order_label">Frequency:</span>
                                <span id="order_value">${drugOrderMn.frequency}</span>
                                <span id="view_order_detail"></span>
                            </span>
                            
                        </p>
                    <% } %>
                <% } %>
            <% } %>
            
            <script type="text/javascript">
                jq(".detailsLink").click(function(){
                    jq(this).nextAll(".planItemDetails").toggle();
                });
            </script>
            
            <br/>
        <% } %>
    <% } %>
<% } %>