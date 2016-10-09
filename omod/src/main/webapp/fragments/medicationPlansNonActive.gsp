<%
    ui.includeCss("drugorders", "drugorders.css")
    def default_prio = "";
%>

<div id="drugOrderPlanDiscontinued">
    <table id="oldMedPlansTable">
        <thead>
            <tr>
                <th>Plan Name</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% if(drugOrderMainPlanNonActive.size() == 0) { %>
                <tr><td colspan="2" align="center">No Orders Found</td></tr>
            <% } %>
    
            <% drugOrderMainPlanNonActive.each { drugOrderMain -> %>
                <% drugOrderExtensionPlanNonActive.each { drugOrderExtension -> %>
                    <% if(drugOrderMain.key == drugOrderExtension.key) { %>
                        <tr>
                            <td class="fields">
                                <span class="viewDetails">
                                    <i class="icon-plus-sign edit-action" title="${ ui.message("View Details") }"></i>
                                    <i class="icon-minus-sign edit-action" title="${ ui.message("Hide Details") }"></i>
                                </span>
                                ${drugOrderMain.key.getDisplayString().toUpperCase()}
                                
                                <div class="orderDetails">
                                    <% drugOrderMain.value.each { drugOrderMn -> %>
                                        <% drugOrderExtension.value.each { drugOrderExtn -> %>
                                            <% if(drugOrderMn.orderId == drugOrderExtn.orderId) { %>

                                                <% if(drugOrderExtn.priority != null) { %>
                                                    <% default_prio = drugOrderExtn.priority.getDisplayString(); %>
                                                <% } %>

                                                <p class="fields">
                                                    <span id="order_label">   
                                                        <a href="#" class="detailsLink" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ drugOrderExtn.startdate }','${ drugOrderExtn.drugname.getDisplayString() }','${ drugOrderMn.dose }','${ drugOrderMn.doseUnits.getDisplayString() }','${ drugOrderMn.route.getDisplayString() }','${ drugOrderMn.duration }','${ drugOrderMn.durationUnits.getDisplayString() }','${ drugOrderMn.quantity }','${ drugOrderMn.quantityUnits.getDisplayString() }','${ drugOrderMn.frequency }','${ drugOrderExtn.refill }','${ drugOrderExtn.isallergicorderreasons }','${ default_prio }','${ drugOrderExtn.patientinstructions }','${ drugOrderExtn.pharmacistinstructions }')">${drugOrderExtn.drugname.getDisplayString()}</a>
                                                    </span><br/>
                                                </p>
                                            <% } %>
                                        <% } %>
                                    <% } %>
                                </div>
                            </td>
                            <td>
                                <span id="button" class="pull-right">
                                    <i class="icon-edit edit-action" title="${ ui.message("Renew") }" onclick="renewMedPlanWindow('${drugOrderMain.key.getDisplayString()}')"></i>
                                </span>
                            </td>
                        </tr>
                    <% } %>
                <% } %>
            <% } %>
        </tbody>
    </table>
</div>

<script>
    jq('#oldMedPlansTable').dataTable({
        "sPaginationType": "full_numbers",
        "bPaginate": true,
        "bAutoWidth": false,
        "bLengthChange": true,
        "bSort": true,
        "bJQueryUI": true,
        "bInfo": false

    });
</script>

<script type="text/javascript">
    jq(".icon-plus-sign").click(function(){
        jq(this).parent().nextAll(".orderDetails").first().show();
        jq(this).hide();
        jq(this).nextAll(".icon-minus-sign").show();
    });
</script>

<script type="text/javascript">
    jq(".icon-minus-sign").click(function(){
        jq(this).parent().nextAll(".orderDetails").first().hide();
        jq(this).hide();
        jq(this).prevAll(".icon-plus-sign").show();
    });
</script>