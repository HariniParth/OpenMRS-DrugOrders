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
            <% if(NonActivePlanMain.size() == 0) { %>
                <tr><td colspan="2" align="center">No Orders Found</td></tr>
            <% } %>
    
            <% NonActivePlanMain.each { planOrderMain -> %>
                <% planOrderMain.value.each { planMain -> %>
                    <tr>
                        <td class="fields">
                            <div>
                                <span class="viewDetails">
                                    <i class="icon-plus-sign edit-action" title="${ ui.message("View Details") }"></i>
                                    <i class="icon-minus-sign edit-action" title="${ ui.message("Hide Details") }"></i>
                                </span>
                                ${ planMain.key.getDisplayString().toUpperCase() }
                            </div><br/>
                            
                            <div class="orderDetails">
                                <% planMain.value.each { orderMain -> %>
                                
                                    <% if(NonActivePlanExtension.get(planOrderMain.key).get(planMain.key).get(orderMain.key).priority != null) { %>
                                        <% default_prio = NonActivePlanExtension.get(planOrderMain.key).get(planMain.key).get(orderMain.key).priority.getDisplayString(); %>
                                    <% } %>
                                    
                                    <div class="detailsLink">
                                        <div class="fields" id="view_order_detail" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ NonActivePlanExtension.get(planOrderMain.key).get(planMain.key).get(orderMain.key).startdate.format('yyyy-MM-dd') }','${ NonActivePlanExtension.get(planOrderMain.key).get(planMain.key).get(orderMain.key).drugname.getDisplayString() }','${ orderMain.value.dose }','${ orderMain.value.doseUnits.getDisplayString() }','${ orderMain.value.route.getDisplayString() }','${ orderMain.value.duration }','${ orderMain.value.durationUnits.getDisplayString() }','${ orderMain.value.quantity }','${ orderMain.value.quantityUnits.getDisplayString() }','${ orderMain.value.frequency }','${ NonActivePlanExtension.get(planOrderMain.key).get(planMain.key).get(orderMain.key).refill }','${ NonActivePlanExtension.get(planOrderMain.key).get(planMain.key).get(orderMain.key).isallergicorderreasons }','${ default_prio }','${ NonActivePlanExtension.get(planOrderMain.key).get(planMain.key).get(orderMain.key).patientinstructions }','${ NonActivePlanExtension.get(planOrderMain.key).get(planMain.key).get(orderMain.key).pharmacistinstructions }')">   
                                            <div>${ NonActivePlanExtension.get(planOrderMain.key).get(planMain.key).get(orderMain.key).drugname.getDisplayString().toUpperCase() } <span class="itemSummary">Start Date: ${ NonActivePlanExtension.get(planOrderMain.key).get(planMain.key).get(orderMain.key).startdate.format('yyyy-MM-dd') }</span></div>
                                            <div><span class="itemSummary">${ orderMain.value.dose } ${ orderMain.value.doseUnits.getDisplayString() }, ${ orderMain.value.duration } ${ orderMain.value.durationUnits.getDisplayString() }</span></div>
                                        </div><br/>
                                    </div>
                                    
                                <% } %>
                            </div>
                        </td>
                        <td class="planRenewButton">
                            <span id="button" class="pull-right">
                                <i class="icon-edit edit-action" title="${ ui.message("Renew") }" onclick="renewMedPlanWindow('${ planOrderMain.key }','${ planMain.key.getDisplayString().toUpperCase() }','${ planDrugs.get(planOrderMain.key) }')"></i>
                            </span>
                        </td>
                    </tr>
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

<script type="text/javascript">    
    jq(".detailsLink").click(function(){
        jq(this).children('div > *').slice(0, 1).css({"background": "#75b2f0","color": "white"});
    });
</script>

<script type="text/javascript">    
    jq(".planRenewButton").click(function(){
    
        jq(this).parent().children('td').slice(0, 1).children('.orderDetails').show();
        jq(this).parent().children('td').slice(0, 1).children().children().children('.icon-minus-sign').show();
        jq(this).parent().children('td').slice(0, 1).children().children().children('.icon-plus-sign').hide();
    
    });
</script>