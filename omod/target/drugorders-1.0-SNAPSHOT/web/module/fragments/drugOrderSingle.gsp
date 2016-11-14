    <%
    ui.includeCss("drugorders", "drugorders.css")
    ui.includeJavascript("drugorders", "dataTables.js")
%>

<div id="currentDrugOrdersTableWrapper">
    <form method="post" name="groupForm">
        <table id="currentDrugOrdersTable">
            <thead>
                <tr>
                    <th>Order</th>
                    <th>Drug Name</th>
                    <th>Start Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% if(existingDrugOrdersExtension.size() == 0 && existingDrugOrderGroups.size() == 0) { %>
                    <tr><td colspan="4" align="center">No Orders Found</td></tr>
                <% } %>

                <% existingDrugOrdersExtension.each { existingDrugOrderExtension -> %>
                    <% if((existingDrugOrderExtension.orderstatus).equals("Active")) { %>

                        <tr class="orderRow">
                            <td>
                                <input type="checkbox" name="groupCheckBox" value="${ existingDrugOrderExtension.orderId }" ng-model="groupCheckBox" />
                            </td>
    
                            <td class="existingDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingDrugOrderExtension.startdate.format('yyyy-MM-dd') }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).dose }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).doseUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).route.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).duration }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).durationUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).quantity }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).quantityUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).frequency }','${ existingDrugOrderExtension.refill }','${ existingDrugOrderExtension.isallergicorderreasons }','${ existingDrugOrderExtension.priority.getDisplayString() }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }','${ existingDrugOrderExtension.comments }')">
                                <div>${ existingDrugOrderExtension.drugname.getDisplayString().toUpperCase() }</div>
                                <div><span class="itemSummary">${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).dose } ${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).doseUnits.getDisplayString() }, ${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).duration } ${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).durationUnits.getDisplayString() }</span></div>
                            </td>

                            <td class="existingDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingDrugOrderExtension.startdate.format('yyyy-MM-dd') }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).dose }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).doseUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).route.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).duration }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).durationUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).quantity }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).quantityUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).frequency }','${ existingDrugOrderExtension.refill }','${ existingDrugOrderExtension.isallergicorderreasons }','${ existingDrugOrderExtension.priority.getDisplayString() }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }','${ existingDrugOrderExtension.comments }')">${ existingDrugOrderExtension.startdate.format('yyyy-MM-dd') }</td>

                            <td>
                                <span id="button">
                                    <i class="icon-edit edit-action" title="${ ui.message("Edit") }" onclick="showEditIndividualDrugOrderWindow('EDIT DRUG ORDER','SINGLE','${ existingDrugOrderExtension.orderId }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrderExtension.startdate }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).dose }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).doseUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).route.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).duration }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).durationUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).quantity }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).quantityUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).frequency }','${ existingDrugOrderExtension.refill }','${ existingDrugOrderExtension.refillinterval }','${ existingDrugOrderExtension.associateddiagnosis.getDisplayString() }','${ existingDrugOrderExtension.isallergicorderreasons }','${ existingDrugOrderExtension.priority.getDisplayString() }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')"></i>
                                    <i class="icon-trash delete-action" title="${ ui.message("Delete") }" onclick="showDiscontinueIndividualDrugOrderWindow('DISCONTINUE ORDER','${ existingDrugOrderExtension.orderId }','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingDrugOrderExtension.startdate.format('yyyy-MM-dd') }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).dose }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).doseUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).route.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).duration }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).durationUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).quantity }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).quantityUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).frequency }','${ existingDrugOrderExtension.priority.getDisplayString() }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')"></i>
                                </span>
                            </td>
                        </tr>
                    <% } %>
                <% } %>

                <% existingDrugOrderGroups.each { existingDrugOrder -> %>
                    <% def orderList = "" %>
                    <% existingDrugOrder.value.each { existingOrder -> %>
                        <% if(existingOrder.orderstatus == "Active-Group") { %>

                            <tr class="orderRow">
                                <td></td>
                                <td class="existingDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingOrder.startdate.format('yyyy-MM-dd') }','${ existingOrder.drugname.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).dose }','${ existingDrugOrdersMain.get(existingOrder.orderId).doseUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).route.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).duration }','${ existingDrugOrdersMain.get(existingOrder.orderId).durationUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).quantity }','${ existingDrugOrdersMain.get(existingOrder.orderId).quantityUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).frequency }','${ existingOrder.refill }','${ existingOrder.isallergicorderreasons }','${ existingOrder.priority.getDisplayString() }','${ existingOrder.patientinstructions }','${ existingOrder.pharmacistinstructions }','${ existingOrder.comments }')">
                                    <div>${ existingOrder.drugname.getDisplayString().toUpperCase() }</div>
                                    <div><span class="itemSummary">${ existingDrugOrdersMain.get(existingOrder.orderId).dose } ${ existingDrugOrdersMain.get(existingOrder.orderId).doseUnits.getDisplayString() }, ${ existingDrugOrdersMain.get(existingOrder.orderId).duration } ${ existingDrugOrdersMain.get(existingOrder.orderId).durationUnits.getDisplayString() }</span></div>
                                </td>
                                <% orderList = orderList + existingOrder.drugname.getDisplayString() + "," %>

                                <td class="existingDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingOrder.startdate.format('yyyy-MM-dd') }','${ existingOrder.drugname.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).dose }','${ existingDrugOrdersMain.get(existingOrder.orderId).doseUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).route.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).duration }','${ existingDrugOrdersMain.get(existingOrder.orderId).durationUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).quantity }','${ existingDrugOrdersMain.get(existingOrder.orderId).quantityUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).frequency }','${ existingOrder.refill }','${ existingOrder.isallergicorderreasons }','${ existingOrder.priority.getDisplayString() }','${ existingOrder.patientinstructions }','${ existingOrder.pharmacistinstructions }','${ existingOrder.comments }')">${ existingOrder.startdate.format('yyyy-MM-dd') }</td>

                                <td>
                                    <span id="button">
                                        <i class="icon-edit edit-action" title="${ ui.message("Edit") }" onclick="showEditIndividualDrugOrderWindow('EDIT DRUG ORDER','GROUP','${ existingOrder.orderId }','${ existingOrder.drugname.getDisplayString() }','${ existingOrder.startdate }','${ existingDrugOrdersMain.get(existingOrder.orderId).dose }','${ existingDrugOrdersMain.get(existingOrder.orderId).doseUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).route.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).duration }','${ existingDrugOrdersMain.get(existingOrder.orderId).durationUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).quantity }','${ existingDrugOrdersMain.get(existingOrder.orderId).quantityUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).frequency }','${ existingOrder.refill }','${ existingOrder.refillinterval }','${ existingOrder.associateddiagnosis.getDisplayString() }','${ existingOrder.isallergicorderreasons }','${ existingOrder.priority.getDisplayString() }','${ existingOrder.patientinstructions }','${ existingOrder.pharmacistinstructions }')"></i>
                                        <i class="icon-trash delete-action" title="${ ui.message("Delete") }" onclick="showDiscontinueIndividualDrugOrderWindow('DISCONTINUE ORDER','${ existingOrder.orderId }','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingOrder.startdate.format('yyyy-MM-dd') }','${ existingOrder.drugname.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).dose }','${ existingDrugOrdersMain.get(existingOrder.orderId).doseUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).route.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).duration }','${ existingDrugOrdersMain.get(existingOrder.orderId).durationUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).quantity }','${ existingDrugOrdersMain.get(existingOrder.orderId).quantityUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).frequency }','${ existingOrder.priority.getDisplayString() }','${ existingOrder.patientinstructions }','${ existingOrder.pharmacistinstructions }')"></i>
                                    </span>
                                </td>
                            </tr>
                        <% } %>
                    <% } %>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <span id="button">
                                <i class="icon-plus edit-action" title="${ ui.message("ADD DRUG ORDER") }" onclick="showAddOrderToGroupWindow('CREATE DRUG ORDER','${existingDrugOrder.key}')"></i>
                                <i class="icon-trash delete-action" title="${ ui.message("Discard") }" onclick="showDiscardGroupOrderWindow('DISCARD ORDER GROUP','${existingDrugOrder.key}','${orderList}')"></i>
                            </span>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table><br/>

        <% if(existingDrugOrdersExtension.size() > 0) { %>
            <div class="pull-left">
            <button type="submit" id="confirmOrderGroup" name="action" value="GroupOrder" ng-disabled="!groupCheckBox">Group Selected</button></div>
        <% } %>
    </form>
</div>

<script>
    jq('#currentDrugOrdersTable').dataTable({
        "sPaginationType": "full_numbers",
        "bPaginate": true,
        "bAutoWidth": false,
        "bLengthChange": false,
        "ordering": false,
        "bJQueryUI": true,
        "bInfo": false,
        "bFilter": false

    });
</script>

<script type="text/javascript">    
    jq(".orderRow td:not(:first-child)").click(function(){
        jq(this).parent().children('td').slice(1, 3).css({"background": "#75b2f0","color": "white"});
    });
</script>