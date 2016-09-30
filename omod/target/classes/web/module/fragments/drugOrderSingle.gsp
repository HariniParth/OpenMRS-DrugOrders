<%
    ui.includeCss("drugorders", "drugorders.css")
    ui.includeJavascript("drugorders", "dataTables.js")
    def orderList = "";
%>

<table id="currentDrugOrdersTable">
    <thead>
        <tr>
            <th>Drug Name</th>
            <th>Start Date</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <% if(existingDrugOrdersExtension.size() == 0 && existingDrugOrderGroups.size() == 0) { %>
            <tr><td colspan="3" align="center">No Orders Found</td></tr>
        <% } %>
        
        <% existingDrugOrdersExtension.each { existingDrugOrderExtension -> %>
            <% existingDrugOrdersMain.each { existingDrugOrderMain -> %>
                <% if((existingDrugOrderMain.orderId == existingDrugOrderExtension.orderId) && ((existingDrugOrderExtension.orderstatus).equals("Active"))) { %>

                    <tr>
                        <td class="fields">
                            <a href="#" id="existingDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingDrugOrderExtension.startdate }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingDrugOrderExtension.isallergicorderreasons }','${ existingDrugOrderExtension.priority.getDisplayString() }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')">
                                ${ existingDrugOrderExtension.drugname.getDisplayString().toUpperCase() }     
                            </a>
                        </td>
                        <td>${ existingDrugOrderExtension.startdate }</td>
                        <td>
                            <span id="button">
                                <i class="icon-pencil edit-action" title="${ ui.message("Edit") }" onclick="showEditIndividualDrugOrderWindow('EDIT DRUG ORDER','SINGLE','${ existingDrugOrderMain.orderId }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrderExtension.startdate }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingDrugOrderExtension.associateddiagnosis.getDisplayString() }','${ existingDrugOrderExtension.isallergicorderreasons }','${ existingDrugOrderExtension.priority.getDisplayString() }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')"></i>
                                <i class="icon-remove delete-action" title="${ ui.message("Delete") }" onclick="showDiscontinueIndividualDrugOrderWindow('DISCONTINUE ORDER','${ existingDrugOrderMain.orderId }','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingDrugOrderExtension.startdate }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingDrugOrderExtension.priority.getDisplayString() }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')"></i>
                            </span>
                        </td>
                    </tr>
                <% } %>
            <% } %>
        <% } %>
        
        <% existingDrugOrderGroups.each { existingDrugOrder -> %>
            <% existingDrugOrder.value.each { existingOrder -> %>
                <% existingDrugOrdersMain.each { existingDrugOrderMain -> %>
                    <% if(existingDrugOrderMain.orderId == existingOrder.orderId && existingOrder.orderstatus == "Active-Group") { %>

                        <tr>
                            <td class="fields">
                                <a href="#" id="existingDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingOrder.startdate }','${ existingOrder.drugname.getDisplayString() }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingOrder.isallergicorderreasons }','${ existingOrder.priority.getDisplayString() }','${ existingOrder.patientinstructions }','${ existingOrder.pharmacistinstructions }')">
                                    ${ existingOrder.drugname.getDisplayString().toUpperCase() }    
                                </a>
                                <% orderList = orderList + existingOrder.drugname.getDisplayString() + "," %>
                            </td>
                            <td>${ existingOrder.startdate }</td>
                            <td>
                                <span id="button">
                                    <i class="icon-pencil edit-action" title="${ ui.message("Edit") }" onclick="showEditIndividualDrugOrderWindow('EDIT DRUG ORDER','GROUP','${ existingDrugOrderMain.orderId }','${ existingOrder.drugname.getDisplayString() }','${ existingOrder.startdate }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingOrder.associateddiagnosis.getDisplayString() }','${ existingOrder.isallergicorderreasons }','${ existingOrder.priority.getDisplayString() }','${ existingOrder.patientinstructions }','${ existingOrder.pharmacistinstructions }')"></i>
                                    <i class="icon-remove delete-action" title="${ ui.message("Delete") }" onclick="showDiscontinueIndividualDrugOrderWindow('DISCONTINUE ORDER','${ existingDrugOrderMain.orderId }','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingOrder.startdate }','${ existingOrder.drugname.getDisplayString() }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingOrder.priority.getDisplayString() }','${ existingOrder.patientinstructions }','${ existingOrder.pharmacistinstructions }')"></i>
                                </span>
                            </td>
                        </tr>
                    <% } %>
                <% } %>
            <% } %>
            <tr>
                <td><span class="hidden">Group Action</span></td>
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
</table>

<script>
    jq('#currentDrugOrdersTable').dataTable({
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