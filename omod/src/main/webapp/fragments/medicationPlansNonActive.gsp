<%
    ui.includeCss("drugorders", "drugorders.css")
    def default_prio = "";
%>

<div id="drugOrderPlanDiscontinued">
    <form method="post" name="nonActivePlanForm" id="nonActivePlanForm">
        <input type="hidden" id="selectedNonActivePlan" name="selectedNonActivePlan" />
        
        <table id="oldMedPlansTable">
            <thead>
                <tr>
                    <th>Plan Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% if(NonActivePlanMain.size() == 0) { %>
                    <tr>
                        <td colspan="2" align="center">No Orders Found</td>
                        <td style="display: none;"></td>
                    </tr>
                <% } %>

                <% NonActivePlanMain.each { planOrderMain -> %>
                    <% planOrderMain.value.each { planMain -> %>
                        <tr>
                            <td class="fields">
                                <div><strong>${ planMain.key.getDisplayString().toUpperCase() }</strong></div><br/>

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
                                    <i class="icon-edit edit-action" title="${ ui.message("Renew") }" onclick="renewMedPlanWindow('${ planOrderMain.key }')"></i>
                                </span>
                            </td>
                        </tr>
                    <% } %>
                <% } %>
            </tbody>
        </table>
    </form>
</div>

<script>
    jq('#oldMedPlansTable').dataTable({
        "sPaginationType": "full_numbers",
        "bPaginate": true,
        "bAutoWidth": false,
        "bLengthChange": true,
        "bSort": true,
        "bJQueryUI": true,
        "bInfo": true,
        "bFilter": true

    });
</script>

<script type="text/javascript">    
    jq(".detailsLink").click(function(){
        jq(this).children('div > *').slice(0, 1).css({"background": "#75b2f0","color": "white"});
    });
</script>

<script type="text/javascript">    
    jq(".planRenewButton > span > i").hover(function(event){
        if(event.type == 'mouseenter'){
            jq(this).parent().parent().parent().children('td').slice(0, 1).children(".orderDetails").children(".detailsLink").css({"background": "#75b2f0","color": "white"});
        } else {
            jq(this).parent().parent().parent().children('td').slice(0, 1).children(".orderDetails").children(".detailsLink").css({"background": "","color": ""});
        }
    });
</script>