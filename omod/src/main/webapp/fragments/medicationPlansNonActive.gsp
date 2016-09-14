<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="drugOrderPlanDiscontinued">
    
    <% drugOrderMainPlanNonActive.each { drugOrderMain -> %>
        <% drugOrderExtensionPlanNonActive.each { drugOrderExtension -> %>
            <% if(drugOrderMain.key == drugOrderExtension.key) { %>
                <p>
                    <span class="viewDetails">
                        <i class="icon-plus-sign edit-action" title="${ ui.message("View Details") }"></i>
                        <i class="icon-minus-sign edit-action" title="${ ui.message("Hide Details") }"></i>
                    </span>

                    ${drugOrderMain.key.getDisplayString().toUpperCase()}

                    <span id="button" class="pull-right">
                        <i class="icon-edit edit-action" title="${ ui.message("Renew") }" onclick="renewMedPlanWindow('${drugOrderMain.key.getDisplayString()}')"></i>
                    </span>

                </p><br/>

                <div class="orderDetails">
                    <% drugOrderMain.value.each { drugOrderMn -> %>
                        <% drugOrderExtension.value.each { drugOrderExtn -> %>
                            <% if(drugOrderMn.orderId == drugOrderExtn.orderId) { %>

                                <p class="fields">
                                    <span id="order_label">   
                                        <a href="#" class="detailsLink" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ drugOrderExtn.startdate }','${ drugOrderExtn.drugname.getDisplayString() }','${ drugOrderMn.dose }','${ drugOrderMn.doseUnits.getDisplayString() }','${ drugOrderMn.route.getDisplayString() }','${ drugOrderMn.duration }','${ drugOrderMn.durationUnits.getDisplayString() }','${ drugOrderMn.quantity }','${ drugOrderMn.quantityUnits.getDisplayString() }','${ drugOrderMn.frequency }','${ drugOrderExtn.isallergicorderreasons }','${ drugOrderExtn.patientinstructions }','${ drugOrderExtn.pharmacistinstructions }')">${drugOrderExtn.drugname.getDisplayString()}</a>
                                    </span><br/>
                                </p>
                            <% } %>
                        <% } %>
                    <% } %>
                </div><br/>
            <% } %>
        <% } %>
    <% } %>
</div>

<script type="text/javascript">
    jq(".icon-plus-sign").click(function(){
        jq(this).parent().parent().nextAll(".orderDetails").first().show();
        jq(this).hide();
        jq(this).nextAll(".icon-minus-sign").show();
    });
</script>

<script type="text/javascript">
    jq(".icon-minus-sign").click(function(){
        jq(this).parent().parent().nextAll(".orderDetails").first().hide();
        jq(this).hide();
        jq(this).prevAll(".icon-plus-sign").show();
    });
</script>