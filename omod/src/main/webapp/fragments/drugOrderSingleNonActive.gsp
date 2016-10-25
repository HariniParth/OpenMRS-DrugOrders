<%
    ui.includeCss("drugorders", "drugorders.css")
    ui.includeJavascript("drugorders", "dataTables.js")
%>

<div id="nonActiveOrdersWindow">
    <strong>Non-Active Single Orders</strong><br/><br/>
    <table id="oldDrugOrdersTable">
        <thead>
            <tr>
                <th>Drug Name</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% if(oldDrugOrdersExtension.size() == 0) { %>
                <tr><td colspan="2" align="center">No Orders Found</td></tr>
            <% } %>

            <% oldDrugOrdersExtension.each { oldDrugOrderExtension -> %>
                <% if(!((oldDrugOrderExtension.orderstatus).equals("Active"))) { %>

                    <tr class="oldOrderRow">
                        <td class="oldDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ oldDrugOrderExtension.startdate }','${ oldDrugOrderExtension.drugname.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).dose }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).doseUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).route.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).duration }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).durationUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).quantity }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).quantityUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).frequency }','${ oldDrugOrderExtension.refill }','${ oldDrugOrderExtension.isallergicorderreasons }','${ oldDrugOrderExtension.priority.getDisplayString() }','${ oldDrugOrderExtension.patientinstructions }','${ oldDrugOrderExtension.pharmacistinstructions }','${ oldDrugOrderExtension.comments }')">
                            ${ oldDrugOrderExtension.drugname.getDisplayString().toUpperCase() }
                        </td>
                        <td>
                            <span id="button">
                                <i class="icon-edit edit-action" title="${ ui.message("Renew") }" onclick="showRenewIndividualDrugOrderWindow('RENEW DRUG ORDER','${ oldDrugOrderExtension.orderId }','${ oldDrugOrderExtension.drugname.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).dose }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).doseUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).route.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).duration }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).durationUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).quantity }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).quantityUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).frequency }','${ oldDrugOrderExtension.refill }','${ oldDrugOrderExtension.refillinterval }','${ oldDrugOrderExtension.associateddiagnosis.getDisplayString() }','${ oldDrugOrderExtension.priority.getDisplayString() }','${ oldDrugOrderExtension.patientinstructions }','${ oldDrugOrderExtension.pharmacistinstructions }')"></i>
                            </span>
                        </td>
                    </tr>
                <% } %>
            <% } %>
        </tbody>
    </table>
    <br/><br/>
    
    <strong>Non-Active Group Orders</strong><br/><br/>
    <table id="oldGroupOrdersTable">
        <thead>
            <tr>
                <th>Drug Name</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% if(oldDrugOrderGroups.size() == 0) { %>
                <tr><td colspan="2" align="center">No Orders Found</td></tr>
            <% } %>
    
            <% oldDrugOrderGroups.each { oldDrugOrder -> %>
                <% def orderList = "" %>
                <% oldDrugOrder.value.each { oldOrder -> %>
                    <% if(!((oldOrder.orderstatus).equals("Active-Group"))) { %>

                        <tr class="oldOrderRow">
                            <td class="oldDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ oldOrder.startdate }','${ oldOrder.drugname.getDisplayString() }','${ oldDrugOrdersMain.get(oldOrder.orderId).dose }','${ oldDrugOrdersMain.get(oldOrder.orderId).doseUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldOrder.orderId).route.getDisplayString() }','${ oldDrugOrdersMain.get(oldOrder.orderId).duration }','${ oldDrugOrdersMain.get(oldOrder.orderId).durationUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldOrder.orderId).quantity }','${ oldDrugOrdersMain.get(oldOrder.orderId).quantityUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldOrder.orderId).frequency }','${ oldOrder.refill }','${ oldOrder.isallergicorderreasons }','${ oldOrder.priority.getDisplayString() }','${ oldOrder.patientinstructions }','${ oldOrder.pharmacistinstructions }','${ oldOrder.comments }')">
                                ${ oldOrder.drugname.getDisplayString().toUpperCase() }
                            </td>
                            <% orderList = orderList + oldOrder.drugname.getDisplayString() + "," %>
                            
                            <td></td>
                        </tr>
                    <% } %>
                <% } %>
                <tr>
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
        "bInfo": false,
        "bFilter": false

    });
</script>

<script>
    jq('#oldGroupOrdersTable').dataTable({
        "sPaginationType": "full_numbers",
        "bPaginate": true,
        "bAutoWidth": false,
        "bLengthChange": true,
        "ordering": false,
        "bJQueryUI": true,
        "bInfo": false,
        "bFilter": false

    });
</script>

<script type="text/javascript">    
    jq(".oldOrderRow").click(function(){
        jq(this).children('td').slice(0, 1).css({"background": "#75b2f0","color": "white"});
    });
</script>