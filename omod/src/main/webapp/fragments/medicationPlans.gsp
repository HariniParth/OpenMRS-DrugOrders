<%
    ui.includeCss("drugorders", "drugorders.css")
    ui.includeJavascript("drugorders", "dataTables.js")
    def default_prio = "";
%>

<table id="currentMedPlansTable">
    <thead>
        <tr>
            <th>Plan Name</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <% if(drugOrderMainPlanActive.size() == 0) { %>
            <tr><td colspan="3" align="center">No Orders Found</td></tr>
        <% } %>
        
        <% drugOrderMainPlanActive.each { drugOrderMain -> %>
            <% drugOrderExtensionPlanActive.each { drugOrderExtension -> %>
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
                                        <% if((drugOrderMn.orderId == drugOrderExtn.orderId) && ((drugOrderExtn.orderstatus).equals("Active-Plan"))) { %>

                                            <% if(drugOrderExtn.priority != null) { %>
                                                <% default_prio = drugOrderExtn.priority.getDisplayString(); %>
                                            <% } %>

                                            <p class="fields">
                                                <span id="order_label">   
                                                    <a href="#" class="detailsLink" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ drugOrderExtn.startdate }','${ drugOrderExtn.drugname.getDisplayString() }','${ drugOrderMn.dose }','${ drugOrderMn.doseUnits.getDisplayString() }','${ drugOrderMn.route.getDisplayString() }','${ drugOrderMn.duration }','${ drugOrderMn.durationUnits.getDisplayString() }','${ drugOrderMn.quantity }','${ drugOrderMn.quantityUnits.getDisplayString() }','${ drugOrderMn.frequency }','${ drugOrderExtn.isallergicorderreasons }','${ default_prio }','${ drugOrderExtn.patientinstructions }','${ drugOrderExtn.pharmacistinstructions }')">${drugOrderExtn.drugname.getDisplayString()}</a>
                                                </span>

                                                <span id="button" class="pull-right">
                                                    <i class="icon-edit edit-action" title="${ ui.message("Edit") }" onclick="showEditIndividualDrugOrderWindow('EDIT DRUG ORDER','PLAN','${ drugOrderMn.orderId }','${ drugOrderExtn.drugname.getDisplayString() }','${ drugOrderExtn.startdate }','${ drugOrderMn.dose }','${ drugOrderMn.doseUnits.getDisplayString() }','${ drugOrderMn.route.getDisplayString() }','${ drugOrderMn.duration }','${ drugOrderMn.durationUnits.getDisplayString() }','${ drugOrderMn.quantity }','${ drugOrderMn.quantityUnits.getDisplayString() }','${ drugOrderMn.frequency }','${drugOrderMain.key.getDisplayString()}','${ drugOrderExtn.isallergicorderreasons }','${ default_prio }','${ drugOrderExtn.patientinstructions }','${ drugOrderExtn.pharmacistinstructions }')"></i>
                                                    <i class="icon-trash delete-action" title="${ ui.message("Delete") }" onclick="showDiscontinueIndividualDrugOrderWindow('DISCONTINUE ORDER','${ drugOrderMn.orderId }','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ drugOrderExtn.startdate }','${ drugOrderExtn.drugname.getDisplayString() }','${ drugOrderMn.dose }','${ drugOrderMn.doseUnits.getDisplayString() }','${ drugOrderMn.route.getDisplayString() }','${ drugOrderMn.duration }','${ drugOrderMn.durationUnits.getDisplayString() }','${ drugOrderMn.quantity }','${ drugOrderMn.quantityUnits.getDisplayString() }','${ drugOrderMn.frequency }','${ default_prio }','${ drugOrderExtn.patientinstructions }','${ drugOrderExtn.pharmacistinstructions }')"></i>
                                                </span><br/>
                                            </p>
                                        <% } %>
                                    <% } %>
                                <% } %>

                            </div>
                        </td>
                        <td>
                            <span id="button">
                                <i class="icon-trash delete-action" title="${ ui.message("Discard") }" onclick="discardMedPlanOrder('DISCONTINUE PLAN','${drugOrderMain.key.getDisplayString()}')"></i>
                            </span>
                        </td>
                    </tr>
                <% } %>
            <% } %>
        <% } %>

    </tbody>
</table>

<script>
    jq('#currentMedPlansTable').dataTable({
        "sPaginationType": "full_numbers",
        "bPaginate": true,
        "bAutoWidth": false,
        "bLengthChange": true,
        "bSort": true,
        "bJQueryUI": true,
        "bInfo": false,
        "bFilter": false

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