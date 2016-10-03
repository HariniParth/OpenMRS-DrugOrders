<%
    ui.includeCss("drugorders", "drugorders.css")
    ui.includeJavascript("drugorders", "dataTables.js")
    def orderList = "";
%>

<div id="nonActiveOrdersWindow">
    <table id="oldDrugOrdersTable">
        <thead>
            <tr>
                <th>Drug Name</th>
                <th>Start Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% if(oldDrugOrdersExtension.size() == 0 && oldDrugOrderGroups.size() == 0) { %>
                <tr><td colspan="3" align="center">No Orders Found</td></tr>
            <% } %>

            <% oldDrugOrdersExtension.each { oldDrugOrderExtension -> %>
                <% oldDrugOrdersMain.each { oldDrugOrderMain -> %>
                    <% if((oldDrugOrderMain.orderId == oldDrugOrderExtension.orderId) && (!((oldDrugOrderExtension.orderstatus).equals("Active")))) { %>

                        <tr>
                            <td class="fields">
                                <a href="#" id="oldDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ oldDrugOrderExtension.startdate }','${ oldDrugOrderExtension.drugname.getDisplayString() }','${ oldDrugOrderMain.dose }','${ oldDrugOrderMain.doseUnits.getDisplayString() }','${ oldDrugOrderMain.route.getDisplayString() }','${ oldDrugOrderMain.duration }','${ oldDrugOrderMain.durationUnits.getDisplayString() }','${ oldDrugOrderMain.quantity }','${ oldDrugOrderMain.quantityUnits.getDisplayString() }','${ oldDrugOrderMain.frequency }','${ oldDrugOrderExtension.isallergicorderreasons }','${ oldDrugOrderExtension.priority.getDisplayString() }','${ oldDrugOrderExtension.patientinstructions }','${ oldDrugOrderExtension.pharmacistinstructions }','${ oldDrugOrderExtension.comments }')">
                                    ${ oldDrugOrderExtension.drugname.getDisplayString().toUpperCase() }
                                </a>
                            </td>
                            <td>${ oldDrugOrderExtension.startdate }</td>
                            <td>
                                <span id="button">
                                    <i class="icon-edit edit-action" title="${ ui.message("Renew") }" onclick="showRenewIndividualDrugOrderWindow('RENEW DRUG ORDER','${ oldDrugOrderMain.orderId }','${ oldDrugOrderExtension.drugname.getDisplayString() }','${ oldDrugOrderMain.dose }','${ oldDrugOrderMain.doseUnits.getDisplayString() }','${ oldDrugOrderMain.route.getDisplayString() }','${ oldDrugOrderMain.duration }','${ oldDrugOrderMain.durationUnits.getDisplayString() }','${ oldDrugOrderMain.quantity }','${ oldDrugOrderMain.quantityUnits.getDisplayString() }','${ oldDrugOrderMain.frequency }','${ oldDrugOrderExtension.associateddiagnosis.getDisplayString() }','${ oldDrugOrderExtension.priority.getDisplayString() }','${ oldDrugOrderExtension.patientinstructions }','${ oldDrugOrderExtension.pharmacistinstructions }')"></i>
                                </span>
                            </td>
                        </tr>
                    <% } %>
                <% } %>
            <% } %>
    
            <% oldDrugOrderGroups.each { oldDrugOrder -> %>
                <% oldDrugOrder.value.each { oldOrder -> %>
                    <% oldDrugOrdersMain.each { oldDrugOrderMain -> %>
                        <% if((oldDrugOrderMain.orderId == oldOrder.orderId) && (!((oldOrder.orderstatus).equals("Active-Group")))) { %>
                        
                            <tr>
                                <td class="fields">
                                    <a href="#" id="oldDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ oldOrder.startdate }','${ oldOrder.drugname.getDisplayString() }','${ oldDrugOrderMain.dose }','${ oldDrugOrderMain.doseUnits.getDisplayString() }','${ oldDrugOrderMain.route.getDisplayString() }','${ oldDrugOrderMain.duration }','${ oldDrugOrderMain.durationUnits.getDisplayString() }','${ oldDrugOrderMain.quantity }','${ oldDrugOrderMain.quantityUnits.getDisplayString() }','${ oldDrugOrderMain.frequency }','${ oldOrder.isallergicorderreasons }','${ oldOrder.priority.getDisplayString() }','${ oldOrder.patientinstructions }','${ oldOrder.pharmacistinstructions }','${ oldOrder.comments }')">
                                        ${ oldOrder.drugname.getDisplayString().toUpperCase() }
                                    </a>
                                    <% orderList = orderList + oldOrder.drugname.getDisplayString() + "," %>
                                </td>
                                <td>${ oldOrder.startdate }</td>
                                <td></td>
                            </tr>
                        <% } %>
                    <% } %>
                <% } %>
                <tr>
                    <td><span class="hidden">Group Action</span></td>
                    <td></td>
                    <td>
                        <span id="button">
                            <i class="icon-edit edit-action" title="${ ui.message("Renew") }" onclick="showRenewGroupOrderWindow('RENEW ORDER GROUP','${oldDrugOrder.key}','${orderList}')"></i>
                        </span>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<script>
    jq('#oldDrugOrdersTable').dataTable({
        "sPaginationType": "full_numbers",
        "bPaginate": true,
        "bAutoWidth": false,
        "bLengthChange": true,
        "bSort": true,
        "bJQueryUI": true,
        "bInfo": false

    });
</script>