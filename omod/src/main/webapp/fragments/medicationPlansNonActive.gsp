<%
    ui.includeCss("drugorders", "drugorders.css")
    def default_prio = "";
%>

<div id="nonActivePlansTableWrapper">
    <form method="post" name="nonActivePlanForm" id="nonActivePlanForm">
        <input type="hidden" id="selectedNonActivePlan" name="selectedNonActivePlan" />
        
        <table id="nonActivePlansTable">
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
                                
                                <% planMain.value.each { orderMain -> %>
                                    <div class="planDrug">
                                        <% if(NonActivePlanExtension.get(planOrderMain.key).get(planMain.key).get(orderMain.key).priority != null) { %>
                                            <% default_prio = NonActivePlanExtension.get(planOrderMain.key).get(planMain.key).get(orderMain.key).priority.getDisplayString(); %>
                                        <% } %>

                                        <div class="planDetails">
                                            <div id="planDrugId">
                                                ${ NonActivePlanExtension.get(planOrderMain.key).get(planMain.key).get(orderMain.key).orderId }
                                            </div>
                                            <div id="planDrugName" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ NonActivePlanExtension.get(planOrderMain.key).get(planMain.key).get(orderMain.key).startDate.format('yyyy-MM-dd') }','${ NonActivePlanExtension.get(planOrderMain.key).get(planMain.key).get(orderMain.key).drugName.getDisplayString() }','${ orderMain.value.dose }','${ orderMain.value.doseUnits.getDisplayString() }','${ orderMain.value.route.getDisplayString() }','${ orderMain.value.duration }','${ orderMain.value.durationUnits.getDisplayString() }','${ orderMain.value.quantity }','${ orderMain.value.quantityUnits.getDisplayString() }','${ orderMain.value.frequency }','${ NonActivePlanExtension.get(planOrderMain.key).get(planMain.key).get(orderMain.key).refill }','${ NonActivePlanExtension.get(planOrderMain.key).get(planMain.key).get(orderMain.key).isAllergicOrderReasons }','${ default_prio }','${ NonActivePlanExtension.get(planOrderMain.key).get(planMain.key).get(orderMain.key).patientInstructions }','${ NonActivePlanExtension.get(planOrderMain.key).get(planMain.key).get(orderMain.key).pharmacistInstructions }')">   
                                                <div>${ NonActivePlanExtension.get(planOrderMain.key).get(planMain.key).get(orderMain.key).drugName.getDisplayString().toUpperCase() }</div>
                                                <span class="itemSummary">
                                                    <div>${ orderMain.value.dose } ${ orderMain.value.doseUnits.getDisplayString() }, ${ orderMain.value.duration } ${ orderMain.value.durationUnits.getDisplayString() }</div>
                                                </span>
                                            </div><br/>
                                        </div>
                                    </div>
                                <% } %>                               
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
    jq('#nonActivePlansTable').dataTable({
        "sPaginationType": "full_numbers",
        "bPaginate": true,
        "bAutoWidth": false,
        "bLengthChange": true,
        "bSort": true,
        "bJQueryUI": true,
        "bInfo": true,
        "bFilter": true,
        "columns": [
            { "width": "85%" },
            { "width": "15%" }
        ],
        fixedColumns: true

    });
</script>

<script type="text/javascript">    
    jq(".planDetails").click(function(){
        jq(this).css({"background": "#75b2f0","color": "white"});
    });
</script>

<script type="text/javascript">    
    jq(".planRenewButton > span > i").hover(function(event){
        if(event.type == 'mouseenter'){
            jq(this).parent().parent().parent().children('td').slice(0, 1).children(".planDrug").children(".planDetails").css({"background": "#75b2f0","color": "white"});
        } else {
            jq(this).parent().parent().parent().children('td').slice(0, 1).children(".planDrug").children(".planDetails").css({"background": "","color": ""});
        }
    });
</script>